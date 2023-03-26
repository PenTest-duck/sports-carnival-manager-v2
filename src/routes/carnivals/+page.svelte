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

    <!--<button class="contrast" data-target="modal-example" onClick="toggleModal(event)">Create Carnival</button>
    -->
    <dialogue open>
        <article>
            <div id="create-carnival">
                <h3>Create Carnival</h3>

                <form method="POST" action="?/addCarnival">
                    <label>
                        Name
                        <input type="text" name="carnival-name" placeholder="Carnival Name">
                    </label>
                    <label>
                        Type
                        <select name="carnival-type-id" id="carnival-type-id">
                            {#each data.carnivalTypes as type}
                            <option value="{type.typeID}">{type.type}</option>
                            {/each}
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
                        <select name="carnival-location-id" id="carnival-location-id">
                            {#each data.carnivalLocations as location}
                            <option value="{location.locationID}">{location.location}</option>
                            {/each}
                        </select>
                    </label>
                    <label>
                        Organiser
                        <select name="carnival-staff-id" id="carnival-staff-id">
                            {#each data.staffs as staff}
                            <option value="{staff.id}">{staff.firstName} {staff.lastName}</option>
                            {/each}
                        </select>
                    </label>
                    <button>Add</button>
                </form>
            </div>
        </article>
    </dialogue>
</div>