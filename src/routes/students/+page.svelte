<script>
    import Student from "$lib/components/Student.svelte";

    /** @type {import('./$types').PageData} */
    export let data;

</script>

<div>
    <h1>Students</h1>

    <div id="students-list">
        <h3>Students List</h3>
        <table>
            <tr>
                <th>Number</th>
                <th>House</th>
                <th>First Name</th>
                <th>Last Name</th>
            </tr>

            {#each data.students as student}
                <Student {...student} />
            {/each}
        </table>
    </div>

    <div id="add-student">
        <h3>Add Student</h3>

            <form method="POST" action="?/addStudent">
                <label>
                    Number
                    <input type="text" name="student-number" placeholder="Number">
                </label>
                <label>
                    House
                    <select name="student-house-id" id="student-house-id">
                        {#each data.houses as house}
                        <option value="{house.id}">{house.house}</option>
                        {/each}
                    </select>
                </label>
                <label>
                    First Name
                    <input type="text" name="student-first-name" placeholder="First name">
                </label>
                <label>
                    Last Name
                    <input type="text" name="student-last-name" placeholder="Last name">
                </label>
                <button>Add</button>
            </form>
    </div>
</div>