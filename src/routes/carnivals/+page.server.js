import { sequelize, Carnival, CarnivalLocation, CarnivalType } from "../../hooks.server"; 

/** @type {import('./$types').PageServerLoad} */
export async function load() {

    const carnivals = await sequelize.query("CALL GetCarnivals");
    console.log(carnivals);

    const cT = await sequelize.query("SELECT * FROM carnivalType");
    const cL = await sequelize.query("SELECT * FROM carnivalLocation");
    const carnivalTypes = cT[0];
    const carnivalLocations = cL[0];

    const s = await sequelize.query("SELECT * FROM staff");
    const staffs = s[0];

    return { carnivals, carnivalTypes, carnivalLocations, staffs };
};

/** @type {import('./$types').Actions} */
export const actions = {
    addCarnival: async ({ request }) => {
        // Extract variables from form submission
        const data = await request.formData();
        const name = data.get("carnival-name");
        const typeID = data.get("carnival-type-id");
        const date = data.get("carnival-date") === "" ? null : data.get("carnival-date");
        const start_time = data.get("carnival-start-time")  === "" ? null : data.get("carnival-start-time");
        const end_time = data.get("carnival-end-time")  === "" ? null : data.get("carnival-end-time");
        const locationID = data.get("carnival-location-id");
        const staffID = data.get("carnival-staff-id");

        // Invoke MySQL stored procedure to create carnival
        await sequelize.query('CALL CreateCarnival (:name, :typeID, :date, :start_time, :end_time, :locationID, :staffID);', {
            replacements: {
                name: name,
                typeID: typeID,
                date: date,
                start_time: start_time,
                end_time: end_time,
                locationID: locationID,
                staffID: staffID
            }
        });
    },

    removeCarnival: async ({ request }) => {
        // Extract variable from form submission
        const data = await request.formData();
        const id = data.get("id");

        // Invoke MySQL stored procedure to remove carnival
        await sequelize.query("CALL RemoveCarnival (:id)", {
            replacements: { id: id }
        })
    }
};
