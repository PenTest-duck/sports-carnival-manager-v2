import { onAuthStateChanged } from "firebase/auth";
import { sequelize } from "../hooks.server"; 
import { auth } from "../firebase";
import { redirect } from "@sveltejs/kit";

/** @type {import('./$types').LayoutServerLoad} */
export async function load({ route }) {
    const user = auth.currentUser;
    let staffName = "";
    let loggedIn = false;

    if (user) {
        const staff = await sequelize.query("SELECT * FROM staff WHERE id = :uid", {
            replacements: { uid: user.uid }
        });
        loggedIn = true;
        // @ts-ignore
        staffName = staff[0][0].firstName;
    } else if (route.id != "/auth/login" && route.id != "/auth/signup" && route.id != "/auth/forgotpassword") {
      throw redirect(303, '/auth/login');
    }

    return { staffName, loggedIn };
};

onAuthStateChanged(auth, (user) => {
  if (user) {
    const uid = user.uid;

    console.log(uid)

  } else {

  }
});