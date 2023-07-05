<script>
// @ts-nocheck
    
    export let carnivalID;
    export let id, type, ageGroup, division, startTime;
    
</script>
    
<tr class="event">
    <td>{type}</td>
    <td>{ageGroup}</td>
    <td>{division}</td>
    <td>{startTime.slice(0, -3)}</td>
    <td><a href="/carnivals/{carnivalID}/{id}">Open</td>
    <td>
        <form method="POST" action="?/removeEvent">
            <input type="hidden" id="id" name="id" value={id}>
            <button>Remove</button>
        </form>
    </td>
</tr>
    