<script>
// @ts-nocheck
    // Imports
    import { onMount } from "svelte";

    export let id, name, type, date, startTime, endTime, location, firstName, lastName;

    /*// Run on component creation
    onMount(() => {
        const form = document.getElementById("form");
        document.querySelector("submit").addEventListener("click", function() {
            form.submit();
        });
    });*/

</script>

<!--Each row of carnivals-->
<tr class="carnival">
    <td>{name}</td>
    <td>{type}</td>
    <td>{date}</td>
    <td>{startTime.slice(0, -3)}</td>           <!--Remove seconds display-->
    <td>{endTime.slice(0, -3)}</td>             <!--Remove seconds display-->
    <td>{location}</td>
    <td>{firstName} {lastName}</td>
    <!--Link to carnival page-->
    <td><a href="/carnivals/{id}">Open</td>
    <td>
        <!--Remove button-->
        <form id="form" method="POST" action="?/removeCarnival">
            <input type="hidden" id="id" name="id" value={id}>
            <button>Remove</button>
            <!--<i id="submit" class="fa-solid fa-trash" style="color: red"></i>-->
        </form>
    </td>
</tr>
