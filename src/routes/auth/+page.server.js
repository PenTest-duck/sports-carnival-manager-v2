// Imports
import { getAuth, signOut } from "firebase/auth";
import { redirect } from "@sveltejs/kit";

/** @type {import('./$types').Actions} */
export const actions = {
    // Function: logout()
    // Purpose: destroy session and log out
    // Parameters: N/A
    // Returns: redirection to login page OR error message
    logout: async ({ request }) => {
        const auth = getAuth();

        // If logged out, redirect to login page
        signOut(auth).then(() => {
            throw redirect(303, '/auth/login');
        }).catch((error) => {
            console.log(error);
        });
    }
}