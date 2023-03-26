<script>
// @ts-nocheck
    import Result from "$lib/components/Result.svelte";

    /** @type {import('./$types').PageData} */
    export let data;

</script>

<div>
    <h1>Event</h1>

    <div id="event-details">
        <h3>Event Details</h3>
    </div>

    <table>
        <tr>
            <th>Type</th>
            <td>{data.event.type}</td>
        </tr>
        <tr>
            <th>Age Group</th>
            <td>{data.event.ageGroup}</td>
        </tr>
        <tr>
            <th>Division</th>
            <td>{data.event.division}</td>
        </tr>
        <tr>
            <th>Start Time</th>
            <td>{data.event.startTime}</td>
        </tr>
        <tr>
            <th>Record</th>
            <td>{data.event.record}</td>
        </tr>
    </table>

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
                <th>First Name</th>
                <th>Last Name</th>
                <th>House</th>
                <th>DNF</th>
                <th>DQ</th>
                <th>Result</th>
            </tr>

            {#each data.results as result}
                <Result {...result} />
            {/each}
        </table>
    </div>
</div>