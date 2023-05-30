import { sequelize } from "../../../hooks.server"; 

/** @type {import('./$types').PageServerLoad} */
export async function load({ params }) {
    const slug = params.slug;

    const carnivalQueryResponse = await sequelize.query("CALL GetOneCarnival (:id)", {
        replacements: { id: params.slug }
    });

    let carnival = carnivalQueryResponse[0]
    console.log(carnival);

    const cL = await sequelize.query("SELECT * FROM carnivalLocation");
    const carnivalLocations = cL[0];
    const s = await sequelize.query("SELECT * FROM staff");
    const staffs = s[0];

    const events = await sequelize.query("CALL GetEvents (:id)", {
        replacements: { id: params.slug }
    });
    console.log(events);

    const eT = await sequelize.query("SELECT * FROM eventType WHERE carnivalTypeID = :carnivalTypeID", {
        // @ts-ignore
        replacements: { carnivalTypeID: carnival.typeID }
    });
    const eAG = await sequelize.query("SELECT * FROM eventAgeGroup");
    const eD = await sequelize.query("SELECT * FROM eventDivision");
    const eventTypes = eT[0];
    const eventAgeGroups = eAG[0];
    const eventDivisions = eD[0];

    return { slug, carnival, carnivalLocations, staffs, events, eventTypes, eventAgeGroups, eventDivisions };
};

/** @type {import('./$types').Actions} */
export const actions = {
    addEvent: async ({ request, params }) => {
        const data = await request.formData();
        const carnivalID = params.slug;
        const typeID = data.get("event-type-id");
        const ageGroupID = data.get("event-age-group-id");
        const divisionID = data.get("event-division-id");
        const start_time = data.get("event-start-time") === "" ? null : data.get("event-start-time");

        await sequelize.query('CALL CreateEvent (:carnivalID, :typeID, :ageGroupID, :divisionID, :start_time);', {
            replacements: {
                carnivalID: carnivalID,
                typeID: typeID,
                ageGroupID: ageGroupID,
                divisionID: divisionID,
                start_time: start_time,
            }
        });
    },

    removeEvent: async ({ request }) => {
        const data = await request.formData();
        const id = data.get("id");

        /*await sequelize.query('DELETE FROM events WHERE id = :id', {
            replacements: { id: id }
        });*/
    },

    editCarnival: async ({ request, params }) => {
        const data = await request.formData();
        const id = params.slug;
        const name = data.get("carnival-name");
        const date = data.get("carnival-date") === "" ? null : data.get("carnival-date");
        const start_time = data.get("carnival-start-time")  === "" ? null : data.get("carnival-start-time");
        const end_time = data.get("carnival-end-time")  === "" ? null : data.get("carnival-end-time");
        const locationID = data.get("carnival-location-id");
        const staffID = data.get("carnival-staff-id");

        await sequelize.query('UPDATE carnivals SET name = :name, date = :date, startTime = :startTime, endTime = :endTime, locationID = :locationID, staffID = :staffID WHERE id = :id', {
            replacements: {
                id: id,
                name: name,
                date: date,
                startTime: start_time,
                endTime: end_time,
                locationID: locationID,
                staffID: staffID
            }
        });
    }
};
