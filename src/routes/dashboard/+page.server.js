import { sequelize, Carnival } from "../../hooks.server"; 

/** @type {import('./$types').PageServerLoad} */
export async function load() {
    const carnivals = await Carnival.findAll({
        raw: true,
        order: [
            ["date", "ASC"],
            ["startTime", "ASC"],
        ]
    });

    console.log(carnivals);

    return { carnivals };
};

/** @type {import('./$types').Actions} */
export const actions = {
    addCarnival: async ({ request }) => {
        const data = await request.formData();
        const name = data.get("carnival-name");
        const type = data.get("carnival-type");
        const date = data.get("carnival-date") === "" ? null : data.get("carnival-date");
        const start_time = data.get("carnival-start-time")  === "" ? null : data.get("carnival-start-time");
        const end_time = data.get("carnival-end-time")  === "" ? null : data.get("carnival-end-time");
        const location = data.get("carnival-location");

        await sequelize.query('CALL CreateCarnival (:name, :type, :date, :start_time, :end_time, :location);', {
            replacements: {
                name: name,
                type: type,
                date: date,
                start_time: start_time,
                end_time: end_time,
                location: location
            }
        });
    },

    removeCarnival: async ({ request }) => {
        const data = await request.formData();
        const id = data.get("id");

        await Carnival.destroy({
            where: {id: id}
        });
    }
};
