// @ts-nocheck
// Imports
import { sequelize } from "../../../hooks.server"; 
import { validateCarnival, validateEvent, VALID_NUMBER_REGEX } from "$lib/validation";
import { redirect, error } from "@sveltejs/kit";

/** @type {import('./$types').PageServerLoad} */
// Function: load()
// Purpose: upon page load, fetches carnival details and list of all events + message
// Parameters: URL path
// Returns: carnival record, array of carnival locations, array of staff, array of events, array of event types, array of event age groups, array of event divisions + message
export async function load({ params, url }) {
    // Fetch confirmation message from URL
    const msg = url.searchParams.get("msg");

    // Get URL path (contains carnival ID) + check that it only contains numbers
    const slug = params.slug;
    if (!slug.match(VALID_NUMBER_REGEX)) {
        throw error("404", "Sorry, you have an invalid carnival ID in your URL.");
    }

    // Fetch carnival details
    const carnivalQueryResponse = await sequelize.query("CALL GetOneCarnival (:id)", {
        replacements: { id: slug }
    });
    const carnival = carnivalQueryResponse[0]

    // 404 if carnival doesn't exist
    if (carnival == null) {
        throw error("404", "Sorry, that carnival doesn't exist.");
    }

    // Fetch list of all carnival locations
    const carnivalLocationsQueryResponse = await sequelize.query("SELECT * FROM carnivallocation");
    const carnivalLocations = carnivalLocationsQueryResponse[0];

    // Fetch list of all staff
    const staffsQueryResponse = await sequelize.query("SELECT * FROM staff");
    const staffs = staffsQueryResponse[0];

    // Fetch list of all events in the carnival
    const events = await sequelize.query("CALL GetEvents (:id)", {
        replacements: { id: params.slug }
    });

    // Fetch list of all event types, event age groups, event divisions
    const eventTypesQueryResponse = await sequelize.query("SELECT * FROM eventtype WHERE carnivalTypeID = :carnivalTypeID", {
        replacements: { carnivalTypeID: carnival.typeID }
    });
    const eventAgeGroupsQueryResponse = await sequelize.query("SELECT * FROM eventAgeGroup");
    const eventDivisionsQueryResponse = await sequelize.query("SELECT * FROM eventdivision");
    const eventTypes = eventTypesQueryResponse[0];
    const eventAgeGroups = eventAgeGroupsQueryResponse[0];
    const eventDivisions = eventDivisionsQueryResponse[0];

    return { slug, carnival, carnivalLocations, staffs, events, eventTypes, eventAgeGroups, eventDivisions, msg };
};

/** @type {import('./$types').Actions} */
export const actions = {
    // Function: addEvent
    // Purpose: validate input parameters, then add event to database
    // Parameters: form data (type ID, age group ID, division ID, start time + carnival start and end times) + carnival ID (from URL path)
    // Returns: N/A OR error message
    addEvent: async ({ request, params }) => {
        // Extract variables from form submission
        const data = await request.formData();
        const carnivalID = params.slug;
        const typeID = data.get("event-type-id");
        const ageGroupID = data.get("event-age-group-id");
        const divisionID = data.get("event-division-id");
        const startTime = data.get("event-start-time") === "" ? null : data.get("event-start-time"); // if empty, set to null
        const minTime = data.get("event-min-time") === "" ? null : data.get("event-min-time"); // if empty, set to null
        const maxTime = data.get("event-max-time") === "" ? null : data.get("event-max-time"); // if empty, set to null

        // Check no fields are empty
        if (carnivalID == "" || carnivalID == null || typeID == "" || typeID == null || ageGroupID == "" || ageGroupID == null || divisionID == "" || divisionID == null|| startTime == null) {
            return { eventError: "All fields must be filled" }
        }

        // Validate input parameters
        const eventValidityMessage = await validateEvent("add", carnivalID, typeID, ageGroupID, divisionID, startTime, minTime, maxTime);
        if (eventValidityMessage != "Valid") {
            return { eventError: eventValidityMessage }
        }

        // Invoke MySQL stored procedure to create event
        try {
            await sequelize.query('CALL CreateEvent (:carnivalID, :typeID, :ageGroupID, :divisionID, :startTime);', {
                replacements: {
                    carnivalID: carnivalID,
                    typeID: typeID,
                    ageGroupID: ageGroupID,
                    divisionID: divisionID,
                    startTime: startTime,
                }
            });
        } catch (e) {
            console.log("Error: ", e);
            return { eventError: "There was an unexpected error with the server" }
        }

        // Show confirmation message
        const msg = "Event successfully added";
        throw redirect(303, "?msg=" + msg);
    },

    // Function: removeEvent
    // Purpose: remove event and its results + update records and points
    // Parameters: event ID
    // Returns: N/A OR error message
    removeEvent: async ({ request }) => {
        // Extract variables from form submission
        const data = await request.formData();
        const id = data.get("id");

        // Check id is a valid integer
        if (!Boolean(id.match(VALID_NUMBER_REGEX))) {
            return { eventRemoveError: "Invalid event ID. Please try again." };
        }

        // Invoke MySQL stored procedure to remove event and all its results, and update records and points
        try {
            await sequelize.query('CALL RemoveEvent (:id)', {
                replacements: { id: id }
            });
        } catch (e) {
            console.log("Error: ", e);
            return { eventRemoveError: "There was an unexpected error with the server" }
        }

        // Show confirmation message
        const msg = "Event successfully removed";
        throw redirect(303, "?msg=" + msg);
    },

    // Function: editCarnival
    // Purpose: validate input parameters, then update database with new values
    // Parameters: form data (name, type ID, date, start time, end time, location ID, staff ID)
    // Returns: N/A OR error message
    editCarnival: async ({ request, params }) => {
        // Extract variables from form submission
        const data = await request.formData();
        const id = params.slug;
        const name = data.get("carnival-name");
        const typeID = data.get("carnival-type-id");
        const date = data.get("carnival-date") === "" ? null : data.get("carnival-date"); // if empty, set to null
        const startTime = data.get("carnival-start-time")  === "" ? null : data.get("carnival-start-time"); // if empty, set to null
        const endTime = data.get("carnival-end-time")  === "" ? null : data.get("carnival-end-time"); // if empty, set to null
        const locationID = data.get("carnival-location-id");
        const staffID = data.get("carnival-staff-id");

        // Check no fields are empty
        if (name == "" || name == null || date == null || typeID == "" || typeID == null || startTime == null || endTime == null || locationID == "" || locationID == null || staffID == "" || staffID == null) {
            return { carnivalError: "All fields must be filled" }
        }

        // Validate input parameters
        const carnivalValidityMessage = validateCarnival(name, typeID, date, startTime, endTime, locationID, staffID);
        if (carnivalValidityMessage != "Valid") {
            return { carnivalError: carnivalValidityMessage }
        }

        // Update Carnivals MySQL table with new values
        try {
            await sequelize.query('UPDATE carnivals SET name = :name, date = :date, startTime = :startTime, endTime = :endTime, locationID = :locationID, staffID = :staffID WHERE id = :id', {
                replacements: {
                    id: id,
                    name: name,
                    date: date,
                    startTime: startTime,
                    endTime: endTime,
                    locationID: locationID,
                    staffID: staffID
                }
            });
        } catch (e) {
            console.log("Error: ", e);
            return { carnivalError: "There was an unexpected error with the server" }
        }

        // Show confirmation message
        const msg = "Carnival successfully edited";
        throw redirect(303, "?msg=" + msg);
    }
};
