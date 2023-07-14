<script>
// @ts-nocheck

    // Import components
    import Student from "$lib/components/Student.svelte";

    // Fetch loaded data
    /** @type {import('./$types').PageData} */
    export let data;

    // Fetch action data
    /** @type {import('./$types').ActionData} */
    export let form;

</script>

<div id="main-container">
    <h1>Students</h1>

    <div id="students-list">
        <!--Heading and help reference-->
        <h3>Student List <a href="https://docs.google.com/document/d/1EDETbrxlj94bFKMae59e_JWl4_bBhmmf#heading=h.5464uj4uu5io" target="_blank"><i class="fa fa-question-circle help"></i></a></h3>

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
        <!--Heading and help reference-->
        <h3>Add Student <a href="https://docs.google.com/document/d/1EDETbrxlj94bFKMae59e_JWl4_bBhmmf#heading=h.lqpozl3zdveg" target="_blank"><i class="fa fa-question-circle help"></i></a></h3>

        <!--Display error message from server process-->
        {#if form?.error}
            <p id="error">{form?.error}</p>
        {/if}

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
    @import "$lib/css/main.css";
</style>