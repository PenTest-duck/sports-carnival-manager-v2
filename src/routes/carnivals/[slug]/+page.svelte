<script>
// @ts-nocheck
    import Event from '$lib/components/Event.svelte'

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

        <table>
            <tr>
                <th>Type</th>
                <th>Age Group</th>
                <th>Division</th>
                <th>Start Time</th>
                <th>End Time</th>
                <th>Location</th>
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
                    </label>

                    <label>
                        End Time
                        <input type="time" name="event-end-time">
                    </label>

                    <label>
                        Location
                        <select name="event-location-id" id="event-location-id">
                            {#each data.eventLocations as location}
                            <option value="{location.id}">{location.location}</option>
                            {/each}
                        </select>
                    </label>

                    <button>Add</button>
                </form>
            </div>
        </article>
    </dialogue>
</div>