<script>
// @ts-nocheck

    // Fetch loaded data
    /** @type {import('./$types').PageData} */
    export let data;

    let selectedCarnivalID;

</script>

<div id="main-container">
    <!--Tutorial-->
    {#if data.tutorial == "true"}
        <p style="color: purple">
            (3/4) This is the houses page. Here, you can view a scoreboard of all houses for a specified carnival, ordered by rank. <br>
            <a href="/carnivals" style="float: right; color: red">Exit</a>
            <a href="/records?tutorial=true" style="float: right; margin-right: 20px">Next</a>
            <a href="/students?tutorial=true" style="float: right; margin-right: 20px">Previous</a>
        </p>
    {/if}

    <!--Heading and help reference-->
    <h1>Houses <a href="https://docs.google.com/document/d/1EDETbrxlj94bFKMae59e_JWl4_bBhmmf#heading=h.f5bfhc72w1f8" target="_blank"><i class="fa fa-question-circle help"></i></a></h1>

    <!--Check if any carnival exists-->
    {#if data.carnivals.length > 0}
    <!--Carnival dropdown select-->
        <select name="carnival-id" id="carnival-id" style="max-width: 400px" bind:value={selectedCarnivalID}>
            {#each data.carnivals as carnival}
            <option value="{carnival.id}">{carnival.name}</option>
            {/each}
        </select>

        <table>
            <!--Table headers-->
            <tr>
                <th>Rank</th>
                <th>Name</th>
                <th>Initials</th>
                <th>Points <a href="https://docs.google.com/document/d/1EDETbrxlj94bFKMae59e_JWl4_bBhmmf#heading=h.d16imucn6kw6" target="_blank"><i class="fa fa-question-circle help"></i></a></th>
            </tr>

            <!--Row for each house's placing, name, initials and points-->
            {#each data.houses as house}
                {#if house.carnivalID == selectedCarnivalID}
                    <tr>
                        <td>{house.placing}</td>
                        <td>{house.house}</td>
                        <td>{house.initials}</td>
                        <td>{house.points}</td>
                    </tr>
                {/if}
            {/each}
        </table>
    {:else}
        <!--Message if there is no existing carnival-->
        <p>There must be at least 1 carnival to view the house scoreboard.</p>
        <p>Go to the <a href="/carnivals">Carnivals</a> page to create a new carnival.</p>
    {/if}
</div>

<style>
    @import "$lib/css/main.css";
</style>