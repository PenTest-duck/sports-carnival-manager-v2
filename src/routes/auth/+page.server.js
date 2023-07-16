// @ts-nocheck
/** @type {import('./$types').Actions} */
export const actions = {
    // Function: logout()
    // Purpose: remove session cookie and log out
    // Parameters: N/A
    // Returns: N/A
    logout: async ({ cookies }) => {
        // Delete cookie
        const options = {httpOnly: true, secure: false, path: "/", sameSite: "strict" };
        cookies.delete("__session", options);

        // Redirects to login page due to auth validation in layout.server.ts
    }
}