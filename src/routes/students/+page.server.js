import { sequelize } from "../../hooks.server"; 

/** @type {import('./$types').PageServerLoad} */
export async function load() {

    const students = await sequelize.query("CALL GetStudents");

    const h = await sequelize.query("SELECT * FROM house");
    const houses = h[0];

    console.log(students);

    return { students, houses };
};

/** @type {import('./$types').Actions} */
export const actions = {
    addStudent: async ({ request }) => {
        const data = await request.formData();
        const firstName = data.get("student-first-name");
        const lastName = data.get("student-last-name");
        const houseID = data.get("student-house-id");
        const number = data.get("student-number");

        await sequelize.query("INSERT INTO students VALUES (NULL, :firstName, :lastName, :houseID, :number)", {
            replacements: {
                firstName: firstName,
                lastName: lastName,
                houseID: houseID,
                number: number
            }
        });
    },

    removeStudent: async ({ request }) => {
        const data = await request.formData();
        const id = data.get("id");

        await sequelize.query('DELETE FROM students WHERE id = :id', {
            replacements: { id: id }
        });
    }
};