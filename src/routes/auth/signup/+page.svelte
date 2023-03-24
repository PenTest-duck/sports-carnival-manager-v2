<script>
// @ts-nocheck
    //import { error } from "../signup/+page.server";

    
</script>

<svelte:head>
    <title>Sign Up</title>
</svelte:head>

<div>
    <h1>Sign Up</h1>
    <!--{#if error}
        <p>{error}</p>
    {/if}-->
    
    <div>
        <form method="POST" action="?/signUp">
            <label>
                Username
                <input type="text" id="username" name="username" placeholder="Username">
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
        </form>
    </div>
</div>