import { sequelize } from "../../hooks.server"; 

/** @type {import('./$types').PageServerLoad} */
export async function load() {

    // Update placings for each house on the MySQL database
    await sequelize.query("CALL CalculateHousePlacings");

    // Fetch list of all houses, sorted by placing
    const h = await sequelize.query("SELECT * FROM house ORDER BY placing");
    const houses = h[0];

    console.log(houses);

    return { houses };
};

/** @type {import('./$types').Actions} */
export const actions = {

};