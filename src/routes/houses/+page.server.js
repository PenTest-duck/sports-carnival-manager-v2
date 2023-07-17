// @ts-nocheck
// Imports
import { sequelize } from "../../hooks.server"; 

/** @type {import('./$types').PageServerLoad} */

// Function: load()
// Purpose: upon page load, updates house placings and fetches array of houses + tutorial
// Parameters: URL
// Returns: array of house records, ordered by their placing
export async function load({ url }) {
    // Fetch tutorial status
    const tutorial = url.searchParams.get("tutorial");

    // Fetch list of all carnivals
    const carnivals = await sequelize.query("CALL GetCarnivals");

    if (carnivals.length > 0) {
        // Fetch list of all houses, sorted by placing
        const houses = await sequelize.query("CALL GetHouses");

        return { houses, carnivals, tutorial };
    }

    return { carnivals, tutorial };
};

/** @type {import('./$types').Actions} */
export const actions = {
    
};
