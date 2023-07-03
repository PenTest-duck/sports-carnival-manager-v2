// @ts-nocheck
// Imports
import { onAuthStateChanged } from "firebase/auth";
import { sequelize } from "../hooks.server"; 
import { auth } from "../firebase";
import { redirect } from "@sveltejs/kit";

/** @type {import('./$types').LayoutServerLoad} */
// Function: load()
// Purpose: 
// Parameters: route
// Returns: first name of logged-in user and log-in status OR redirection to login page
export async function load({ route }) {
	// Initialise variables and get current user object
    const user = auth.currentUser;
    let staffName = "";
    let loggedIn = false;

    if (user) {
		// Fetch staff record by UID
        const staff = await sequelize.query("SELECT * FROM staff WHERE id = :uid", {
            replacements: { uid: user.uid }
        });

		// Set to first name of staff
		staffName = staff[0][0].firstName;
        loggedIn = true;
	
	// If not at an authentication page already, redirect to login
	// This prevents an infinite redirection loop
    } else if (route.id != "/auth/login" && route.id != "/auth/signup" && route.id != "/auth/forgotpassword") {
      	throw redirect(303, '/auth/login');
    }

    return { staffName, loggedIn };
};

// Monitor user authentication status change and update UID accordingly
onAuthStateChanged(auth, (user) => {
	if (user) {
    	const uid = user.uid;
  	}
});