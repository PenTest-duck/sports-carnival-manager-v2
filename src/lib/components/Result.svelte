<script>
// @ts-nocheck
    // Imports
    import { onMount } from "svelte";
    
    export let id, firstName, lastName, house, dnf, dq, result, points;
    export let placing;

    // Run on component creation
    onMount(() => {
        // Toggle checkbox based on DNF and DQ flags
        if (dnf == 1) {
            document.getElementById("result-dnf-" + id).setAttribute("checked", "");
        }
        if (dq == 1) {
            document.getElementById("result-dq-" + id).setAttribute("checked", "");
        }

        // Set non-qualifying result placing to N/A
        if (placing == 99999) {
            placing = "N/A";
        }
    });
</script>
 
<!--Each row of results-->
<tr class="result">
    <td>{placing}</td>
    <td>{points}</td>
    <td>{firstName}</td>
    <td>{lastName}</td>
    <td>{house}</td>
    <td><input type="checkbox" disabled id="result-dnf-{id}"></td>
    <td><input type="checkbox" disabled id="result-dq-{id}"></td>
    <td>{result}</td>
    <td>
        <!--Remove button-->
        <form method="POST" action="?/removeResult">
            <input type="hidden" id="id" name="id" value={id}>
            <button>Remove</button>
        </form>
    </td>
</tr>
    