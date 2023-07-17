// @ts-nocheck
// Imports
import { sequelize } from "../../hooks.server"; 
import { validateStudent, VALID_NUMBER_REGEX } from "$lib/validation";
import { redirect } from "@sveltejs/kit";

/** @type {import('./$types').PageServerLoad} */
// Function: load()
// Purpose: upon page load, fetches array of students and houses + message
// Parameters: URL
// Returns: array of students, array of houses + message
export async function load({ url }) {
    // Fetch confirmation message from URL
    const msg = url.searchParams.get("msg");

    // Fetch list of all students
    const students = await sequelize.query("CALL GetStudents");

    // Fetch list of all houses
    const housesQueryResponse = await sequelize.query("SELECT * FROM house");
    const houses = housesQueryResponse[0];

    return { students, houses, msg };
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

        // Check no fields are empty
        if (firstName == "" || firstName == null || lastName == "" || lastName == null || houseID == "" || houseID == null || number == "" || number == null) {
            return { error: "All fields must be filled" }
        }

        // Validate input parameters
        const studentValidityMessage = validateStudent(firstName, lastName, houseID, number);
        if (studentValidityMessage != "Valid") {
            return { error: studentValidityMessage }
        }

        // Append to Students MySQL table
        try {
            await sequelize.query("INSERT INTO students VALUES (NULL, :firstName, :lastName, :houseID, :number)", {
                replacements: {
                    firstName: firstName,
                    lastName: lastName,
                    houseID: houseID,
                    number: number
                }
            });
        } catch (e) {
            console.log("Error: ", e);
            return { error: "There was an unexpected error with the server" };
        }

        // Show confirmation message
        const msg = "Student successfully added";
        throw redirect(303, "?msg=" + msg);
    },

    // Function: removeStudent()
    // Purpose: Remove student and all their results + update placings and points
    // Parameters: student ID
    // Returns: N/A OR error message
    removeStudent: async ({ request }) => {
        // Extract variable from form submission
        const data = await request.formData();
        const id = data.get("id");

        // Check id is a valid integer
        if (!Boolean(id.match(VALID_NUMBER_REGEX))) {
            return { studentRemoveError: "Invalid student ID. Please try again." };
        }

        // Invoke MySQL stored procedure to remove student and all their results, and update placings and points
        try {
            await sequelize.query('CALL RemoveStudent (:id)', {
                replacements: { id: id }
            });
        } catch (e) {
            console.log("Error: ", e);
            return { studentRemoveError: "There was an unexpected error with the server" };
        }

        // Show confirmation message
        const msg = "Student successfully removed";
        throw redirect(303, "?msg=" + msg);
    }
};