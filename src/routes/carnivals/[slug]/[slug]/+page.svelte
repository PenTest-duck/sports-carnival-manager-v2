<script>
// @ts-nocheck
    // Import component
    import Result from "$lib/components/Result.svelte";

    // Import loaded data
    /** @type {import('./$types').PageData} */
    export let data;

    // Import action data
    /** @type {import('./$types').ActionData} */
    export let form;

    // Initialise variables
    let editingEvent = false;
    let dataChanged = false;

    // Changes form to editable values
    function setEditingEvent() {
        editingEvent = true;
    }

    // Returns form to displaying values
    function cancelEditingEvent() {
        editingEvent = false;
        dataChanged = false;
    }

    // Submits the POST request with edited values
    function editEvent() {
        document.getElementById("editEventForm").submit();
    }

    // Enable save button if data edited
    function setDataChanged() {
        dataChanged = true;
    }

</script>

<div id="main-container">
    <h1>Event</h1>

    <!--Back button to carnival-->
    <p><a href="/carnivals/{data.event.carnivalID}">Back to Carnival</a></p>

    <div id="event-details">
        <h3 class="details-display">Event Details</h3>

        <!--Edit or Cancel/Save buttons to show when needed-->
        {#if !editingEvent}
            <button class="edit-button" on:click={setEditingEvent}>Edit</button>
        {:else}
            <button class="edit-button" on:click={cancelEditingEvent}>Cancel</button>
            <button class="edit-button" on:click={editEvent} disabled={!dataChanged || null}>Save</button>
        {/if}

        <!--Display error message from saving event details-->
        {#if form?.eventError}
            <p id="error">{form?.eventError}</p>
        {/if}

        <form method="POST" action="?/editEvent" id="editEventForm">
            <table>
                <tr>
                    <th>Type</th>
                    <td>{data.event.type}</td>
                </tr>

                <tr>
                    <th>Age Group</th>
                    <!--Display editable or non-editable field-->
                    {#if editingEvent}
                        <td>
                            <!--Event age group dropdown select-->
                            <select name="event-age-group-id" id="event-age-group-id" on:input={setDataChanged}>
                            {#each data.eventAgeGroups as ageGroup}
                            <option value="{ageGroup.id}" selected={ageGroup.ageGroup === data.event.ageGroup || null}>{ageGroup.ageGroup}</option>
                            {/each}
                            </select>
                        </td>
                    {:else}
                        <td>{data.event.ageGroup}</td>
                    {/if}
                </tr>

                <tr>
                    <th>Division</th>
                    <!--Display editable or non-editable field-->
                    {#if editingEvent}
                        <td>
                            <!--Event division dropdown select-->
                            <select name="event-division-id" id="event-division-id" on:input={setDataChanged}>
                            {#each data.eventDivisions as division}
                            <option value="{division.id}" selected={division.division === data.event.division || null}>{division.division}</option>
                            {/each}
                            </select>
                        </td>
                    {:else}
                        <td>{data.event.division}</td>
                    {/if}
                </tr>

                <tr>
                    <th>Start Time</th>
                    <!--Display editable or non-editable field-->
                    {#if editingEvent}
                        <td><input type="time" name="event-start-time" value={data.event.startTime} min={data.carnival.startTime} max={data.carnival.endTime} on:input={setDataChanged}></td>
                    {:else}
                        <td>{data.event.startTime.slice(0, -3)}</td>
                    {/if}
                </tr>

                <tr>
                    <th>Record</th>
                    <td>{data.event.record}</td>
                </tr>

                <!--Hidden input fields for validating start time is within range of carnival start and end times-->
                <input type="hidden" name="event-min-time" value={data.carnival.startTime} />
                <input type="hidden" name="event-max-time" value={data.carnival.endTime} />
            </table>
        </form>
    </div>

    <div id="add-result">
        <h3>Results</h3>

        <form method="POST" action="?/addResult">
            <!--Display error message from saving result-->
            {#if form?.resultError}
                <p id="error">{form?.resultError}</p>
            {/if}

            <table>
                <!--Table headers-->
                <tr>
                    <th>Student</th>
                    <th>DNF</th>
                    <th>DQ</th>
                    <th>Result</th>
                </tr>

                <!--Add result input fields-->
                <tr>
                    <td>
                        <!--Result student dropdown select-->
                        <select name="event-student-id" id="event-student-id">
                            {#each data.students as student}
                            <option value="{student.id}">[{student.initials}] {student.firstName} {student.lastName}</option>
                            {/each}
                        </select>
                    </td>
                    <td><input type="checkbox" name="event-dnf"></td>
                    <td><input type="checkbox" name="event-dq"></td>
                    <td><input type="text" name="event-result"></td>
                    <button>Add</button>
                </tr>
            </table>
        </form>

        <table id="results-list">
            <!--Table headers-->
            <tr>
                <th>Rank</th>
                <th>Points</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>House</th>
                <th>DNF</th>
                <th>DQ</th>
                <th>Result ({data.event.unit})</th>
            </tr>

            <!--Row of each result's rank, points, first name, last name, house, DNF, DQ, result-->
            {#each data.results as result}
                <Result {...result} placing={result.placing} />
            {/each}
        </table>
    </div>
</div>

<style>
    @import "$lib/css/main.css";
</style>