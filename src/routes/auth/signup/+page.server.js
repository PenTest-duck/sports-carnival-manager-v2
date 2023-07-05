// @ts-nocheck
// Imports
import { sequelize } from "../../../hooks.server"; 
import { redirect } from "@sveltejs/kit";
import { createUserWithEmailAndPassword } from "firebase/auth";
import { auth } from "../../../firebase";
import { validateName, validateEmail, validatePassword } from "$lib/validation";

/** @type {import('./$types').Actions} */
export const actions = {
    // Function: signUp()
    // Purpose: validate parameters, then create new user in Firebase Auth and in the database
    // Parameters: form data (first name, last name, email, password)
    // Returns: redirection to / OR error message
    signUp: async ({ request }) => {

        // Extract variables from form submission
        const data = await request.formData();
        const firstName = data.get("first-name");
        const lastName = data.get("last-name");
        const email = data.get("email");
        const password = data.get("password");

        let uid;

        // Check no fields are empty
        if (firstName == "" || lastName == "" || email == "" || password == "") {
            return { error: "All fields must be filled" }
        }

        // Validate first name
        const firstNameValidityMessage = validateName(firstName);
        if (firstNameValidityMessage != "Valid") {
            return { error: firstNameValidityMessage }
        }

        // Validate last name
        const lastNameValidityMessage = validateName(lastName);
        if (lastNameValidityMessage != "Valid") {
            return { error: lastNameValidityMessage }
        }

        // Validate email
        let emailValidityMessage = await validateEmail(email);
        if (emailValidityMessage != "Valid") {
            return { error: emailValidityMessage }
        }

        // Validate password
        let passwordValidityMessage = validatePassword(password);
        if (passwordValidityMessage != "Valid") {
            return { error: passwordValidityMessage }
        }

        try {
            // @ts-ignore
            // API request to Firebase Auth to create account
            let user = await createUserWithEmailAndPassword(auth, email, password);
            
            // Immediately log in as the new user
            const { currentUser } = auth;
            if (currentUser) {
                uid = currentUser.uid;
            }

            // Adds user to the MySQL database
            // RoleID is set to 1 or "Staff", which is the default privilege
            await sequelize.query("INSERT INTO staff VALUES (:uid, :email, :firstName, :lastName, 1)", {
                replacements: {
                    uid: uid,
                    email: email,
                    firstName: firstName,
                    lastName: lastName
                }
            });

            // Redirect to main dashboard
            throw redirect(303, '/');

        } catch (e) {
            if (e instanceof Error) {
                console.log("Sign up error: ", e);

                // Any other errors returned by Firebase Auth is displayed as-is
                return { error: "There was an error with the database -- " + e.message };
            }
        }
    }
};
