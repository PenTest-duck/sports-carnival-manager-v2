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
    <!--Tutorial-->
    {#if data.tutorial == "true"}
        <p style="color: purple">
            (2/4) This is the students page. Here, you can view and remove students, add a new student, and open each student's page. <br>
            Within each student's page, you can edit their details and see their participation history. <br>
            <a href="/carnivals" style="float: right; color: red">Exit</a>
            <a href="/houses?tutorial=true" style="float: right; margin-right: 20px">Next</a>
            <a href="/carnivals?tutorial=true" style="float: right; margin-right: 20px">Previous</a>
        </p>
    {/if}

    <h1>Students</h1>

    <!--Display confirmation message-->
    {#if data.msg}
        <p id="msg">{data.msg}</p>
    {/if}

    <!--Display error message from adding student-->
    {#if form?.error}
        <p id="error">Add Student: {form?.error}</p>
    {/if}

    <!--Display error message from removing student-->
    {#if form?.removeStudentError}
        <p id="error">Remove Student: {form?.studentRemoveError}</p>
    {/if}

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