<script>
// @ts-nocheck
    
    export let carnivalID;
    export let id, type, ageGroup, division, startTime, endTime, location;
    
</script>
    
<tr class="event">
    <td>{type}</td>
    <td>{ageGroup}</td>
    <td>{division}</td>
    <td>{startTime}</td>
    <td>{endTime}</td>
    <td>{location}</td>
    <td><a href="/carnivals/{carnivalID}/{id}">Open</td>
    <td>
        <form method="POST" action="?/removeEvent">
            <input type="hidden" id="id" name="id" value={id}>
            <button>Remove</button>
        </form>
    </td>
</tr>
    