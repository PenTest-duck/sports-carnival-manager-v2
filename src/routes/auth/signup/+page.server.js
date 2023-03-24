import { redirect } from "@sveltejs/kit";
import { createUserWithEmailAndPassword, updateProfile } from "firebase/auth";
import { goto } from "$app/navigation";
import { auth } from "../../../firebase";

/** @type {import('./$types').Actions} */
export const actions = {
    signUp: async ({ request }) => {
        let error;

        const data = await request.formData();
        const username = data.get("username");
        const email = data.get("email");
        const password = data.get("password");

        try {
            let user = await createUserWithEmailAndPassword(auth, email, password);

            await updateProfile(user.user, {
                displayName: username
            });

            const { currentUser } = auth;

            if (currentUser) {
                let uid = currentUser.uid;
                
                // set user document
            }

            //await goto("/auth/login");
            //throw redirect(303, "/auth/login");
        } catch (e) {
            if (e instanceof Error) {
                console.log("Sign up error: ", e);
                error = e.message;
            }
        }
    }
};
