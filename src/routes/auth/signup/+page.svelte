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
    
    <form method="POST" action="?/signUp">
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
    </form>

    <a href="/auth/login">Log in instead</a>
</div>