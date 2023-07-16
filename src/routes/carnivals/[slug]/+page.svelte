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

    let carnivalName = data.carnival.name;
    let carnivalDate = data.carnival.date;
    let carnivalStartTime = data.carnival.startTime.slice(0, -3);
    let carnivalEndTime = data.carnival.endTime.slice(0, -3);
    let carnivalLocationID = data.carnival.locationID;
    let carnivalStaffID = data.carnival.staffID;

    // Changes form to editable values
    function setEditingCarnival() {
        editingCarnival = true;
    }

    // Returns form to displaying values
    function cancelEditingCarnival() {
        editingCarnival = false;
        dataChanged = false;

        carnivalName = data.carnival.name;
        carnivalDate = data.carnival.date;
        carnivalStartTime = data.carnival.startTime.slice(0, -3);
        carnivalEndTime = data.carnival.endTime.slice(0, -3);
        carnivalLocationID = data.carnival.locationID;
        carnivalStaffID = data.carnival.staffID;
    }

    // Submits the POST request with edited values
    function editCarnival() {
        document.getElementById("editCarnivalForm").submit();
    }

    // Enable save button if data edited
    $: if (carnivalName != data.carnival.name 
        || carnivalDate != data.carnival.date 
        || carnivalStartTime != data.carnival.startTime.slice(0, -3)
        || carnivalEndTime != data.carnival.endTime.slice(0, -3)
        || carnivalLocationID != data.carnival.locationID
        || carnivalStaffID != data.carnival.staffID) {
            dataChanged = true;
    } else {
        dataChanged = false;
    }

    let selectedEventType;

    // Check if event only has championship division
    const championshipEventTypeIDs = [4, 5, 10, 11, 12, 18, 19, 20, 21, 22, 23, 24, 25, 26];
    let onlyChampionship = false;

    function toggleChampionships() {
        if (championshipEventTypeIDs.includes(selectedEventType)) {
            onlyChampionship = true;
        } else {
            onlyChampionship = false;
        }
    }

    // Set onlyChampionship if first select option value is a championship-only event type
    if (championshipEventTypeIDs.includes(data.eventTypes[0].id)) {
        onlyChampionship = true;
    }

    // Check if event is an all-age event
    const allAgeEventTypeIDs = [22];
    let allAge = false;

    function toggleAllAge() {
        if (allAgeEventTypeIDs.includes(selectedEventType)) {
            allAge = true;
        } else {
            allAge = false;
        }
    }


</script>

<div id="main-container">
    <h1>{data.carnival.name}</h1>

    <!--Display confirmation message-->
    {#if data.msg}
        <p id="msg">{data.msg}</p>
    {/if}

    <!--Display error message from saving carnival details-->
    {#if form?.carnivalError}
        <p id="error">Edit Carnival: {form?.carnivalError}</p>
    {/if}

    <!--Display error message from creating event-->
    {#if form?.eventError}
        <p id="error">Create Event: {form?.eventError}</p>
    {/if}

    <!--Display error message from removing event-->
    {#if form?.eventRemoveError}
        <p id="error">Remove Event: {form?.eventRemoveError}</p>
    {/if}

    <div id="carnival-details">
        <!--Heading and help reference-->
        <h3 class="details-display">Carnival Details <a href="https://docs.google.com/document/d/1EDETbrxlj94bFKMae59e_JWl4_bBhmmf#heading=h.r8yxfdaf05ft" target="_blank"><i class="fa fa-question-circle help"></i></a></h3>

        <!--Edit or Cancel/Save buttons to show when needed-->
        {#if !editingCarnival}
            <button class="edit-button" on:click={setEditingCarnival}>Edit</button>
        {:else}
            <button class="edit-button" on:click={cancelEditingCarnival}>Cancel</button>
            <button class="edit-button" on:click={editCarnival} disabled={!dataChanged || null}>Save</button>
        {/if}

        <form method="POST" action="?/editCarnival" id="editCarnivalForm">
            <table>
                <tr>
                    <th>Name</th>
                    <!--Display editable or non-editable field-->
                    {#if editingCarnival}
                        <td><input type="text" name="carnival-name" bind:value={carnivalName}></td>
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
                        <td><input type="date" name="carnival-date" bind:value={carnivalDate} onfocus="this.showPicker()"></td>
                    {:else}
                        <td>{data.carnival.date}</td>
                    {/if}
                </tr>
                <tr>
                    <th>Start Time</th>
                    <!--Display editable or non-editable field-->
                    {#if editingCarnival}
                        <td><input type="time" name="carnival-start-time" bind:value={carnivalStartTime} onfocus="this.showPicker()"></td>
                    {:else}
                        <td>{data.carnival.startTime.slice(0, -3)}</td>
                    {/if}
                </tr>
                <tr>
                    <th>End Time</th>
                    <!--Display editable or non-editable field-->
                    {#if editingCarnival}
                        <td><input type="time" name="carnival-end-time" bind:value={carnivalEndTime} onfocus="this.showPicker()"></td>
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
                            <select name="carnival-location-id" id="carnival-location-id" bind:value={carnivalLocationID}>
                            {#each data.carnivalLocations as location}
                            <option value="{location.locationID}" selected={location.locationID == carnivalLocationID || null}>{location.location}</option>
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
                            <select name="carnival-staff-id" id="carnival-staff-id" bind:value={carnivalStaffID}>
                                {#each data.staffs as staff}
                                <option value="{staff.id}" selected={staff.id == carnivalStaffID || null}>{staff.firstName} {staff.lastName}</option>
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
        <!--Heading and help reference-->
        <h3>Event List <a href="https://docs.google.com/document/d/1EDETbrxlj94bFKMae59e_JWl4_bBhmmf#heading=h.qniv0lty9ocw" target="_blank"><i class="fa fa-question-circle help"></i></a></h3>

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
                <!--Heading and help reference-->
                <h3>Create Event <a href="https://docs.google.com/document/d/1EDETbrxlj94bFKMae59e_JWl4_bBhmmf#heading=h.uhtk5xmzguft" target="_blank"><i class="fa fa-question-circle help"></i></a></h3>

                <form method="POST" action="?/addEvent">
                    
                    <!--Add event input fields-->
                    <label>
                        Type
                        <!--Event type dropdown select-->
                        <select name="event-type-id" id="event-type-id" bind:value={selectedEventType} on:change={toggleChampionships} on:change={toggleAllAge}>
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
                        <input type="time" name="event-start-time" onfocus="this.showPicker()"> 
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