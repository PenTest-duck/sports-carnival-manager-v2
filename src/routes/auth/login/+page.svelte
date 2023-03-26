<script>
    
</script>

<svelte:head>
    <title>Log In</title>
</svelte:head>

<div>
    <h1>Log In</h1>
    
    <!--{#if error}
        <p>{error}</p>
    {/if}-->

    <form method="POST" action="?/logIn">
        <label>
            Email Address
            <input type="email" id="email" name="email" placeholder="Email address">
        </label>
        <label>
            Password
            <input type="password" id="password" name="password" placeholder="Password">
        </label>
        <button>Log In</button>
    </form>

    <a href="/auth/signup">Sign up instead</a>
</div>