<script>
// @ts-nocheck
    
    export let carnivalID;
    export let id, type, ageGroup, division, startTime, unit;

    let confirmRemove = false;

    // Changes to show confirm / cancel buttons
    function setRemove() {
        confirmRemove = true;
    }

    // Returns to remove button
    function cancelRemove() {
        confirmRemove = false;
    }
    
</script>

<!--Each row of events-->
<tr class="event">
    <td>{type}</td>
    <td>{ageGroup}</td>
    <td>{division}</td>
    <td>{startTime.slice(0, -3)}</td>           <!--Remove seconds display-->
    <!--Link to event page-->
    <td><a href="/carnivals/{carnivalID}/{id}" id="open-href"><button class="btn">Open</button></a></td>
    {#if !confirmRemove}
        <!--Remove button-->
        <td><button on:click={setRemove} class="btn"><i class="fa-solid fa-trash"></i></button></td>
    {:else}
        <!--Cancel button-->
        <td><button on:click={cancelRemove} id="cancel-btn" class="btn"><i class="fa-solid fa-undo"></i></button></td>
        <td>
            <!--Confirm button-->
            <form method="POST" action="?/removeEvent">
                <input type="hidden" id="id" name="id" value={id}>
                <button id="remove-btn" class="btn"><i class="fa-solid fa-trash"></i></button>
            </form>
        </td>
    {/if}
</tr>
    
<style>
    @import "$lib/css/components.css";
</style>