<script>
    // @ts-nocheck
    import { onMount } from "svelte";
    
    export let id, eventID, studentID, dnf, dq, placing, result;
    export let events;

    let type = "N/A";
    let ageGroup = "N/A";
    let division = "N/A";

    onMount(() => {
        if (dnf == 1) {
            document.getElementById("result-dnf-" + id).setAttribute("checked", "");
        }
        if (dq == 1) {
            document.getElementById("result-dq-" + id).setAttribute("checked", "");
        }
        if (placing == 99999) {
            placing = "N/A";
        }

        // TO FIX 
        for (const event of events) {
            console.log(event.id);
            if (event.id == eventID) {
                type = event.type;
                ageGroup = event.ageGroup;
                division = event.division;
            }
        }
    });
</script>
 
<tr class="participation">
    <td>{type}</td>
    <td>{ageGroup}</td>
    <td>{division}</td>
    <td>{placing}</td>
    <td><input type="checkbox" disabled id="result-dnf-{id}"></td>
    <td><input type="checkbox" disabled id="result-dq-{id}"></td>
    <td>{result}</td>
</tr>
    