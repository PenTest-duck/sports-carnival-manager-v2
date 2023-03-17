<script>
// @ts-nocheck

    /** @type {import('./$types').PageData} */
    export let data;


</script>

<div>
    <h1>Carnival</h1>

    <div id="carnival-details">
        <h3>Carnival Details</h3>

        <table>
            <tr>
                <th>Name</th>
                <td>{data.carnival.name}</td>
            </tr>
            <tr>
                <th>Type</th>
                <td>{data.carnival.type}</td>
            </tr>
            <tr>
                <th>Date</th>
                <td>{data.carnival.date}</td>
            </tr>
            <tr>
                <th>Start Time</th>
                <td>{data.carnival.startTime}</td>
            </tr>
            <tr>
                <th>End Time</th>
                <td>{data.carnival.endTime}</td>
            </tr>
            <tr>
                <th>Location</th>
                <td>{data.carnival.location}</td>
            </tr>
            <tr>
                <th>Organiser</th>
                <td>{data.carnival.organiser}</td>
            </tr>
        </table>
    </div>

    <div id="events-list">
        <h3>Events</h3>
    </div>

    <dialogue open>
        <article>
            <div id="create-event">
                <h3>Create Event</h3>

                <form method="POST" action="?/addEvent">
                    
                    <button>Add</button>
                </form>
            </div>
        </article>
    </dialogue>
</div>