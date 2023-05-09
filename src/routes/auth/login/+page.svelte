<script>
    
</script>

<svelte:head>
    <title>Log In</title>
</svelte:head>

<div>

    <form method="POST" action="?/logIn">
        <h1>Log In</h1>

        <!--{#if error}
            <p>{error}</p>
        {/if}-->

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
    form {
        display: block;
        margin-left: auto;
        margin-right: auto;
        width: 40%;

        padding: 3%;
        border-radius: 20px;
        background-color: rgb(162, 194, 200);
    }
</style>