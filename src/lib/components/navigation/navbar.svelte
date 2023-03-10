<script>
  import { each } from "svelte/internal";


    export let logo;
    export let navItems;
</script>


<nav>
    <ul>
        <img src={logo} alt="logo">
        {#each navItems as item}
            <li><a href={item.destination}>{item.name}</a></li>
        {/each}

    </ul>
</nav>