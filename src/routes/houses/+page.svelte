<script>
// @ts-nocheck

    /** @type {import('./$types').PageData} */
    export let data;

</script>

<div>
    <h1>Houses</h1>

    <table>
        <tr>
            <th>Rank</th>
            <th>Name</th>
            <th>Initials</th>
            <th>Points</th>
        </tr>

        {#each data.houses as house}
        <tr>
            <td>{house.placing}</td>
            <td>{house.house}</td>
            <td>{house.initials}</td>
            <td>{house.points}</td>
        </tr>
        {/each}
    </table>
</div>