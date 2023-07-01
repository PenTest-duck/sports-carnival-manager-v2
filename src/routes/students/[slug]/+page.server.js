import { sequelize } from "../../../hooks.server"; 

/** @type {import('./$types').PageServerLoad} */
export async function load({ params }) {
    // Fetch student record given the specified StudentID
    const s = await sequelize.query("CALL GetOneStudent (:id)", {
        replacements: { id: params.slug }
    });
    const student = s[0];
    console.log(student);

    // Fetch list of all houses
    const h = await sequelize.query("SELECT * FROM house");
    const houses = h[0];

    // Fetch list of all results belonging to the specified student
    const r = await sequelize.query("SELECT * FROM results WHERE studentID = :id", {
        replacements: { id: params.slug }
    });
    const results = r[0]

    // Fetch list of all events
    // Parameter of 0 indicates 'all events' rather than a specified EventID
    const events = await sequelize.query("CALL GetEvents (0)");
    
    return { student, houses, results, events };
};

/** @type {import('./$types').Actions} */
export const actions = {
    editStudent: async ({ request, params }) => {
        // Extract variables from form submission
        const data = await request.formData();
        const id = params.slug;
        const firstName = data.get("student-first-name");
        const lastName = data.get("student-last-name");
        const houseID = data.get("student-house-id");
        const number = data.get("student-number");

        // Update Students MySQL table with new values
        await sequelize.query('UPDATE students SET firstName = :firstName, lastName = :lastName, houseID = :houseID, number = :number WHERE id = :id', {
            replacements: {
                id: id,
                firstName: firstName,
                lastName: lastName,
                houseID: houseID,
                number: number
            }
        });
    }
};