import { sequelize } from "../../hooks.server"; 

/** @type {import('./$types').PageServerLoad} */
export async function load() {

    await sequelize.query("CALL CalculateHousePlacings");

    const h = await sequelize.query("SELECT * FROM house ORDER BY placing");
    const houses = h[0];

    console.log(houses);

    return { houses };
};

/** @type {import('./$types').Actions} */
export const actions = {

};