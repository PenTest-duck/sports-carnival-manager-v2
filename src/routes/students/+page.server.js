// Imports
import { sequelize } from "../../hooks.server"; 
import { validateName, validateNumber } from "$lib/validation";

/** @type {import('./$types').PageServerLoad} */
// Function: load()
// Purpose: upon page load, fetches array of students and houses
// Parameters: N/A
// Returns: array of students, array of houses
export async function load() {

    // Fetch list of all students
    const students = await sequelize.query("CALL GetStudents");

    // Fetch list of all houses
    const housesQueryResponse = await sequelize.query("SELECT * FROM house");
    const houses = housesQueryResponse[0];

    console.log(students);

    return { students, houses };
};

/** @type {import('./$types').Actions} */
export const actions = {
    // Function: addStudent
    // Purpose: validate input parameters, then add student to database
    // Parameters: form data (first name, last name, house ID, student number)
    // Returns: N/A OR error message
    addStudent: async ({ request }) => {

        // Extract variables from form submission
        const data = await request.formData();
        const firstName = data.get("student-first-name");
        const lastName = data.get("student-last-name");
        const houseID = data.get("student-house-id");
        const number = data.get("student-number");

        // Validate first and last name
        if (!validateName(firstName) || !validateName(lastName)) {
            return { error: "Invalid name" }
        }

        // Validate number
        if (!validateNumber(number)) {
            return { error: "Invalid number" }
        }

        // Append to Students MySQL table
        await sequelize.query("INSERT INTO students VALUES (NULL, :firstName, :lastName, :houseID, :number)", {
            replacements: {
                firstName: firstName,
                lastName: lastName,
                houseID: houseID,
                number: number
            }
        });
    },

    // Function: removeStudent()
    // Purpose: 
    // Parameters: student ID
    // Returns: 
    removeStudent: async ({ request }) => {
        // Extract variable from form submission
        const data = await request.formData();
        const id = data.get("id");

        // Remove from Students MySQL table by ID
        await sequelize.query('DELETE FROM students WHERE id = :id', {
            replacements: { id: id }
        });
    }
};