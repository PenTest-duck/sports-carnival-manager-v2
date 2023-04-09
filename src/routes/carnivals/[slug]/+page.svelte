<script>
// @ts-nocheck
    import Event from '$lib/components/Event.svelte'

    /** @type {import('./$types').PageData} */
    export let data;

    let editingCarnival = false;
    let dataChanged = false;

    function setEditingCarnival() {
        editingCarnival = true;
    }

    function cancelEditingCarnival() {
        editingCarnival = false;
        dataChanged = false;
    }

    function editCarnival() {
        document.getElementById("editCarnivalForm").submit();
    }

    function setDataChanged() {
        dataChanged = true;
    }

</script>

<div>
    <h1>Carnival</h1>

    <div id="carnival-details">
        <h3 style="display: inline-block">Carnival Details</h3>
        {#if !editingCarnival}
            <button style="display: inline-block; width: 100px" on:click={setEditingCarnival}>Edit</button>
        {:else}
            <button style="display: inline-block; width: 150px; height: 50px" on:click={cancelEditingCarnival}>Cancel</button>
            <button style="display: inline-block; width: 150px; height: 50px" on:click={editCarnival} disabled={!dataChanged || null}>Save</button>
        {/if}

        <form method="POST" action="?/editCarnival" id="editCarnivalForm">
        <table>
            <tr>
                <th>Name</th>
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
                {#if editingCarnival}
                    <td><input type="date" name="carnival-date" value={data.carnival.date} on:input={setDataChanged}></td>
                {:else}
                    <td>{data.carnival.date}</td>
                {/if}
            </tr>
            <tr>
                <th>Start Time</th>
                {#if editingCarnival}
                    <td><input type="time" name="carnival-start-time" value={data.carnival.startTime} on:input={setDataChanged}></td>
                {:else}
                    <td>{data.carnival.startTime.slice(0, -3)}</td>
                {/if}
            </tr>
            <tr>
                <th>End Time</th>
                {#if editingCarnival}
                    <td><input type="time" name="carnival-end-time" value={data.carnival.endTime} on:input={setDataChanged}></td>
                {:else}
                    <td>{data.carnival.endTime.slice(0, -3)}</td>
                {/if}
            </tr>
            <tr>
                <th>Location</th>
                {#if editingCarnival}
                    <td>
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
                {#if editingCarnival}
                    <td>
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

    <div id="house-points">
        <h3>House Points</h3>
    </div>

    <div id="events-list">
        <h3>Events</h3>

        <table>
            <tr>
                <th>Type</th>
                <th>Age Group</th>
                <th>Division</th>
                <th>Start Time</th>
            </tr>
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
                    
                    <label>
                        Type
                        <select name="event-type-id" id="event-type-id">
                            {#each data.eventTypes as type}
                            <option value="{type.id}">{type.type}</option>
                            {/each}
                        </select>
                    </label>

                    <label>
                        Age Group
                        <select name="event-age-group-id" id="event-age-group-id">
                            {#each data.eventAgeGroups as ageGroup}
                            <option value="{ageGroup.id}">{ageGroup.ageGroup}</option>
                            {/each}
                        </select>
                    </label>

                    <label>
                        Division
                        <select name="event-division-id" id="event-division-id">
                            {#each data.eventDivisions as division}
                            <option value="{division.id}">{division.division}</option>
                            {/each}
                        </select>
                    </label>

                    <label>
                        Start Time
                        <input type="time" name="event-start-time"> 
                        <!--min={data.carnival.startTime} max={data.carnival.endTime}-->
                    </label>

                    <button>Add</button>
                </form>
            </div>
        </article>
    </dialogue>
</div>