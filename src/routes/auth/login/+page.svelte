<script>
    // Fetch action data
    /** @type {import('./$types').ActionData} */
    export let form;
</script>

<svelte:head>
    <title>Log In</title>
</svelte:head>

<div id="auth-container">

    <form method="POST" action="?/logIn">
        <h1>Log In</h1>

        <!--Display error message from server process-->
        {#if form?.error}
            <p id="error">{form?.error}</p>
        {/if}

        <!--Log in input fields-->
        <label>
            Email Address
            <input type="email" id="email" name="email" placeholder="Email address">
        </label>
        <label>
            Password
            <input type="password" id="password" name="password" placeholder="Password">
        </label>
        <button>Log In</button>

        <a href="/auth/signup">Sign up instead</a>
        <a href="/auth/forgotpassword" style="float: right">Forgot password?</a>
    </form>
</div>

<style>
    @import "$lib/css/containers.css";
</style>