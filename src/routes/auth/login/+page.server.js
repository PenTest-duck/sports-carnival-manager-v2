// @ts-nocheck
import { signInWithEmailAndPassword } from "firebase/auth";
import { auth } from "../../../firebase";
import { redirect } from "@sveltejs/kit";

/** @type {import('./$types').Actions} */
export const actions = {
    logIn: async ({ request }) => {
        
        let error; // need to return this to +page.svelte
        let success = false;

        const data = await request.formData();
        const email = data.get("email");
        const password = data.get("password");

        
        try {
            let user = await signInWithEmailAndPassword(auth, email, password);
    
            const { currentUser } = auth;

            success = true;

        } catch (e) {
            if (e instanceof Error) {
                console.log("Log in error", e);
                error = e.message;
            }
        }

        if (success) {
            throw redirect(303, '/');
        }
    }
};