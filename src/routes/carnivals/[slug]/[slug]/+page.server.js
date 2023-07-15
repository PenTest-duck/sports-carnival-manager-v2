// @ts-nocheck
// Imports
import { sequelize } from "../../../../hooks.server";
import { validateEvent, validateResult } from "$lib/validation";
import { redirect } from "@sveltejs/kit";

/** @type {import('./$types').PageServerLoad} */
// Function: load()
// Purpose: upon page load, fetches event details and list of all results in event + message
// Parameters: URL path
// Returns: event record, array of event age groups, array of event divisions, array of students, array of results + message
export async function load({ params, url }) {
    // Fetch confirmation message from URL
    const msg = url.searchParams.get("msg");

    // Get URL path (contains carnival ID)
    const slug = params.slug;

    // Fetch event details
    const eventQueryResponse = await sequelize.query("CALL GetOneEvent (:id)", {
        replacements: { id: params.slug }
    });
    let event = eventQueryResponse[0]

    // Replace null records with "N/A"
    if (event.record == null) {
        event.record = "N/A";
    }

    // Fetch list of all event age groups and divisions
    const eventAgeGroupsQueryResponse = await sequelize.query("SELECT * FROM eventAgeGroup");
    const eventDivisionsQueryResponse = await sequelize.query("SELECT * FROM eventdivision");
    const eventAgeGroups = eventAgeGroupsQueryResponse[0];
    const eventDivisions = eventDivisionsQueryResponse[0];

    // Fetch list of all students 
    const students = await sequelize.query("CALL GetStudentsForEventResults");

    // Fetch list of results for event
    const results = await sequelize.query("CALL GetResultsForEvent (:eventID)", {
        replacements: { eventID: params.slug }
    });

    // Fetch carnival details
    const carnivalQueryResponse = await sequelize.query("CALL GetOneCarnival (:carnivalID)", {
        replacements: { carnivalID: event.carnivalID }
    });
    const carnival = carnivalQueryResponse[0]

    return { event, eventAgeGroups, eventDivisions, students, results, carnival, msg };
};

/** @type {import('./$types').Actions} */
export const actions = {
    // Function: addResult
    // Purpose: validate input parameters, then add result to database and update placings and points
    // Parameters: form data (student ID, DNF, DQ, result) + event ID (from URL path)
    // Returns: N/A OR error message
    addResult: async ({ request, params }) => {
        // Extract variables from form submission
        const data = await request.formData();
        const eventID = params.slug;
        const studentID = data.get("event-student-id");
        const dnf = data.get("event-dnf") === "on" ? true : false; // translate into Boolean values
        const dq = data.get("event-dq") === "on" ? true : false; // translate into Boolean values
        const result = data.get("event-result");

        // Check no fields are empty
        if (eventID == "" || studentID == "" || result == "") {
            return { resultError: "All fields must be filled" }
        }

        // Validate result value
        const resultValidityMessage = validateResult(result);
        if (resultValidityMessage != "Valid") {
            return { resultError: resultValidityMessage }
        }

        try {
            // Fetch event's type ID
            const typeID = await sequelize.query("SELECT typeID FROM events WHERE id = :eventID", {
                replacements: { eventID: eventID }
            })
    
            // Fetch whether the results are sorted by ascending or descending order
            const ascending = await sequelize.query("SELECT ascending FROM eventtype WHERE id = :typeID", {
                replacements: { typeID: typeID[0][0].typeID }
            });

            // Invoke MySQL stored procedure to add result to database and update placings and points
            await sequelize.query("CALL AddResult (:eventID, :studentID, :dnf, :dq, :result, :ascending)", {
                replacements: {
                    eventID: eventID,
                    studentID: studentID,
                    dnf: dnf,
                    dq: dq,
                    result: result,
                    ascending: ascending[0][0].ascending
                }
            });
        } catch (e) {
            console.log("Error: ", e);
            return { resultError: "There was an unexpected error with the server" }
        }

        // Show confirmation message
        const msg = "Result successfully added";
        throw redirect(303, "?msg=" + msg);
    }, 

    // Function: removeResult
    // Purpose: remove result from the database and update placings and points
    // Parameters: form data (result ID)
    // Returns: N/A OR error message
    removeResult: async ({ request }) => {
        // Extract variables from form submission
        const data = await request.formData();
        const id = data.get("id");

        // Invoke MySQL stored procedure to remove result from the database and update placings and points
        try {
            await sequelize.query('CALL RemoveResult (:id)', {
                replacements: { id: id }
            });
        } catch (e) {
            console.log("Error: ", e);
            return { resultRemoveError: "There was an unexpected error with the server" }
        }

        // Show confirmation message
        const msg = "Result successfully removed";
        throw redirect(303, "?msg=" + msg);
    },

    // Function: editEvent
    // Purpose: validate input parameters, then edit event in database
    // Parameters: form data (age group ID, division ID, start time) + event ID (from URL path)
    // Returns: N/A OR error message
    editEvent: async ({ request, params }) => {
        // Extract variables from form submission
        const data = await request.formData();
        const id = params.slug;
        const ageGroupID = data.get("event-age-group-id");
        const divisionID = data.get("event-division-id");
        const startTime = data.get("event-start-time")  === "" ? null : data.get("event-start-time"); // if empty, set to null
        const minTime = data.get("event-min-time") === "" ? null : data.get("event-min-time"); // if empty, set to null
        const maxTime = data.get("event-max-time") === "" ? null : data.get("event-max-time"); // if empty, set to null

        // Check no fields are empty
        if (id == "" || ageGroupID == "" || divisionID == null || startTime == null) {
            return { eventError: "All fields must be filled" }
        }

        // Validate input parameters
        const eventValidityMessage = validateEvent(startTime, minTime, maxTime);
        if (eventValidityMessage != "Valid") {
            return { eventError: eventValidityMessage }
        }

        // Update Events MySQL table with new values
        try {
            await sequelize.query('UPDATE events SET ageGroupID = :ageGroupID, divisionID = :divisionID, startTime = :startTime WHERE id = :id', {
                replacements: {
                    id: id,
                    ageGroupID: ageGroupID,
                    divisionID: divisionID,
                    startTime: startTime
                }
            });
        } catch (e) {
            console.log("Error: ", e);
            return { eventError: "There was an unexpected error with the server" }
        }

        // Show confirmation message
        const msg = "Event successfully edited";
        throw redirect(303, "?msg=" + msg);
    }
};
