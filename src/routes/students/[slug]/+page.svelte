<script>
// @ts-nocheck

    // Import component
    import Participation from '$lib/components/Participation.svelte';

    // Fetch loaded data
    /** @type {import('./$types').PageData} */
    export let data;

    // Fetch action data
    /** @type {import('./$types').ActionData} */
    export let form;

    // Initialise variables
    let editingStudent = false;
    let dataChanged = false;

    // Changes form to editable values
    function setEditingStudent() {
        editingStudent = true;
    }

    // Returns form to displaying values
    function cancelEditingStudent() {
        editingStudent = false;
        dataChanged = false;
    }

    // Submits the POST request with edited values
    function editStudent() {
        document.getElementById("editStudentForm").submit();
    }

    // Enable save button if data edited
    function setDataChanged() {
        dataChanged = true;
    }
</script>

<div id="main-container">
    <h1>Student</h1>

    <div id="student-details">
        <h3 class="details-display">Student Details</h3>

        <!--Edit or Cancel/Save buttons to show when needed-->
        {#if !editingStudent}
            <!--Initially only display Edit button-->
            <button class="edit-button" on:click={setEditingStudent}>Edit</button>
        {:else}
            <!--If editing, display cancel button-->
            <button class="edit-button" on:click={cancelEditingStudent}>Cancel</button>
            <!--If data edited, enable save button-->
            <button class="edit-button" on:click={editStudent} disabled={!dataChanged || null}>Save</button>
        {/if}

        <!--Display error message from server process-->
        {#if form?.error}
            <p id="error">{form?.error}</p>
        {/if}

        <form method="POST" action="?/editStudent" id="editStudentForm">
            <table>
                <tr>
                    <th>First Name</th>
                    <!--Display editable or non-editable field-->
                    {#if editingStudent}
                        <td><input type="text" name="student-first-name" value={data.student.firstName} on:input={setDataChanged}></td>
                    {:else}
                        <td>{data.student.firstName}</td>
                    {/if}
                </tr>
                
                <tr>
                    <th>Last Name</th>
                    <!--Display editable or non-editable field-->
                    {#if editingStudent}
                        <td><input type="text" name="student-last-name" value={data.student.lastName} on:input={setDataChanged}></td>
                    {:else}
                        <td>{data.student.lastName}</td>
                    {/if}
                </tr>

                <tr>
                    <th>House</th>
                    <!--Display editable or non-editable field-->
                    {#if editingStudent}
                        <td>
                            <!--Display dropdown of houses-->
                            <select name="student-house-id" id="student-house-id" on:input={setDataChanged}>
                                {#each data.houses as house}
                                    <option value="{house.id}" selected={house.house === data.student.house || null}>{house.house}</option>
                                {/each}
                            </select>
                        </td>
                    {:else}
                        <td>{data.student.house}</td>
                    {/if}
                </tr>

                <tr>
                    <th>Student Number</th>
                    <!--Display editable or non-editable field-->
                    {#if editingStudent}
                        <td><input type="text" name="student-number" value={data.student.number} on:input={setDataChanged}></td>
                    {:else}
                        <td>{data.student.number}</td>
                    {/if}
                </tr>
            </table>
        </form>
    </div>

    <div id="participation-history">
        <h3>Participation History</h3>
        <table>
            <!--Table headers-->
            <tr>
                <th>Event</th>
                <th>Age Group</th>
                <th>Division</th>
                <th>Rank</th>
                <th>DNF</th>
                <th>DQ</th>
                <th>Result</th>
                <th>Points</th>
            </tr>

            <!--Row of each result's event, age group, division, placing, DNF, DQ, result value, and points-->
            {#each data.results as result}
            <Participation {...result} events={data.events}/>
            {/each}
        </table>
    </div>
</div>

<style>
    @import "$lib/css/main.css";
</style>