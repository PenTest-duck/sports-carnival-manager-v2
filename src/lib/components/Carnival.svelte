<script>
// @ts-nocheck

    export let id, name, type, date, startTime, endTime, location, firstName, lastName;

</script>

<tr class="carnival">
    <td>{name}</td>
    <td>{type}</td>
    <td>{date}</td>
    <td>{startTime.slice(0, -3)}</td>
    <td>{endTime.slice(0, -3)}</td>
    <td>{location}</td>
    <td>{firstName} {lastName}</td>
    <td><a href="/carnivals/{id}">Open</td>
    <td>
        <form method="POST" action="?/removeCarnival">
            <input type="hidden" id="id" name="id" value={id}>
            <button><i class="fa-solid fa-trash" style="color: red"></i></button>
        </form>
    </td>
</tr>
