<script>
    // @ts-nocheck
    
        export let id, type, ageGroup, division, startTime, endTime, location;
    
    </script>
    
    <tr class="carnival">
        <td>{type}</td>
        <td>{ageGroup}</td>
        <td>{division}</td>
        <td>{startTime}</td>
        <td>{endTime}</td>
        <td>{location}</td>
        <td><a href="/carnivals/{id}">Open</td>
        <td>
            <form method="POST" action="?/removeEvent">
                <input type="hidden" id="id" name="id" value={id}>
                <button>Remove</button>
            </form>
        </td>
    </tr>
    