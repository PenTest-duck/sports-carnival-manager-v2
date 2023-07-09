<script>
// @ts-nocheck

    // Import component
    import Carnival from '$lib/components/Carnival.svelte'

    // Import loaded data
    /** @type {import('./$types').PageData} */
    export let data;

    // Import action data
    /** @type {import('./$types').ActionData} */
    export let form;

</script>

<div id="main-container">
    <div id="carnival-list">
        <h3>Carnival List</h3>

        <table>
            <!--Table headers-->
            <tr>
                <th>Name</th>
                <th>Type</th>
                <th>Date</th>
                <th>Start</th>
                <th>End</th>
                <th>Location</th>
                <th>Organiser</th>
            </tr>

            <!--Row of each carnival's name, type, date, start time, end time, location, organiser + open & delete buttons-->
            {#each data.carnivals as carnival}
                <Carnival {...carnival} />
            {/each}
        </table>
    </div>

    <dialogue open>
        <article>
            <div id="create-carnival">
                <h3>Create Carnival</h3>
        
                <!--Display error message from server process-->
                {#if form?.error}
                    <p id="error">{form?.error}</p>
                {/if}
        
                <form method="POST" action="?/addCarnival">
                    <!--Add carnival input fields-->
                    <label>
                        Name
                        <input type="text" name="carnival-name" placeholder="Carnival Name">
                    </label>
        
                    <label>
                        Type
                        <!--Carnival type dropdown select-->
                        <select name="carnival-type-id" id="carnival-type-id">
                            {#each data.carnivalTypes as type}
                            <option value="{type.typeID}">{type.type}</option>
                            {/each}
                        </select>
                    </label>
        
                    <label>
                        Date
                        <input type="date" name="carnival-date">
                    </label>
        
                    <label>
                        Start Time
                        <input type="time" name="carnival-start-time">
                    </label>
        
                    <label>
                        End Time
                        <input type="time" name="carnival-end-time">
                    </label>
        
                    <label>
                        Location
                        <!--Carnival location dropdown select-->
                        <select name="carnival-location-id" id="carnival-location-id">
                            {#each data.carnivalLocations as location}
                            <option value="{location.locationID}">{location.location}</option>
                            {/each}
                        </select>
                    </label>
        
                    <label>
                        Organiser
                        <!--Carnival organiser dropdown select-->
                        <select name="carnival-staff-id" id="carnival-staff-id">
                            {#each data.staffs as staff}
                            <option value="{staff.id}">{staff.firstName} {staff.lastName}</option>
                            {/each}
                        </select>
                    </label>
        
                    <button>Add</button>
                </form>
            </div>
        </article>
    </dialogue>
</div>

<style>
    @import "$lib/css/main.css";
</style>