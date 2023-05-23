// @ts-nocheck
import { sequelize } from "../../../../hooks.server"; 

/** @type {import('./$types').PageServerLoad} */
export async function load({ params }) {
    const slug = params.slug;

    const eventQueryResponse = await sequelize.query("CALL GetOneEvent (:id)", {
        replacements: { id: params.slug }
    });

    let event = eventQueryResponse[0]
    if (event.record == null) {
        event.record = "N/A";
    }
    console.log(event);

    const eAG = await sequelize.query("SELECT * FROM eventAgeGroup");
    const eD = await sequelize.query("SELECT * FROM eventDivision");
    const eventAgeGroups = eAG[0];
    const eventDivisions = eD[0];

    const students = await sequelize.query("CALL GetStudentsForEventResults");

    const results = await sequelize.query("CALL GetResultsForEvent (:eventID)", {
        replacements: { eventID: params.slug }
    });
    
    /*if (event.type == "Long Jump" || event.type == "High Jump" || event.type == "Shot Put") {
        results.reverse();
    }*/

    console.log(results);

    return { event, eventAgeGroups, eventDivisions, students, results };
};

/** @type {import('./$types').Actions} */
export const actions = {
    addResult: async ({ request, params }) => {
        const data = await request.formData();
        const eventID = params.slug;
        const studentID = data.get("event-student-id");
        const dnf = data.get("event-dnf") === "on" ? true : false;
        const dq = data.get("event-dq") === "on" ? true : false;
        const result = data.get("event-result");

        const ascending = await sequelize.query("SELECT ascending FROM eventType WHERE id = :eventID", {
            replacements: { eventID: eventID }
        });

        await sequelize.query("CALL AddResult (:eventID, :studentID, :dnf, :dq, :result, :ascending)", {
            replacements: {
                eventID: eventID,
                studentID: studentID,
                dnf: dnf,
                dq: dq,
                result: result,
                ascending: ascending[0][0].ascending
            }
        });
    }, 

    removeResult: async ({ request }) => {
        const data = await request.formData();
        const id = data.get("id");

        await sequelize.query('DELETE FROM results WHERE id = :id', {
            replacements: { id: id }
        });
    },

    editEvent: async ({ request, params }) => {
        const data = await request.formData();
        const id = params.slug;
        const ageGroupID = data.get("event-age-group-id");
        const divisionID = data.get("event-division-id");
        const startTime = data.get("event-start-time")  === "" ? null : data.get("event-start-time");

        await sequelize.query('UPDATE events SET ageGroupID = :ageGroupID, divisionID = :divisionID, startTime = :startTime WHERE id = :id', {
            replacements: {
                id: id,
                ageGroupID: ageGroupID,
                divisionID: divisionID,
                startTime: startTime
            }
        });
    }
};
