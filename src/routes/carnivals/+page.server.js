import { sequelize, Carnival, CarnivalLocation, CarnivalType } from "../../hooks.server"; 

/** @type {import('./$types').PageServerLoad} */
export async function load() {

    /*const carnivals = await Carnival.findAll({
        include: [{ model: CarnivalType }, { model: CarnivalLocation }],
        raw: true,
        order: [
            ["date", "ASC"],
            ["startTime", "ASC"],
        ]
    });*/
    const carnivals = await sequelize.query("CALL GetCarnivals");
    console.log(carnivals);

    const cT = await sequelize.query("SELECT * FROM carnivalType");
    const cL = await sequelize.query("SELECT * FROM carnivalLocation");
    const carnivalTypes = cT[0];
    const carnivalLocations = cL[0];

    return { carnivals, carnivalTypes, carnivalLocations };
};

/** @type {import('./$types').Actions} */
export const actions = {
    addCarnival: async ({ request }) => {
        const data = await request.formData();
        const name = data.get("carnival-name");
        const typeID = data.get("carnival-type-id");
        const date = data.get("carnival-date") === "" ? null : data.get("carnival-date");
        const start_time = data.get("carnival-start-time")  === "" ? null : data.get("carnival-start-time");
        const end_time = data.get("carnival-end-time")  === "" ? null : data.get("carnival-end-time");
        const locationID = data.get("carnival-location-id");

        await sequelize.query('CALL CreateCarnival (:name, :typeID, :date, :start_time, :end_time, :locationID);', {
            replacements: {
                name: name,
                typeID: typeID,
                date: date,
                start_time: start_time,
                end_time: end_time,
                locationID: locationID
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
