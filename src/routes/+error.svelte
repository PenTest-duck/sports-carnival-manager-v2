<script>
    import { page } from '$app/stores';
</script>

<!--Error page-->
<h1>{$page.status}</h1>
<h5 style="color: orangered">{$page.error.message}</h5>