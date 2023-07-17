// Imports
import { sequelize } from "../../hooks.server"; 

/** @type {import('./$types').PageServerLoad} */

// Function: load()
// Purpose: upon page load, fetches array of records + tutorial
// Parameters: URL
// Returns: array of records
export async function load({ url }) {
    // Fetch tutorial status
    const tutorial = url.searchParams.get("tutorial");
    
    // Fetch all records for each carnival type
    const athleticsRecords = await sequelize.query("CALL GetRecords (1)");
    const swimmingRecords = await sequelize.query("CALL GetRecords (2)");
    const crossCountryRecords = await sequelize.query("CALL GetRecords (3)");

    return { athleticsRecords, swimmingRecords, crossCountryRecords, tutorial };
};