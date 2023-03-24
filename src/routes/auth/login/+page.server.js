import { signInWithEmailAndPassword } from "firebase/auth";
import { auth } from "../../../firebase";

/** @type {import('./$types').Actions} */
export const actions = {
    logIn: async ({ request }) => {
        let error;

        const data = await request.formData();
        const email = data.get("email");
        const password = data.get("password");

        try {
            let user = await signInWithEmailAndPassword(auth, email, password);
    
            const { currentUser } = auth;
    
            if (currentUser) {
                let uid = currentUser.uid;
                
                // set document
            }

        } catch (e) {
            if (e instanceof Error) {
                console.log("Log in error", e);
                error = e.message;
            }
        }
    }
};