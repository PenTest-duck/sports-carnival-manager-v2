import { sequelize } from "../../../../hooks.server"; 

/** @type {import('./$types').PageServerLoad} */
export async function load({ params }) {
    const slug = params.slug;

    const eventQueryResponse = await sequelize.query("CALL GetOneEvent (:id)", {
        replacements: { id: params.slug }
    });

    let event = eventQueryResponse[0]
    console.log(event);

    return { event };
};

/** @type {import('./$types').Actions} */
export const actions = {

};
