// @ts-nocheck
// Imports
import { sendPasswordResetEmail } from "firebase/auth";
import { auth } from "../../../firebase";
import { redirect } from "@sveltejs/kit";
import { MAX_STR_LENGTH, VALID_EMAIL_REGEX } from "$lib/validation";

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

        // Check email is not empty
        if (email == "") {
            return { error: "An email address must be provided" }
        }

        // Check email is not too long
        if (email.length > MAX_STR_LENGTH) {
            return { error: `Email cannot exceed ${MAX_STR_LENGTH} characters` }
        }
    
        // Check email matches regex of valid email addresses
        if (!Boolean(email.match(VALID_EMAIL_REGEX))) {
            return { error: "Email is not in a valid format" }
        }
        
        try {
            // Send API Request to Firebase Auth to send a reset email 
            await sendPasswordResetEmail(auth, email);

        } catch (e) {
            if (e instanceof Error) {
                console.log("Password reset error", e);

                if (e.code == "auth/user-not-found") {
                    return { error: "User does not exist for this email" }
                }

                // Any other errors returned by Firebase Auth is displayed as-is
                return { error: "There was an error with the database -- " + e.message };
            }
        }

        // If password reset email sent, redirect to login page
        const msg = "Password reset email sent"
        throw redirect(303, '/auth/login?msg=' + msg);
    }
};