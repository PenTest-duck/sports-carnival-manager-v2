<script>
    // @ts-nocheck
    
    export let id, firstName, lastName, house, number;

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
 
<!--Each row of students-->
<tr class="student">
    <td>{number}</td>
    <td>{house}</td>
    <td>{firstName}</td>
    <td>{lastName}</td>
    <!--Link to student page-->
    <td><a href="/students/{id}" id="open-href"><button class="btn">Open</button></a></td>
    {#if !confirmRemove}
        <!--Remove button-->
        <td><button on:click={setRemove} class="btn"><i class="fa-solid fa-trash"></i></button></td>
    {:else}
        <!--Cancel button-->
        <td><button on:click={cancelRemove} id="cancel-btn" class="btn"><i class="fa-solid fa-undo"></i></button></td>
        <td>
            <!--Confirm button-->
            <form method="POST" action="?/removeStudent">
                <input type="hidden" id="id" name="id" value={id}>
                <button id="remove-btn" class="btn"><i class="fa-solid fa-trash"></i></button>
            </form>
        </td>
    {/if}
</tr>
    
<style>
    @import "$lib/css/components.css";
</style>