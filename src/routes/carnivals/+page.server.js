// @ts-nocheck
// Imports
import { sequelize } from "../../hooks.server"; 
import { validateCarnival } from "$lib/validation";

/** @type {import('./$types').PageServerLoad} */

// Function: load()
// Purpose: upon page load, fetches array of carnivals, carnival types, carnival locations, and staff
// Parameters: N/A
// Returns: array of carnivals, array of carnival types, array of carnival locations, array of staff
export async function load() {
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

    return { carnivals, carnivalTypes, carnivalLocations, staffs };
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
        if (name == "" || typeID == "" || date == null || startTime == null || endTime == null || locationID == "" || staffID == "") {
            return { error: "All fields must be filled" }
        }

        // Validate input parameters
        const carnivalValidityMessage = validateCarnival(name, date, startTime, endTime);
        if (carnivalValidityMessage != "Valid") {
            return { error: carnivalValidityMessage }
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
            return { error: "There was an unexpected error with the server" }
        }
    },

    // Function: removeCarnival
    // Purpose: remove carnival and its events from the database + update records and points
    // Parameters: carnival ID
    // Returns: N/A OR error message
    removeCarnival: async ({ request }) => {
        // Extract variables from form submission
        const data = await request.formData();
        const id = data.get("id");

        // Invoke MySQL stored procedure to remove carnival and all its events, and update records and points
        try {
            await sequelize.query("CALL RemoveCarnival (:id)", {
                replacements: { id: id }
            });
        } catch (e) {
            console.log("Error: ", e);
            return { error: "There was an unexpected error with the server" }
        }
    }
};
