// @ts-nocheck
// Imports
import { sequelize } from "../hooks.server"; 
import { adminAuth } from "$lib/server/admin";
import { redirect } from "@sveltejs/kit";

/** @type {import('./$types').LayoutServerLoad} */
// Function: load()
// Purpose: Verify authentication status
// Parameters: route
// Returns: first name of logged-in user and log-in status OR redirection to login page
export async function load({ route, cookies }) {
    // Initialise variables
    let staffName = "";
    let loggedIn = false;

    // Fetch session cookie
    const sessionCookie = cookies.get("__session");
    
    // If session cookie set, verify it on Firebase
    // Otherwise, if no session cookie set, redirect to 
    if (sessionCookie != null && sessionCookie != "") {
        try {
            // Verify session cookie on Firebase
            const decodedClaims = await adminAuth.verifySessionCookie(sessionCookie!);
    
            // Fetch staff record by UID
            const staff = await sequelize.query("SELECT * FROM staff WHERE id = :uid", {
                replacements: { uid: decodedClaims.uid }
            });
    
            // Set to first name of staff
            staffName = staff[0][0].firstName;
            loggedIn = true;

        } catch(e) {
            console.log("Error: ", e);

            if (route.id != "/auth/login" && route.id != "/auth/signup" && route.id != "/auth/forgotpassword") {
                throw redirect(301, '/auth/login');
            }
        }
    } else {
        if (route.id != "/auth/login" && route.id != "/auth/signup" && route.id != "/auth/forgotpassword") {
            throw redirect(301, '/auth/login');
        }
    }

    return { staffName, loggedIn };
}