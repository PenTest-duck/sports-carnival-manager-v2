<script>
    // Fetch action data
    /** @type {import('./$types').ActionData} */
    export let form;
</script>

<svelte:head>
    <title>Reset Password</title>
</svelte:head>

<div id="auth-container">

    <form method="POST" action="?/resetPassword">
        <!--Heading and help reference-->
        <h1>Reset Password <a href="https://docs.google.com/document/d/1EDETbrxlj94bFKMae59e_JWl4_bBhmmf#heading=h.b3v2am9z60yb" target="_blank"><i class="fa fa-question-circle help"></i></a></h1>
    
        <!--Display error message from server process-->
        {#if form?.error}
            <p id="error">{form?.error}</p>
        {/if}

        <!--Password reset input field-->
        <label>
            Email Address
            <input type="text" id="email" name="email" placeholder="Email address">
        </label>
        <button>Send reset email</button>

        <a href="/auth/signup">Sign up instead</a>
        <a href="/auth/login" style="float: right">Log in instead</a>
    </form>
</div>

<style>
    @import "$lib/css/main.css";
</style>