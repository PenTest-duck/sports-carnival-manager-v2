<script>
    // @ts-nocheck
    import { onMount } from "svelte";
    
    export let id, firstName, lastName, house, dnf, dq, result;

    onMount(() => {
        if (dnf == 1) {
            document.getElementById("result-dnf").setAttribute("checked", "");
        }
        if (dq == 1) {
            document.getElementById("result-dq").setAttribute("checked", "");
        }
    });
</script>
 
 
<tr class="result">
    <td>Rank</td>
    <td>{firstName}</td>
    <td>{lastName}</td>
    <td>{house}</td>
    <td><input type="checkbox" id="result-dnf"></td>
    <td><input type="checkbox" id="result-dq"></td>
    <td>{result}</td>
    <td>
        <form method="POST" action="?/removeResult">
            <input type="hidden" id="id" name="id" value={id}>
            <button>Remove</button>
        </form>
    </td>
</tr>
    