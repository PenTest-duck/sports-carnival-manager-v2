<script>
    
</script>

<svelte:head>
    <title>Reset Password</title>
</svelte:head>

<div>

    <form method="POST" action="?/resetPassword">
        <h1>Reset Password</h1>
    
        <!--{#if error}
            <p>{error}</p>
        {/if}-->

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