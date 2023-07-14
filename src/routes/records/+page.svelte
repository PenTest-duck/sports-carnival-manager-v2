<script>
    // @ts-nocheck
    // Import component
    import RecordsTable from "$lib/components/RecordsTable.svelte";
    
    // Fetch loaded data
    /** @type {import('./$types').PageData} */
    export let data;
    
</script>
    
<div id="main-container">
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