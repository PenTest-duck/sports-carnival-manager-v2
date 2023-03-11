<script>
// @ts-nocheck
    import Carnival from '$lib/components/Carnival.svelte'

    /** @type {import('./$types').PageData} */
    export let data;

</script>

<div style="width: 40%">
    <div id="carnival-list">
        <h3>Carnival List</h3>

        <table>
            <tr>
                <th>Name</th>
                <th>Type</th>
                <th>Date</th>
                <th>Start</th>
                <th>End</th>
                <th>Location</th>
                <th>Organiser</th>
            </tr>
            {#each data.carnivals as carnival}
                <Carnival {...carnival} />
            {/each}
        </table>
    </div>

    <div id="create-carnival">
        <h3>Create Carnival</h3>

        <form method="POST" action="?/addCarnival">
            <label>
                Name
                <input type="text" name="carnival-name" placeholder="Carnival Name">
            </label>
            <label>
                Type
                <select name="carnival-type" id="carnival-type">
                    <option value="Athletics">Athletics Carnival</option>
                    <option value="Swimming">Swimming Carnival</option>
                    <option value="Cross Country">Cross Country</option>
                </select>
            </label>
            <label>
                Date
                <input type="date" name="carnival-date">
            </label>
            <label>
                Start Time
                <input type="time" name="carnival-start-time">
            </label>
            <label>
                End Time
                <input type="time" name="carnival-end-time">
            </label>
            <label>
                Location
                <select name="carnival-location" id="carnival-location">
                    <option value="White Oval">White Oval</option>
                    <option value="Doyles">Doyles</option>
                </select>
            </label>
            <button>Add</button>
        </form>
    </div>
</div>