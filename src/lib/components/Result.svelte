<script>
    // @ts-nocheck
    import { onMount } from "svelte";
    
    export let id, firstName, lastName, house, dnf, dq, result, points;
    export let rank;

    onMount(() => {
        if (dnf == 1) {
            document.getElementById("result-dnf-" + id).setAttribute("checked", "");
        }
        if (dq == 1) {
            document.getElementById("result-dq-" + id).setAttribute("checked", "");
        }
        if (rank == 99999) {
            rank = "N/A";
        }
    });
</script>
 
 
<tr class="result">
    <td>{rank}</td>
    <td>{points}</td>
    <td>{firstName}</td>
    <td>{lastName}</td>
    <td>{house}</td>
    <td><input type="checkbox" id="result-dnf-{id}"></td>
    <td><input type="checkbox" id="result-dq-{id}"></td>
    <td>{result}</td>
    <td>
        <form method="POST" action="?/removeResult">
            <input type="hidden" id="id" name="id" value={id}>
            <button>Remove</button>
        </form>
    </td>
</tr>
    