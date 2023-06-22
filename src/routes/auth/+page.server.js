import { getAuth, signOut } from "firebase/auth";
import { redirect } from "@sveltejs/kit";

/** @type {import('./$types').Actions} */
export const actions = {
    logout: async ({ request }) => {
        const auth = getAuth();

        // Destroy session and log out
        signOut(auth).then(() => {
            throw redirect(303, '/auth/login');
        }).catch((error) => {
            console.log(error);
        });
    }
}