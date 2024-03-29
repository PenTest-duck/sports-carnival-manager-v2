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

    let studentFirstName = data.student.firstName;
    let studentLastName = data.student.lastName;
    let studentHouseID = data.student.houseID;
    let studentNumber = data.student.number;

    // Changes form to editable values
    function setEditingStudent() {
        editingStudent = true;
    }

    // Returns form to displaying values
    function cancelEditingStudent() {
        editingStudent = false;
        dataChanged = false;

        studentFirstName = data.student.firstName;
        studentLastName = data.student.lastName;
        studentHouseID = data.student.houseID;
        studentNumber = data.student.number;
    }

    // Submits the POST request with edited values
    function editStudent() {
        document.getElementById("editStudentForm").submit();
    }

    // Enable save button if data edited
    $: if (studentFirstName != data.student.firstName
        || studentLastName != data.student.lastName
        || studentHouseID != data.student.houseID
        || studentNumber != data.student.number) {
            dataChanged = true;
    } else {
        dataChanged = false;
    }
</script>

<div id="main-container">
    <h1>{data.student.firstName} {data.student.lastName}</h1>

    <!--Display confirmation message-->
    {#if data.msg}
        <p id="msg">{data.msg}</p>
    {/if}

    <!--Display error message from saving student details-->
    {#if form?.error}
        <p id="error">Edit Student: {form?.error}</p>
    {/if}

    <div id="student-details">
        <!--Heading and help reference-->
        <h3 class="details-display">Student Details <a href="https://docs.google.com/document/d/1EDETbrxlj94bFKMae59e_JWl4_bBhmmf#heading=h.v6m1px1jer9i" target="_blank"><i class="fa fa-question-circle help"></i></a></h3>

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

        <form method="POST" action="?/editStudent" id="editStudentForm">
            <table>
                <tr>
                    <th>First Name</th>
                    <!--Display editable or non-editable field-->
                    {#if editingStudent}
                        <td><input type="text" name="student-first-name" bind:value={studentFirstName}></td>
                    {:else}
                        <td>{data.student.firstName}</td>
                    {/if}
                </tr>
                
                <tr>
                    <th>Last Name</th>
                    <!--Display editable or non-editable field-->
                    {#if editingStudent}
                        <td><input type="text" name="student-last-name" bind:value={studentLastName}></td>
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
                            <select name="student-house-id" id="student-house-id" bind:value={studentHouseID}>
                                {#each data.houses as house}
                                    <option value="{house.id}" selected={house.id == studentHouseID|| null}>{house.house}</option>
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
                        <td><input type="text" name="student-number" bind:value={studentNumber}></td>
                    {:else}
                        <td>{data.student.number}</td>
                    {/if}
                </tr>
            </table>
        </form>
    </div>

    <div id="participation-history">
        <!--Heading and help reference-->
        <h3 class="details-display">Participation History <a href="https://docs.google.com/document/d/1EDETbrxlj94bFKMae59e_JWl4_bBhmmf#heading=h.wu05h0gqw9bu" target="_blank"><i class="fa fa-question-circle help"></i></a></h3>

        <table>
            <!--Table headers-->
            <tr>
                <th>Carnival</th>
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
            <Participation {...result} events={data.events} carnivals={data.carnivals}/>
            {/each}
        </table>
    </div>
</div>

<style>
    @import "$lib/css/main.css";
</style>