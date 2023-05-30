import { sequelize } from "../../hooks.server"; 

/** @type {import('./$types').PageServerLoad} */
export async function load() {

    await sequelize.query("CALL CalculateRecord");

    const aR = await sequelize.query("CALL GetRecords (1)");
    const athletics_records = aR[0];

    console.log(athletics_records);

    return { athletics_records };
};

/** @type {import('./$types').Actions} */
export const actions = {

};