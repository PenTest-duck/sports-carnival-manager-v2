<script>
// @ts-nocheck

    import Student from "$lib/components/Student.svelte";

    /** @type {import('./$types').PageData} */
    export let data;

</script>

<div id="main-container">
    <h1>Students</h1>

    <div id="students-list">
        <h3>Students List</h3>
        <table>
            <!--Table headers-->
            <tr>
                <th>Number</th>
                <th>House</th>
                <th>First Name</th>
                <th>Last Name</th>
            </tr>

            <!--Row of each student's number, first name, last name, house + open & remove buttons-->
            {#each data.students as student}
                <Student {...student} />
            {/each}
        </table>
    </div>

    <div id="add-student">
        <h3>Add Student</h3>

            <form method="POST" action="?/addStudent">
                <!--Add student input fields-->
                <label>
                    Number
                    <input type="text" name="student-number" placeholder="Number">
                </label>
                <label>
                    House
                    <!--House selection dropdown-->
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

<style>
    @import "$lib/css/containers.css";
</style>