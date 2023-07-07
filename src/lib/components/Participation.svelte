<script>
// @ts-nocheck
    // Imports
    import { onMount } from "svelte";
    
    export let id, eventID, dnf, dq, placing, result, points;
    export let events;

    // Initialise to N/A
    let type = "N/A";
    let ageGroup = "N/A";
    let division = "N/A";

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

        // Translate IDs to event type, age group, division
        for (const event of events) {
            if (event.id == eventID) {
                type = event.type;
                ageGroup = event.ageGroup;
                division = event.division;
            }
        }
    });
</script>
 
<!--Each row of participations-->
<tr class="participation">
    <td>{type}</td>
    <td>{ageGroup}</td>
    <td>{division}</td>
    <td>{placing}</td>
    <td><input type="checkbox" disabled id="result-dnf-{id}"></td>
    <td><input type="checkbox" disabled id="result-dq-{id}"></td>
    <td>{result}</td>
    <td>{points}</td>
</tr>
    