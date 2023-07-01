// @ts-nocheck
// Imports
import { sendPasswordResetEmail } from "firebase/auth";
import { auth } from "../../../firebase";
import { redirect } from "@sveltejs/kit";

// Function: validateEmail()
// Purpose: check email address conforms to valid format
// Parameters: email
// Returns: True (valid) or False (invalid)
function validateEmail(email) {
    // Check email matches regex of valid email addresses
    const validEmailRegex = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
    const emailIsValid = Boolean(email.match(validEmailRegex));
    
    return emailIsValid;
}

/** @type {import('./$types').Actions} */
export const actions = {
    // Function: resetPassword()
    // Purpose: validates email, then sends password reset email OR returns error message
    // Parameters: form data (email)
    // Returns: redirection to /auth/login OR error message
    resetPassword: async ({ request }) => {

        // Extract variables from form submission
        const data = await request.formData();
        const email = data.get("email");
        
        try {
            // Check email address is valid
            if (!validateEmail(email)) {
                return { error: "Invalid email" }
            }

            // Send API Request to Firebase Auth to send a reset email 
            await sendPasswordResetEmail(auth, email);

            // If password reset email sent, redirect to login page
            throw redirect(303, '/auth/login');

        } catch (e) {
            if (e instanceof Error) {
                console.log("Password reset error", e);

                if (e.code == "auth/user-not-found") {
                    return { error: "User for this email does not exist" }
                }

                // Any other errors returned by Firebase Auth is displayed as-is
                return { error: "There was an error with the database -- " + e.message };
            }
        }
    }
};