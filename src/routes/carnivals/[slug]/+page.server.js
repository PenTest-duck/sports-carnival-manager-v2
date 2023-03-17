import { sequelize, Carnival, CarnivalLocation, CarnivalType } from "../../../hooks.server"; 

/** @type {import('./$types').PageServerLoad} */
export async function load({ params }) {
    const carnivals = await sequelize.query("CALL GetOneCarnival (:id)", {
        replacements: { id: params.slug }
    });

    let carnival = carnivals[0]
    console.log(carnival);

    return { carnival };
};

/** @type {import('./$types').Actions} */
export const actions = {
    
};
