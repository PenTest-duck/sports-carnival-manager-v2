<script>
// @ts-nocheck

    export let id, name, type, date, startTime, endTime, location, firstName, lastName;

</script>

<tr class="carnival">
    <td>{name}</td>
    <td>{type}</td>
    <td>{date}</td>
    <td>{startTime}</td>
    <td>{endTime}</td>
    <td>{location}</td>
    <td>{firstName} {lastName}</td>
    <td><a href="/carnivals/{id}">Open</td>
    <td>
        <form method="POST" action="?/removeCarnival">
            <input type="hidden" id="id" name="id" value={id}>
            <button>Remove</button>
        </form>
    </td>
</tr>
