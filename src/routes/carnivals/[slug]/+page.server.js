// @ts-nocheck
// Imports
import { sequelize } from "../../../hooks.server"; 
import { validateTime } from "$lib/validation";

/** @type {import('./$types').PageServerLoad} */
// Function: load()
// Purpose: upon page load, fetches carnival details and list of all events
// Parameters: URL path
// Returns: carnival record, array of carnival locations, array of staff, array of events, array of event types, array of event age groups, array of event divisions
export async function load({ params }) {
    // Get URL path (contains carnival ID)
    const slug = params.slug;

    // Fetch carnival details
    const carnivalQueryResponse = await sequelize.query("CALL GetOneCarnival (:id)", {
        replacements: { id: params.slug }
    });
    let carnival = carnivalQueryResponse[0]

    // Fetch list of all carnival locations
    const carnivalLocationsQueryResponse = await sequelize.query("SELECT * FROM carnivalLocation");
    const carnivalLocations = carnivalLocationsQueryResponse[0];

    // Fetch list of all staff
    const staffsQueryResponse = await sequelize.query("SELECT * FROM staff");
    const staffs = staffsQueryResponse[0];

    // Fetch list of all events in the carnival
    const events = await sequelize.query("CALL GetEvents (:id)", {
        replacements: { id: params.slug }
    });

    // Fetch list of all event types, event age groups, event divisions
    const eventTypesQueryResponse = await sequelize.query("SELECT * FROM eventType WHERE carnivalTypeID = :carnivalTypeID", {
        replacements: { carnivalTypeID: carnival.typeID }
    });
    const eventAgeGroupsQueryResponse = await sequelize.query("SELECT * FROM eventAgeGroup");
    const eventDivisionsQueryResponse = await sequelize.query("SELECT * FROM eventDivision");
    const eventTypes = eventTypesQueryResponse[0];
    const eventAgeGroups = eventAgeGroupsQueryResponse[0];
    const eventDivisions = eventDivisionsQueryResponse[0];

    return { slug, carnival, carnivalLocations, staffs, events, eventTypes, eventAgeGroups, eventDivisions };
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
        if (carnivalID == "" || typeID == "" || ageGroupID == "" || divisionID == "" || startTime == null || minTime == null || maxTime == null) {
            return { eventError: "All fields must be filled" }
        }

        // Validate start time
        const startTimeValidityMessage = validateTime(startTime);
        if (startTimeValidityMessage != "Valid") {
            return { eventError: startTimeValidityMessage }
        }

        // Validate start time is within range of carnival start and end times
        // Direct string comparison possible as all are in 24-hour format
        if (startTime < minTime || startTime > maxTime) {
            return { eventError: "Event start time must be between carnival start and end times" }
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
    },

    // Function: removeEvent
    // Purpose: remove event from the database
    // Parameters: event ID
    // Returns: N/A
    removeEvent: async ({ request }) => {
        const data = await request.formData();
        const id = data.get("id");

        /*await sequelize.query('DELETE FROM events WHERE id = :id', {
            replacements: { id: id }
        });*/
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
        const date = data.get("carnival-date") === "" ? null : data.get("carnival-date"); // if empty, set to null
        const startTime = data.get("carnival-start-time")  === "" ? null : data.get("carnival-start-time"); // if empty, set to null
        const endTime = data.get("carnival-end-time")  === "" ? null : data.get("carnival-end-time"); // if empty, set to null
        const locationID = data.get("carnival-location-id");
        const staffID = data.get("carnival-staff-id");

        // Check no fields are empty
        if (name == "" || typeID == "" || date == null || startTime == null || endTime == null || locationID == "" || staffID == "") {
            return { carnivalError: "All fields must be filled" }
        }

        // Validate name
        const nameValidityMessage = validateName(name);
        if (nameValidityMessage != "Valid") {
            return { carnivalError: nameValidityMessage }
        }

        // Validate date
        const dateValidityMessage = validateDate(date);
        if (dateValidityMessage != "Valid") {
            return { carnivalError: dateValidityMessage }
        }

        // Validate start time
        const startTimeValidityMessage = validateTime(startTime);
        if (startTimeValidityMessage != "Valid") {
            return { carnivalError: startTimeValidityMessage }
        }

        // Validate end time
        const endTimeValidityMessage = validateTime(endTime);
        if (endTimeValidityMessage != "Valid") {
            return { carnivalError: endTimeValidityMessage }
        }

        // Check end time is not before start time
        // Direct string comparison possible as both are in 24-hour format
        if (endTime < startTime) {
            return { carnivalError: "End time cannot be before start time" }
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
    }
};
