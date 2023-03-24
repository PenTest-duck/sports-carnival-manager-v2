<script>
// @ts-nocheck

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
            <th>End Time</th>
            <td>{data.event.endTime}</td>
        </tr>
        <tr>
            <th>Location</th>
            <td>{data.event.location}</td>
        </tr>
        <tr>
            <th>Record</th>
            <td>{data.event.record}</td>
        </tr>
    </table>

    <div id="add-result">
        <h3>Results</h3>

        <table>
            <tr>
                <th>Rank</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>House</th>
                <th>DNF</th>
                <th>DQ</th>
                <th>Result</th>
            </tr>

            <tr>
                <td></td>
                <td>
                    <input type="text" name="event-first-name" placeholder="First">
                </td>
                <td>
                    <input type="text" name="event-last-name" placeholder="First">
                </td>
            </tr>
        </table>

        <form method="POST" action="?/addResult">
            <button>Add</button>
        </form>
    </div>

</div>