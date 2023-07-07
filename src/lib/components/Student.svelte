<script>
    // @ts-nocheck
    
    export let id, firstName, lastName, house, number;
    
</script>
 
<!--Each row of students-->
<tr class="student">
    <td>{number}</td>
    <td>{house}</td>
    <td>{firstName}</td>
    <td>{lastName}</td>
    <td><a href="/students/{id}">Open</td>
    <td>
        <!--Remove button-->
        <form method="POST" action="?/removeStudent">
            <input type="hidden" id="id" name="id" value={id}>
            <button>Remove</button>
        </form>
    </td>
</tr>
    