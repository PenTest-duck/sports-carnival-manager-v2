<script>
    /** @type {import('./$types').ActionData} */
    export let form;
</script>

<svelte:head>
    <title>Reset Password</title>
</svelte:head>

<div id="auth-container">

    <form method="POST" action="?/resetPassword">
        <h1>Reset Password</h1>
    
        <!--Display error message from server process-->
        {#if form?.error}
            <p id="error">{form?.error}</p>
        {/if}

        <!--Password reset input field-->
        <label>
            Email Address
            <input type="email" id="email" name="email" placeholder="Email address">
        </label>
        <button>Send reset email</button>

        <a href="/auth/signup">Sign up instead</a>
        <a href="/auth/login" style="float: right">Log in instead</a>
    </form>
</div>

<style>
    @import "$lib/css/containers.css";

    #error {
        color: red
    }
</style>