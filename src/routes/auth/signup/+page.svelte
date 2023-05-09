<script>
// @ts-nocheck
    //import { error } from "../signup/+page.server";

    
</script>

<svelte:head>
    <title>Sign Up</title>
</svelte:head>

<div>
    
    <form method="POST" action="?/signUp">
        <h1>Sign Up</h1>
        <!--{#if error}
            <p>{error}</p>
        {/if}-->

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

        <a href="/auth/login">Log in instead</a>
    </form>
</div>

<style>
    form {
        display: block;
        margin-left: auto;
        margin-right: auto;
        width: 50%;

        padding: 3%;
        border-radius: 20px;
        background-color: rgb(162, 194, 200);
    }
</style>