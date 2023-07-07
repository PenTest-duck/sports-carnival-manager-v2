/*import { render, screen, fireEvent } from '@testing-library/svelte';
import Login from '../routes/auth/login/+page.svelte';

describe ("Login", () => {
    test("Page displays 'Log In'", () => {
        render(Login);
        const node = screen.getAllByText('Log In')[0];
        expect(node).not.toBeNull();
    });

    test("When nothing input", async () => {
        render(Login);
        const loginButton = screen.getAllByText('Log In')[1];
        await fireEvent.click(loginButton);
        expect(screen.getByText("Invalid email format")).toBeInTheDocument();
    });
});
*/