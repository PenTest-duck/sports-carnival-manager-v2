<script>
// @ts-nocheck
    // Import component
    import Event from '$lib/components/Event.svelte'

    // Import loaded data
    /** @type {import('./$types').PageData} */
    export let data;

    // Import action data
    /** @type {import('./$types').ActionData} */
    export let form;

    // Initialise variables
    let editingCarnival = false;
    let dataChanged = false;

    // Changes form to editable values
    function setEditingCarnival() {
        editingCarnival = true;
    }

    // Returns form to displaying values
    function cancelEditingCarnival() {
        editingCarnival = false;
        dataChanged = false;
    }

    // Submits the POST request with edited values
    function editCarnival() {
        document.getElementById("editCarnivalForm").submit();
    }

    // Enable save button if data edited
    function setDataChanged() {
        dataChanged = true;
    }

    // Check if event only has championship division
    const championshipEventTypeIDs = [4, 5, 10, 11, 12];
    let selectedEventType;
    let onlyChampionship = false;

    function toggleChampionships() {
        if (championshipEventTypeIDs.includes(selectedEventType)) {
            onlyChampionship = true;
        } else {
            onlyChampionship = false;
        }
    }

</script>

<div id="main-container">
    <h1>Carnival</h1>

    <div id="carnival-details">
        <h3 class="details-display">Carnival Details</h3>

        <!--Edit or Cancel/Save buttons to show when needed-->
        {#if !editingCarnival}
            <button class="edit-button" on:click={setEditingCarnival}>Edit</button>
        {:else}
            <button class="edit-button" on:click={cancelEditingCarnival}>Cancel</button>
            <button class="edit-button" on:click={editCarnival} disabled={!dataChanged || null}>Save</button>
        {/if}

        <!--Display error message from saving carnival details-->
        {#if form?.carnivalError}
            <p id="error">{form?.carnivalError}</p>
        {/if}

        <form method="POST" action="?/editCarnival" id="editCarnivalForm">
            <table>
                <tr>
                    <th>Name</th>
                    <!--Display editable or non-editable field-->
                    {#if editingCarnival}
                        <td><input type="text" name="carnival-name" value={data.carnival.name} on:input={setDataChanged}></td>
                    {:else}
                        <td>{data.carnival.name}</td>
                    {/if}
                </tr>
                <tr>
                    <th>Type</th>
                    <td>{data.carnival.type}</td>
                </tr>
                <tr>
                    <th>Date</th>
                    <!--Display editable or non-editable field-->
                    {#if editingCarnival}
                        <td><input type="date" name="carnival-date" value={data.carnival.date} on:input={setDataChanged}></td>
                    {:else}
                        <td>{data.carnival.date}</td>
                    {/if}
                </tr>
                <tr>
                    <th>Start Time</th>
                    <!--Display editable or non-editable field-->
                    {#if editingCarnival}
                        <td><input type="time" name="carnival-start-time" value={data.carnival.startTime.slice(0, -3)} on:input={setDataChanged}></td>
                    {:else}
                        <td>{data.carnival.startTime.slice(0, -3)}</td>
                    {/if}
                </tr>
                <tr>
                    <th>End Time</th>
                    <!--Display editable or non-editable field-->
                    {#if editingCarnival}
                        <td><input type="time" name="carnival-end-time" value={data.carnival.endTime.slice(0, -3)} on:input={setDataChanged}></td>
                    {:else}
                        <td>{data.carnival.endTime.slice(0, -3)}</td>
                    {/if}
                </tr>
                <tr>
                    <th>Location</th>
                    <!--Display editable or non-editable field-->
                    {#if editingCarnival}
                        <td>
                            <!--Carnival location dropdown select-->
                            <select name="carnival-location-id" id="carnival-location-id" on:input={setDataChanged}>
                            {#each data.carnivalLocations as location}
                            <option value="{location.locationID}" selected={location.location === data.carnival.location || null}>{location.location}</option>
                            {/each}
                            </select>
                        </td>
                    {:else}
                        <td>{data.carnival.location}</td>
                    {/if}
                </tr>
                <tr>
                    <th>Organiser</th>
                    <!--Display editable or non-editable field-->
                    {#if editingCarnival}
                        <td>
                            <!--Carnival staff dropdown select-->
                            <select name="carnival-staff-id" id="carnival-staff-id" on:change={setDataChanged}>
                                {#each data.staffs as staff}
                                <option value="{staff.id}">{staff.firstName} {staff.lastName}</option>
                                {/each}
                            </select>
                        </td>
                    {:else}
                        <td>{data.carnival.firstName} {data.carnival.lastName}</td>
                    {/if}
                </tr>
            </table>
        </form>
    </div>

    <div id="events-list">
        <h3>Events</h3>

        <table>
            <!--Table headers-->
            <tr>
                <th>Type</th>
                <th>Age Group</th>
                <th>Division</th>
                <th>Start Time</th>
            </tr>

            <!--Row of each event's type, age group, division, start time + open & delete buttons-->
            {#each data.events as event}
                <Event carnivalID={data.slug} {...event} />
            {/each}
        </table>
    </div>

    <dialogue open>
        <article>
            <div id="create-event">
                <h3>Create Event</h3>

                <form method="POST" action="?/addEvent">

                    <!--Display error message from creating event-->
                    {#if form?.eventError}
                        <p id="error">{form?.eventError}</p>
                    {/if}
                    
                    <!--Add event input fields-->
                    <label>
                        Type
                        <!--Event type dropdown select-->
                        <select name="event-type-id" id="event-type-id" bind:value={selectedEventType} on:change={toggleChampionships}>
                            {#each data.eventTypes as type}
                            <option value="{type.id}">{type.type}</option>
                            {/each}
                        </select>
                    </label>

                    <label>
                        Age Group
                        <!--Event age group drop down select-->
                        <select name="event-age-group-id" id="event-age-group-id">
                            {#each data.eventAgeGroups as ageGroup}
                            <option value="{ageGroup.id}">{ageGroup.ageGroup}</option>
                            {/each}
                        </select>
                    </label>

                    <label>
                        Division
                        <!--Event division dropdown select-->
                        <select name="event-division-id" id="event-division-id">
                            <!--If championship only event, only show championship-->
                            {#if onlyChampionship}
                                <option value="1">Championships</option>
                            <!--Otherwise show all divisions-->
                            {:else}
                                {#each data.eventDivisions as division}
                                <option value="{division.id}">{division.division}</option>
                                {/each}
                            {/if}
                        </select>
                    </label>

                    <label>
                        Start Time
                        <input type="time" min={data.carnival.startTime} max={data.carnival.endTime} name="event-start-time"> 
                    </label>

                    <!--Hidden input fields for validating start time is within range of carnival start and end times-->
                    <input type="hidden" name="event-min-time" value={data.carnival.startTime} />
                    <input type="hidden" name="event-max-time" value={data.carnival.endTime} />

                    <button>Add</button>
                </form>
            </div>
        </article>
    </dialogue>
</div>

<style>
    @import "$lib/css/main.css";
</style>