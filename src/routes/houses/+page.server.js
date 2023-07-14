// @ts-nocheck
// Imports
import { sequelize } from "../../hooks.server"; 

/** @type {import('./$types').PageServerLoad} */

// Function: load()
// Purpose: upon page load, updates house placings and fetches array of houses
// Parameters: N/A
// Returns: array of house records, ordered by their placing
export async function load() {

    // Fetch list of all carnivals
    const carnivals = await sequelize.query("CALL GetCarnivals");

    if (carnivals.length > 0) {
        // Fetch list of all houses, sorted by placing
        const houses = await sequelize.query("CALL GetHouses");
        console.log(houses);

        return { houses, carnivals };
    }

    return { carnivals };
};

/** @type {import('./$types').Actions} */
export const actions = {
    
};
