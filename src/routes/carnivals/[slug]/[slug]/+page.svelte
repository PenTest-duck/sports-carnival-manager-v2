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

    let eventAgeGroupID = data.event.ageGroupID;
    let eventDivisionID = data.event.divisionID;
    let eventStartTime = data.event.startTime.slice(0, -3);

    // Changes form to editable values
    function setEditingEvent() {
        editingEvent = true;
    }

    // Returns form to displaying values
    function cancelEditingEvent() {
        editingEvent = false;
        dataChanged = false;

        eventAgeGroupID = data.event.ageGroupID;
        eventDivisionID = data.event.divisionID;
        eventStartTime = data.event.startTime.slice(0, -3);
    }

    // Submits the POST request with edited values
    function editEvent() {
        document.getElementById("editEventForm").submit();
    }

    // Enable save button if data edited
    $: if (eventAgeGroupID != data.event.ageGroupID
        || eventDivisionID != data.event.divisionID
        || eventStartTime != data.event.startTime.slice(0, -3)) {
            dataChanged = true;
    } else {
        dataChanged = false;
    }

    // Check if event only has championship division
    const championshipEventTypeIDs = [4, 5, 10, 11, 12, 18, 19, 20, 21, 22, 23, 24, 25, 26];
    let onlyChampionship = false;

    if (championshipEventTypeIDs.includes(data.event.typeID)) {
        onlyChampionship = true;
    } else {
        onlyChampionship = false;
    }

</script>

<div id="main-container">
    <h1>
        <a href="/carnivals/{data.event.carnivalID}">{data.carnival.name}</a> / {data.event.type}
        <h4 style="top: -50px">{data.event.ageGroup} - {data.event.division}</h4>
    </h1>

    <!--Display confirmation message-->
    {#if data.msg}
        <p id="msg">{data.msg}</p>
    {/if}

    <!--Display error message from saving event details-->
    {#if form?.eventError}
        <p id="error">Edit Event: {form?.eventError}</p>
    {/if}

    <!--Display error message from saving result-->
    {#if form?.resultError}
        <p id="error">Add Result: {form?.resultError}</p>
    {/if}

    <!--Display error message from removing result-->
    {#if form?.resultRemoveError}
        <p id="error">Remove Result: {form?.resultRemoveError}</p>
    {/if}

    <div id="event-details">
        <!--Heading and help reference-->
        <h3 class="details-display">Event Details <a href="https://docs.google.com/document/d/1EDETbrxlj94bFKMae59e_JWl4_bBhmmf#heading=h.yo8j3bffw9q9" target="_blank"><i class="fa fa-question-circle help"></i></a></h3>

        <!--Edit or Cancel/Save buttons to show when needed-->
        {#if !editingEvent}
            <button class="edit-button" on:click={setEditingEvent}>Edit</button>
        {:else}
            <button class="edit-button" on:click={cancelEditingEvent}>Cancel</button>
            <button class="edit-button" on:click={editEvent} disabled={!dataChanged || null}>Save</button>
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
                            <select name="event-age-group-id" id="event-age-group-id" bind:value={eventAgeGroupID}>
                            {#each data.eventAgeGroups as ageGroup}
                            <option value="{ageGroup.id}" selected={ageGroup.id == eventAgeGroupID || null}>{ageGroup.ageGroup}</option>
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
                            <!--If championship only event, only show championship-->
                            {#if onlyChampionship}
                                <select name="event-division-id" id="event-division-id">
                                    <option value="1">Championships</option>
                                </select>
                            <!--Otherwise show all divisions-->
                            {:else}
                                <select name="event-division-id" id="event-division-id" bind:value={eventDivisionID}>
                                    {#each data.eventDivisions as division}
                                        <option value="{division.id}" selected={division.id === eventDivisionID || null}>{division.division}</option>
                                    {/each}
                                </select>
                            {/if}
                        </td>
                    {:else}
                        <td>{data.event.division}</td>
                    {/if}
                </tr>

                <tr>
                    <th>Start Time</th>
                    <!--Display editable or non-editable field-->
                    {#if editingEvent}
                        <td><input type="time" name="event-start-time" bind:value={eventStartTime} onfocus="this.showPicker()"></td>
                    {:else}
                        <td>{data.event.startTime.slice(0, -3)}</td>
                    {/if}
                </tr>

                <tr>
                    <th>Record</th>
                    {#if data.eventRecord}
                        <td>{data.eventRecord.result} {data.event.unit}</td>
                    {:else}
                        <td>N/A</td>
                    {/if}
                </tr>

                <input type="hidden" name="event-type-id" value={data.event.typeID} />
                <!--Hidden input fields for validating start time is within range of carnival start and end times-->
                <input type="hidden" name="event-min-time" value={data.carnival.startTime} />
                <input type="hidden" name="event-max-time" value={data.carnival.endTime} />
            </table>
        </form>
    </div>

    <div id="add-result">
        <!--Heading and help reference-->
        <h3>Results <a href="https://docs.google.com/document/d/1EDETbrxlj94bFKMae59e_JWl4_bBhmmf#heading=h.y8klqxedu9ec" target="_blank"><i class="fa fa-question-circle help"></i></a></h3>

        <form method="POST" action="?/addResult">

            <table>
                <!--Table headers-->
                <tr>
                    <th>Student</th>
                    <th>DNF</th>
                    <th>DQ</th>
                    <th>Result ({data.event.unit})</th>
                </tr>

                <!--Add result input fields-->
                <tr>
                    <td>
                        <!--Result student dropdown select-->
                        <select name="event-student-id" id="event-student-id" style="margin-top: 10px">
                            {#each data.students as student}
                            <option value="{student.id}">[{student.initials}] {student.firstName} {student.lastName}</option>
                            {/each}
                        </select>
                    </td>
                    <td><input type="checkbox" name="event-dnf"></td>
                    <td><input type="checkbox" name="event-dq"></td>
                    <td><input type="text" name="event-result" style="margin-top: 10px"></td>
                    <button style="margin-top: 20px">Add</button>
                </tr>
            </table>
        </form>

        <table id="results-list">
            <!--Table headers-->
            <tr>
                <th>Rank</th>
                <th>Points <a href="https://docs.google.com/document/d/1EDETbrxlj94bFKMae59e_JWl4_bBhmmf#heading=h.d16imucn6kw6" target="_blank"><i class="fa fa-question-circle help"></i></a></th>
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