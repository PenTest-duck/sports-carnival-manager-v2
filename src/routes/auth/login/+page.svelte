<script>
    // Import loaded data
    /** @type {import('./$types').PageData} */
    export let data;

    // Fetch action data
    /** @type {import('./$types').ActionData} */
    export let form;
</script>

<svelte:head>
    <title>Log In</title>
</svelte:head>

<div id="auth-container">

    <form method="POST" action="?/logIn">
        <!--Heading and help reference-->
        <h1>Log In <a href="https://docs.google.com/document/d/1EDETbrxlj94bFKMae59e_JWl4_bBhmmf#heading=h.vp0dtvo9z4hu" target="_blank"><i class="fa fa-question-circle help"></i></a></h1>

        <!--Display error message from server process-->
        {#if form?.error}
            <p id="error">{form?.error}</p>
        {/if}

        <!--Display confirmation message-->
        {#if data.msg}
            <p id="msg">{data.msg}</p>
        {/if}

        <!--Log in input fields-->
        <label>
            Email Address
            <input type="text" id="email" name="email" placeholder="Email address">
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
    @import "$lib/css/main.css";
</style>