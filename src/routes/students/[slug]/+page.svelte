<script>
// @ts-nocheck


    /** @type {import('./$types').PageData} */
    export let data;

    let editingStudent = false;
    let dataChanged = false;

    function setEditingStudent() {
        editingStudent = true;
    }

    function cancelEditingStudent() {
        editingStudent = false;
        dataChanged = false;
    }

    function editStudent() {
        document.getElementById("editStudentForm").submit();
    }

    function setDataChanged() {
        dataChanged = true;
    }
</script>

<div>
    <h1>Student</h1>

    <div id="student-details">
        <h3 style="display: inline-block">Student Details</h3>
        {#if !editingStudent}
            <button style="display: inline-block; width: 100px" on:click={setEditingStudent}>Edit</button>
        {:else}
            <button style="display: inline-block; width: 150px; height: 50px" on:click={cancelEditingStudent}>Cancel</button>
            <button style="display: inline-block; width: 150px; height: 50px" on:click={editStudent} disabled={!dataChanged || null}>Save</button>
        {/if}

        <form method="POST" action="?/editStudent" id="editStudentForm">
        <table>
            <tr>
                <th>First Name</th>
                {#if editingStudent}
                    <td><input type="text" name="student-first-name" value={data.student.firstName} on:input={setDataChanged}></td>
                {:else}
                    <td>{data.student.firstName}</td>
                {/if}
            </tr>
            <tr>
                <th>Last Name</th>
                {#if editingStudent}
                    <td><input type="text" name="student-last-name" value={data.student.lastName} on:input={setDataChanged}></td>
                {:else}
                    <td>{data.student.lastName}</td>
                {/if}
            </tr>
            <tr>
                <th>House</th>
                {#if editingStudent}
                    <td>
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
        
    </div>
</div>