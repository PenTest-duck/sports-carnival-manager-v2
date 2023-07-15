// Imports
import { sequelize } from "../../../hooks.server"; 
import { validateStudent } from "$lib/validation";
import { redirect } from "@sveltejs/kit";

/** @type {import('./$types').PageServerLoad} */
// Function: load()
// Purpose: upon page load, fetches array of students, houses, results, and events + message
// Parameters: URL
// Returns: array of students, array of houses, array of results, array of events + message
export async function load({ params, url }) {
    // Fetch confirmation message from URL
    const msg = url.searchParams.get("msg");

    // Fetch student record given the specified StudentID
    const studentsQueryResponse = await sequelize.query("CALL GetOneStudent (:id)", {
        replacements: { id: params.slug }
    });
    const student = studentsQueryResponse[0];

    // Fetch list of all houses
    const housesQueryResponse = await sequelize.query("SELECT * FROM house");
    const houses = housesQueryResponse[0];

    // Fetch list of all results belonging to the specified student
    const resultsQueryResponse = await sequelize.query("SELECT * FROM results WHERE studentID = :id", {
        replacements: { id: params.slug }
    });
    const results = resultsQueryResponse[0];

    // Fetch list of all events
    // Parameter of 0 indicates 'all events' rather than a specified EventID
    const events = await sequelize.query("CALL GetEvents (0)");

    // Fetch list of all carnivals
    const carnivals = await sequelize.query("CALL GetCarnivals");
    
    return { student, houses, results, events, carnivals, msg };
};

/** @type {import('./$types').Actions} */
export const actions = {
    // Function: editStudent
    // Purpose: validate input parameters, then update database with new values
    // Parameters: form data (first name, last name, house ID, student number) + slug (URL)
    // Returns: N/A OR error message
    editStudent: async ({ request, params }) => {
        // Extract variables from form submission
        const data = await request.formData();
        const id = params.slug;
        const firstName = data.get("student-first-name");
        const lastName = data.get("student-last-name");
        const houseID = data.get("student-house-id");
        const number = data.get("student-number");

        // Check no fields are empty
        if (firstName == "" || lastName == "" || houseID == "" || number == "") {
            return { error: "All fields must be filled" }
        }

        // Validate input parameters
        const studentValidityMessage = validateStudent(firstName, lastName, number);
        if (studentValidityMessage != "Valid") {
            return { error: studentValidityMessage }
        }

        // Update Students MySQL table with new values
        try {
            await sequelize.query('UPDATE students SET firstName = :firstName, lastName = :lastName, houseID = :houseID, number = :number WHERE id = :id', {
                replacements: {
                    id: id,
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
        const msg = "Student successfully edited";
        throw redirect(303, "?msg=" + msg);
    }
};