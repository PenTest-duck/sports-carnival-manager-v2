import { sequelize } from "../../../../hooks.server"; 

/** @type {import('./$types').PageServerLoad} */
export async function load({ params }) {
    const slug = params.slug;

    const eventQueryResponse = await sequelize.query("CALL GetOneEvent (:id)", {
        replacements: { id: params.slug }
    });

    let event = eventQueryResponse[0]
    console.log(event);

    const students = await sequelize.query("CALL GetStudentsForEventResults");

    const results = await sequelize.query("CALL GetResultsForEvent (:eventID)", {
        replacements: { eventID: params.slug }
    })

    console.log(results);

    return { event, students, results };
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

        console.log(dnf);

        await sequelize.query("INSERT INTO results VALUES (NULL, :eventID, :studentID, :dnf, :dq, :result)", {
            replacements: {
                eventID: eventID,
                studentID: studentID,
                dnf: dnf,
                dq: dq,
                result: result
            }
        })
    }, 

    removeResult: async ({ request }) => {
        const data = await request.formData();
        const id = data.get("id");

        await sequelize.query('DELETE FROM results WHERE id = :id', {
            replacements: { id: id }
        });
    }
};
