import { sequelize } from "../../../hooks.server"; 

/** @type {import('./$types').PageServerLoad} */
export async function load({ params }) {
    const student = await sequelize.query("CALL GetOneStudent (:id)", {
        replacements: { id: params.slug }
    });
    console.log(student);
    
};

/** @type {import('./$types').Actions} */
export const actions = {
    
};