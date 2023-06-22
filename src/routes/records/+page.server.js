import { sequelize } from "../../hooks.server"; 

/** @type {import('./$types').PageServerLoad} */
export async function load() {
    
    // Fetch all records for Athletics Carnival
    const aR = await sequelize.query("CALL GetRecords (1)");
    const athletics_records = aR;

    console.log(athletics_records);

    return { athletics_records };
};

/** @type {import('./$types').Actions} */
export const actions = {

};