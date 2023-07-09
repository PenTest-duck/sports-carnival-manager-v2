<script>
// @ts-nocheck
    
    export let carnivalID;
    export let id, type, ageGroup, division, startTime, unit;
    
</script>

<!--Each row of events-->
<tr class="event">
    <td>{type}</td>
    <td>{ageGroup}</td>
    <td>{division}</td>
    <td>{startTime.slice(0, -3)}</td>           <!--Remove seconds display-->
    <!--Link to event page-->
    <td><a href="/carnivals/{carnivalID}/{id}">Open</td>
    <td>
        <!--Remove button-->
        <form method="POST" action="?/removeEvent">
            <input type="hidden" id="id" name="id" value={id}>
            <button>Remove</button>
        </form>
    </td>
</tr>
    