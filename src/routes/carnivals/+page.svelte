<script>
// @ts-nocheck

    // Import component
    import Carnival from '$lib/components/Carnival.svelte'

    // Import loaded data
    /** @type {import('./$types').PageData} */
    export let data;

    // Import action data
    /** @type {import('./$types').ActionData} */
    export let form;

</script>

<div id="main-container">
    <!--Tutorial-->
    {#if data.tutorial == "true"}
        <p style="color: purple">
            (1/4) This is the carnival page. Here, you can view all carnivals, create new carnivals, open and view the contents of existing carnivals, and remove carnivals. <br>
            Within each carnival's page, you can edit the carnival's details, and add or remove events. <br>
            Within each event's page, you can edit the event's details, and add or remove results. <br>
            <a href="/carnivals" style="float: right; color: red">Exit</a>
            <a href="/students?tutorial=true" style="float: right; margin-right: 20px">Next</a>
        </p>
    {/if}

    <div id="carnival-list">
        <!--Heading and help reference-->
        <h1>Carnival List <a href="https://docs.google.com/document/d/1EDETbrxlj94bFKMae59e_JWl4_bBhmmf#heading=h.fpzwwo9zyu4c" target="_blank"><i class="fa fa-question-circle help"></i></a></h1>

        <!--Display confirmation message-->
        {#if data.msg}
            <p id="msg">{data.msg}</p>
        {/if}

        <!--Display error message from creating carnival-->
        {#if form?.carnivalError}
            <p id="error">Create Carnival: {form?.carnivalError}</p>
        {/if}

        <!--Display error message from removing carnival-->
        {#if form?.carnivalRemoveError}
            <p id="error">Remove Carnival: {form?.carnivalRemoveError}</p>
        {/if}

        <table>
            <!--Table headers-->
            <tr>
                <th>Name</th>
                <th>Type</th>
                <th>Date</th>
                <th>Start</th>
                <th>End</th>
                <th>Location</th>
                <th>Organiser</th>
            </tr>

            <!--Row of each carnival's name, type, date, start time, end time, location, organiser + open & delete buttons-->
            {#each data.carnivals as carnival}
                <Carnival {...carnival} />
            {/each}
        </table>
    </div>

    <dialogue open>
        <article>
            <div id="create-carnival">
                <!--Heading and help reference-->
                <h3>Create Carnival <a href="https://docs.google.com/document/d/1EDETbrxlj94bFKMae59e_JWl4_bBhmmf#heading=h.bid2vyvtcpv5" target="_blank"><i class="fa fa-question-circle help"></i></a></h3>
        
                <form method="POST" action="?/addCarnival">
                    <!--Add carnival input fields-->
                    <label>
                        Name
                        <input type="text" name="carnival-name" placeholder="Carnival Name">
                    </label>
        
                    <label>
                        Type
                        <!--Carnival type dropdown select-->
                        <select name="carnival-type-id" id="carnival-type-id">
                            {#each data.carnivalTypes as type}
                            <option value="{type.typeID}">{type.type}</option>
                            {/each}
                        </select>
                    </label>
        
                    <label>
                        Date
                        <input type="date" name="carnival-date" onfocus="this.showPicker()">
                    </label>
        
                    <label>
                        Start Time
                        <input type="time" name="carnival-start-time" onfocus="this.showPicker()">
                    </label>
        
                    <label>
                        End Time
                        <input type="time" name="carnival-end-time" onfocus="this.showPicker()">
                    </label>
        
                    <label>
                        Location
                        <!--Carnival location dropdown select-->
                        <select name="carnival-location-id" id="carnival-location-id">
                            {#each data.carnivalLocations as location}
                            <option value="{location.locationID}">{location.location}</option>
                            {/each}
                        </select>
                    </label>
        
                    <label>
                        Organiser
                        <!--Carnival organiser dropdown select-->
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

<style>
    @import "$lib/css/main.css";
</style>