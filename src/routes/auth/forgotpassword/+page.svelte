<script>
    
</script>

<svelte:head>
    <title>Reset Password</title>
</svelte:head>

<div>
    <h1>Reset Password</h1>
    
    <!--{#if error}
        <p>{error}</p>
    {/if}-->

    <form method="POST" action="?/resetPassword">
        <label>
            Email Address
            <input type="email" id="email" name="email" placeholder="Email address">
        </label>
        <button>Log In</button>
    </form>

    <a href="/auth/signup">Sign up instead</a>
    <a href="/auth/login">Log in instead</a>
</div>