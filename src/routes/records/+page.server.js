import { sequelize } from "../../hooks.server"; 

/** @type {import('./$types').PageServerLoad} */

// Function: load()
// Purpose: upon page load, fetches array of records
// Parameters: N/A
// Returns: array of records
export async function load() {
    
    // Fetch all records for Athletics Carnival
    const athleticsRecords = await sequelize.query("CALL GetRecords (1)");

    console.log(athleticsRecords);

    return { athleticsRecords };
};