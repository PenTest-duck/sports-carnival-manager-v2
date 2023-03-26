import { getAuth, onAuthStateChanged } from "firebase/auth";
import { sequelize } from "../hooks.server"; 

const auth = getAuth();

/** @type {import('./$types').LayoutServerLoad} */
export async function load() {
    const user = auth.currentUser;
    let staffName = "";

    if (user) {
        const staff = await sequelize.query("SELECT * FROM staff WHERE id = :uid", {
            replacements: { uid: user.uid }
        });
        // @ts-ignore
        staffName = staff[0][0].firstName;
    }

    return { staffName };
};

onAuthStateChanged(auth, (user) => {
  if (user) {
    const uid = user.uid;

    console.log(uid)

  } else {

  }
});