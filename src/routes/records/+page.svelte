<script>
    // @ts-nocheck
    
    // Fetch loaded data
    /** @type {import('./$types').PageData} */
    export let data;
    
</script>
    
<div id="main-container">
    <h1>Records</h1>

    <table>
        <!--Table headers-->
        <tr>
            <th>Event</th>
            <th>Age Group</th>
            <th>Name</th>
            <th>Result</th>
        </tr>

        <!--Row of each record's event, age group and result-->
        {#each data.athleticsRecords as athleticsRecord}
        <tr>
            <td>{athleticsRecord.type}</td>
            <td>{athleticsRecord.ageGroup}</td>
            <td><a href="/students/{athleticsRecord.studentID}">{athleticsRecord.firstName} {athleticsRecord.lastName}</a></td>
            <td>{athleticsRecord.result}</td>
        </tr>
        {/each}
        
    </table>
</div>

<style>
    @import "$lib/css/main.css";
</style>