<script>
    // @ts-nocheck
    
    /** @type {import('./$types').PageData} */
    export let data;
    
</script>
    
<div id="main-container">
    <h1>Records</h1>

    <table>
        <tr>
            <th>Event</th>
            <th>Age Group</th>
            <th>Result</th>
        </tr>

        {#each data.athletics_records as athletics_record}
        <tr>
            <td>{athletics_record.type}</td>
            <td>{athletics_record.ageGroup}</td>
            <td>{athletics_record.result}</td>
        </tr>
        {/each}
        
    </table>
</div>


<style>
    @import "$lib/css/main-container.css";
</style>