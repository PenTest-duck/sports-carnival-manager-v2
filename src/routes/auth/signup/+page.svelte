<script>
// @ts-nocheck

    // Fetch action data
    /** @type {import('./$types').ActionData} */
    export let form;
</script>

<svelte:head>
    <title>Sign Up</title>
</svelte:head>

<div id="auth-container">
    
    <form method="POST" action="?/signUp">
        <h1>Sign Up</h1>

        <!--Display error message from server process-->
        {#if form?.error}
            <p id="error">{form?.error}</p>
        {/if}

        <!--Sign up input fields-->
        <label>
            First Name
            <input type="text" id="first-name" name="first-name" placeholder="First name">
        </label>
        <label>
            Last Name
            <input type="text" id="last-name" name="last-name" placeholder="Last name">
        </label>
        <label>
            Email Address
            <input type="email" id="email" name="email" placeholder="Email address">
        </label>
        <label>
            Password
            <input type="password" id="password" name="password" placeholder="Password">
        </label>
        <button>Sign Up</button>

        <a href="/auth/login">Log in instead</a>
    </form>
</div>

<style>
    @import "$lib/css/containers.css";
</style>