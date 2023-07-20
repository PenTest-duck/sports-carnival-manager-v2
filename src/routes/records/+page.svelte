<script>
    // @ts-nocheck
    // Import component
    import RecordsTable from "$lib/components/RecordsTable.svelte";
    
    // Fetch loaded data
    /** @type {import('./$types').PageData} */
    export let data;
    
</script>
    
<div id="main-container">
    <!--Tutorial-->
    {#if data.tutorial == "true"}
        <p style="color: purple">
            (4/4) This is the records page. Here, you can view the all-time records across all three carnival types: Athletics Carnival, Swimming Carnival, and Cross Country. <br>
            You can click on each event type to navigate to the event page which contains the record result, and each students' name to navigate to their page. <br>
            <a href="/carnivals" style="float: right; color: red">Exit</a>
            <a href="/houses?tutorial=true" style="float: right; margin-right: 20px">Previous</a>
        </p>
    {/if}

    <!--Heading and help reference-->
    <h1>Records <a href="https://docs.google.com/document/d/1EDETbrxlj94bFKMae59e_JWl4_bBhmmf#heading=h.d52km2unpdlz" target="_blank"><i class="fa fa-question-circle help"></i></a></h1>

    <!--Athletics records-->
    <h3>Athletics Carnival</h3>
    <RecordsTable records={data.athleticsRecords} />

    <!--Swimming records-->
    <h3>Swimming Carnival</h3>
    <RecordsTable records={data.swimmingRecords} />

    <!--Cross country records-->
    <h3>Cross Country</h3>
    <RecordsTable records={data.crossCountryRecords} />
</div>

<style>
    @import "$lib/css/main.css";
</style>