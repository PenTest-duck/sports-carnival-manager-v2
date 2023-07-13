// @ts-nocheck
// Imports
import { signInWithEmailAndPassword } from "firebase/auth";
import { auth } from "../../../firebase";
import { redirect } from "@sveltejs/kit";
import { MAX_STR_LENGTH, VALID_EMAIL_REGEX } from "$lib/validation";
import { adminAuth } from "$lib/server/admin";

/** @type {import('./$types').Actions} */
export const actions = {
    // Function: login()
    // Purpose: checks credentials, and authenticates user OR returns error message
    // Parameters: form data (email, password)
    // Returns: redirection to / OR error message
    logIn: async ({ request, cookies }) => {

        // Extract variables from form submission
        const data = await request.formData();
        const email = data.get("email");
        const password = data.get("password");

        // Check no fields are empty
        if (email == "" || password == "") {
            return { error: "All fields must be filled" }
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
            const expiresIn = 60 * 60 * 24 * 5 * 1000; // session expires in 5 days

            // API request to Firebase Auth to get token of user
            let credential = await signInWithEmailAndPassword(auth, email, password);
            const idToken = await credential.user.getIdToken();

            // Verify token and set session cookie
            const decodedIdToken = await adminAuth.verifyIdToken(idToken);
            const cookie = await adminAuth.createSessionCookie(idToken, { expiresIn });
            const options = { maxAge: expiresIn, httpOnly: true, secure: true, path: "/" };
            cookies.set("__session", cookie, options);
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

        // If logged in, redirect to carnivals dashboard
        throw redirect(303, '/carnivals');
    }
};