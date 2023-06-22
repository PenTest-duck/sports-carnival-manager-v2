// @ts-nocheck
import { sendPasswordResetEmail } from "firebase/auth";
import { auth } from "../../../firebase";
import { redirect } from "@sveltejs/kit";

// Check email conforms to valid format
function validateEmail(email) {
    const validRegex = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
    
    if (!Boolean(email.match(validRegex))) {
        return false
    }
    
    return true
}

/** @type {import('./$types').Actions} */
export const actions = {
    resetPassword: async ({ request }) => {

        // Extract variables from form submission
        const data = await request.formData();
        const email = data.get("email");
        
        try {
            if (!validateEmail(email)) {
                return { error: "Invalid email" }
            }

            // Send API Request to Firebase Auth to send a reset email 
            await sendPasswordResetEmail(auth, email);

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