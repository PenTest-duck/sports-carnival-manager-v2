/** @type {import('./$types').Actions} */
export const actions = {
    // Function: logout()
    // Purpose: remove session cookie and log out
    // Parameters: N/A
    // Returns: N/A
    logout: async ({ cookies }) => {
        cookies.delete("__session", { path: "/" });

        // Redirects to login page due to auth validation in layout.server.ts
    }
}