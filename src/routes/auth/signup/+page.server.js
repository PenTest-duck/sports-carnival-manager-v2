import { sequelize } from "../../../hooks.server"; 
import { redirect } from "@sveltejs/kit";
import { createUserWithEmailAndPassword, updateProfile } from "firebase/auth";
import { auth } from "../../../firebase";

/** @type {import('./$types').Actions} */
export const actions = {
    signUp: async ({ request }) => {
        let error; // need to return this to +page.svelte
        let success = false;

        const data = await request.formData();
        const firstName = data.get("first-name");
        const lastName = data.get("last-name");
        const email = data.get("email");
        const password = data.get("password");

        let uid;

        try {
            // @ts-ignore
            let user = await createUserWithEmailAndPassword(auth, email, password);
            
            const { currentUser } = auth;
            if (currentUser) {
                uid = currentUser.uid;
            }

            success = true;
        } catch (e) {
            if (e instanceof Error) {
                console.log("Sign up error: ", e);
                error = e.message;
            }
        }

        if (success) {
            // below assumes roleID 1 = "staff"
            await sequelize.query("INSERT INTO staff VALUES (:uid, :email, :firstName, :lastName, 1)", {
                replacements: {
                    uid: uid,
                    email: email,
                    firstName: firstName,
                    lastName: lastName
                }
            });

            throw redirect(303, '/');
        }
    }
};
