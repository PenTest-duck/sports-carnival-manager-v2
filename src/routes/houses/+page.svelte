<script>
// @ts-nocheck

    /** @type {import('./$types').PageData} */
    export let data;

</script>

<div id="main-container">
    <h1>Houses</h1>

    <table>
        <!--Table headers-->
        <tr>
            <th>Rank</th>
            <th>Name</th>
            <th>Initials</th>
            <th>Points</th>
        </tr>

        <!--Row for each house's placing, name, initials and points-->
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

<style>
    @import "$lib/css/containers.css";
</style>