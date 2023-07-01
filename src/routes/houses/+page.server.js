// Imports
import { sequelize } from "../../hooks.server"; 

/** @type {import('./$types').PageServerLoad} */

// Function: load()
// Purpose: upon page load, updates house placings and fetches array of houses
// Parameters: N/A
// Returns: array of house records, ordered by their placing
export async function load() {

    // Update placings for each house on the MySQL database
    await sequelize.query("CALL CalculateHousePlacings");

    // Fetch list of all houses, sorted by placing
    const housesQueryResponse = await sequelize.query("SELECT * FROM house ORDER BY placing");
    const houses = housesQueryResponse[0];

    console.log(houses);

    return { houses };
};