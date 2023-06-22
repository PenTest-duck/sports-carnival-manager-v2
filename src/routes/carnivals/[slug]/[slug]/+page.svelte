<script>
// @ts-nocheck
    import Result from "$lib/components/Result.svelte";

    /** @type {import('./$types').PageData} */
    export let data;

    let editingEvent = false;
    let dataChanged = false;

    function setEditingEvent() {
        editingEvent = true;
    }

    function cancelEditingEvent() {
        editingEvent = false;
        dataChanged = false;
    }

    function editEvent() {
        document.getElementById("editEventForm").submit();
    }

    function setDataChanged() {
        dataChanged = true;
    }

</script>

<div id="main-container">
    <h1>Event</h1>

    <p><a href="/carnivals/{data.event.carnivalID}">Back to Carnival</a></p>

    <div id="event-details">
        <h3 style="display: inline-block;">Event Details</h3>
        {#if !editingEvent}
            <button style="float: right; display: inline-block; width: 120px" on:click={setEditingEvent}>Edit</button>
        {:else}
            <button style="float: right; display: inline-block; width: 120px; margin-left: 10px" on:click={cancelEditingEvent}>Cancel</button>
            <button style="float: right; display: inline-block; width: 120px" on:click={editEvent} disabled={!dataChanged || null}>Save</button>
        {/if}

        <form method="POST" action="?/editEvent" id="editEventForm">
        <table>
            <tr>
                <th>Type</th>
                <td>{data.event.type}</td>
            </tr>
            <tr>
                <th>Age Group</th>
                {#if editingEvent}
                    <td>
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
                {#if editingEvent}
                    <td>
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
                {#if editingEvent}
                    <td><input type="time" name="event-start-time" value={data.event.startTime} on:input={setDataChanged}></td>
                {:else}
                    <td>{data.event.startTime.slice(0, -3)}</td>
                {/if}
            </tr>
            <tr>
                <th>Record</th>
                <td>{data.event.record}</td>
            </tr>
        </table>
        </form>
    </div>

    <div id="add-result">
        <h3>Results</h3>

        <form method="POST" action="?/addResult">
            <table>
                <tr>
                    <th>Student</th>
                    <th>DNF</th>
                    <th>DQ</th>
                    <th>Result</th>
                </tr>
                <tr>
                    <td>
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

            {#each data.results as result}
                <Result {...result} rank={result.placing} />
            {/each}
        </table>
    </div>
</div>

<style>
    @import "$lib/css/containers.css";
</style>