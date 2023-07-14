<script>
// @ts-nocheck

    export let records;
</script>

<table>
    <!--Table headers-->
    <tr>
        <th>Event</th>
        <th>Age Group</th>
        <th>Name</th>
        <th>Result</th>
    </tr>

    <!--Row of each record's event, age group and result-->
    {#each records as record}
    <tr>
        <td><a href="/carnivals/{record.carnivalID}/{record.eventID}">{record.type}</a></td>
        <td>{record.ageGroup}</td>
        <td><a href="/students/{record.studentID}">{record.firstName} {record.lastName}</a></td>
        <td>{record.result} {record.unit}</td>
    </tr>
    {/each}
</table>