// @ts-nocheck
import { sendPasswordResetEmail } from "firebase/auth";
import { auth } from "../../../firebase";
import { redirect } from "@sveltejs/kit";

/** @type {import('./$types').Actions} */
export const actions = {
    resetPassword: async ({ request }) => {
        
        let error; // need to return this to +page.svelte
        let success = false;

        const data = await request.formData();
        const email = data.get("email");
        
        try {
            await sendPasswordResetEmail(auth, email);

            success = true;

        } catch (e) {
            if (e instanceof Error) {
                console.log("Password reset error", e);
                error = e.message;
            }
        }

        if (success) {
            throw redirect(303, '/auth/login');
        }
    }
};