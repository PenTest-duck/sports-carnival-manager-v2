// @ts-nocheck
// Imports
import { sequelize } from "../../../hooks.server"; 
import { redirect } from "@sveltejs/kit";
import { createUserWithEmailAndPassword, updateProfile } from "firebase/auth";
import { auth } from "../../../firebase";
import { validateName } from "$lib/validation";

// Function: validateEmail()
// Purpose: check email conforms to valid format AND does not already exist in the database
// Parameters: email
// Returns: "Success" OR error message
async function validateEmail(email) {
    // Check email matches regex of valid email addresses
    const validEmailRegex = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
    if (!Boolean(email.match(validRegex))) {
        return "Invalid email"
    }

    // Fetch all rows in staff that match the email
    const existingEmail = await sequelize.query("SELECT * FROM staff WHERE email = :email", {
        replacements: { email: email }
    });

    // If any rows are returned, that means an account already exists
    if (existingEmail[0][0] != null) {
        return "Account for this email already exists"
    }

    return "Success"
}

// Function: validatePassword()
// Purpose: check password matches complexity requirements
// Parameters: password
// Returns: "Success" OR error message
function validatePassword(password) {
    // Password complexity requirement: check password length is at least 8
    if (password.length < 8) {
        return "Password too short"
    }

    // Ensure password is not too long
    if (password.length > 40) {
        return "Password too long"
    }

    // Password complexity requirement: check at least 1 lowercase letter exists in password
    if (!Boolean(password.match(/[a-z]/))) {    // Regex for lowercase letter
        return "Password must have at least 1 lowercase letter"
    }

    // Password complexity requirement: check at least 1 uppercase letter exists in password
    if (!Boolean(password.match(/[A-Z]/))) {    // Regex for uppercase letter
        return "Password must have at least 1 uppercase letter"
    }

    // Password complexity requirement: check at least 1 number exists in password
    if (!Boolean(password.match(/\d/))) {      // Regex for digit
        return "Password must have at least 1 number"
    }

    // Password complexity requirement: check at least 1 symbol exists in password
    if (!Boolean(password.match(/[`!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?~]/))) {     // Regex for special character
        return "Password must have at least 1 symbol"
    }

    return "Success"
}

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

        // Check no fields exceed 200 characters
        // MySQL strings can store up to 255 characters, but this mitigates any accidental null bytes or special characters from exceeding the limit
        if (firstName.length > 200 || lastName.length > 200 || email.length > 200) {
            return { error: "Name and email cannot exceed 200 characters" }
        }

        // Check both names only have letters
        if (!validateName(firstName) || !validateName(lastName)) {
            return { error: "Name can only have alphabet letters" }
        }

        // Validate email
        let validateEmailResult = await validateEmail(email);
        if (validateEmailResult != "Success") {
            return { error: validateEmailResult }
        }

        // Validate password
        let validatePasswordResult = validatePassword(password);
        if (validatePasswordResult != "Success") {
            return { error: validatePasswordResult }
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
