// @ts-nocheck
// Imports
import { sequelize } from "../../hooks.server"; 
import { validateCarnival, VALID_NUMBER_REGEX } from "$lib/validation";
import { redirect } from "@sveltejs/kit";

/** @type {import('./$types').PageServerLoad} */

// Function: load()
// Purpose: upon page load, fetches array of carnivals, carnival types, carnival locations, and staff + message / tutorial
// Parameters: URL path
// Returns: array of carnivals, array of carnival types, array of carnival locations, array of staff + message / tutorial
export async function load({ url }) {
    // Fetch confirmation message from URL
    const msg = url.searchParams.get("msg");

    // Fetch tutorial status from URL
    const tutorial = url.searchParams.get("tutorial");

    // Fetch list of all carnivals
    const carnivals = await sequelize.query("CALL GetCarnivals");

    // Fetch list of carnival types and carnival locations
    const carnivalTypesQueryResponse = await sequelize.query("SELECT * FROM carnivaltype");
    const carnivalLocationsQueryResponse = await sequelize.query("SELECT * FROM carnivallocation");
    const carnivalTypes = carnivalTypesQueryResponse[0];
    const carnivalLocations = carnivalLocationsQueryResponse[0];

    // Fetch list of staff
    const staffsQueryResponse = await sequelize.query("SELECT * FROM staff");
    const staffs = staffsQueryResponse[0];

    return { carnivals, carnivalTypes, carnivalLocations, staffs, msg, tutorial };
};

/** @type {import('./$types').Actions} */
export const actions = {
    // Function: addCarnival
    // Purpose: validate input parameters, then add carnival to database
    // Parameters: form data (name, type ID, date, start time, end time, location ID, staff ID)
    // Returns: N/A OR error message
    addCarnival: async ({ request }) => {
        // Extract variables from form submission
        const data = await request.formData();
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
        const carnivalValidityMessage = await validateCarnival(name, typeID, date, startTime, endTime, locationID, staffID);
        if (carnivalValidityMessage != "Valid") {
            return { carnivalError: carnivalValidityMessage }
        }

        // Invoke MySQL stored procedure to create carnival
        try {
            await sequelize.query('CALL CreateCarnival (:name, :typeID, :date, :startTime, :endTime, :locationID, :staffID);', {
                replacements: {
                    name: name,
                    typeID: typeID,
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
        const msg = "Carnival successfully added";
        throw redirect(303, "?msg=" + msg);
    },

    // Function: removeCarnival
    // Purpose: remove carnival and its events from the database + update records and points
    // Parameters: carnival ID
    // Returns: N/A OR error message
    removeCarnival: async ({ request }) => {
        // Extract variables from form submission
        const data = await request.formData();
        const id = data.get("id");

        // Check id is a valid integer
        if (!Boolean(id.match(VALID_NUMBER_REGEX))) {
            return { carnivalRemoveError: "Invalid carnival ID. Please try again." };
        }

        // Invoke MySQL stored procedure to remove carnival and all its events, and update records and points
        try {
            await sequelize.query("CALL RemoveCarnival (:id)", {
                replacements: { id: id }
            });
        } catch (e) {
            console.log("Error: ", e);
            return { carnivalRemoveError: "There was an unexpected error with the server" }
        }

        // Show confirmation message
        const msg = "Carnival successfully removed";
        throw redirect(303, "?msg=" + msg);
    }
};
