// @ts-nocheck
import { signInWithEmailAndPassword } from "firebase/auth";
import { auth } from "../../../firebase";
import { redirect } from "@sveltejs/kit";

/** @type {import('./$types').Actions} */
export const actions = {
    logIn: async ({ request }) => {
        
        // Extract variables from form submission
        const data = await request.formData();
        const email = data.get("email");
        const password = data.get("password");
        
        try {
            // API request to Firebase Auth to authenticate user and return the found user record
            let user = await signInWithEmailAndPassword(auth, email, password);

            // If logged in, redirect to dashboard
            throw redirect(303, '/');

        } catch (e) {
            if (e instanceof Error) {
                console.log("Log in error", e);

                if (e.code == "auth/user-not-found") {
                    return { error: "User does not exist" }
                }

                if (e.code == "auth/wrong-password") {
                    return { error: "Password incorrect" }
                }

                // Any other errors returned by Firebase Auth is displayed as-is
                return { error: "There was an error with the database -- " + e.message };
            }
        }
    }
};