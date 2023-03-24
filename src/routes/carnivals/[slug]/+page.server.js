import { sequelize } from "../../../hooks.server"; 

/** @type {import('./$types').PageServerLoad} */
export async function load({ params }) {
    const slug = params.slug;

    const carnivalQueryResponse = await sequelize.query("CALL GetOneCarnival (:id)", {
        replacements: { id: params.slug }
    });

    let carnival = carnivalQueryResponse[0]
    console.log(carnival);

    const events = await sequelize.query("CALL GetEvents (:id)", {
        replacements: { id: params.slug }
    });
    console.log(events);

    const eT = await sequelize.query("SELECT * FROM eventType");
    const eAG = await sequelize.query("SELECT * FROM eventAgeGroup");
    const eD = await sequelize.query("SELECT * FROM eventDivision");
    const eL = await sequelize.query("SELECT * FROM eventLocation");
    const eventTypes = eT[0];
    const eventAgeGroups = eAG[0];
    const eventDivisions = eD[0];
    const eventLocations = eL[0];

    return { slug, carnival, events, eventTypes, eventAgeGroups, eventDivisions, eventLocations };
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
        const end_time = data.get("event-end-time") === "" ? null : data.get("event-end-time");
        const locationID = data.get("event-location-id");

        await sequelize.query('CALL CreateEvent (:carnivalID, :typeID, :ageGroupID, :divisionID, :start_time, :end_time, :locationID);', {
            replacements: {
                carnivalID: carnivalID,
                typeID: typeID,
                ageGroupID: ageGroupID,
                divisionID: divisionID,
                start_time: start_time,
                end_time: end_time,
                locationID: locationID
            }
        });
    },

    removeEvent: async ({ request }) => {
        const data = await request.formData();
        const id = data.get("id");

        await sequelize.query('DELETE FROM events WHERE id = :id', {
            replacements: { id: id }
        });
    }
};
