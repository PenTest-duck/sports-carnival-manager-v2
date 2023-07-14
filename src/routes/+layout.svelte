<script>
	// Import PicoCSS
	import '@picocss/pico/css/pico.css';

	// Fetch layout data
    /** @type {import('./$types').LayoutData} */
    export let data;

</script>

<head>
	<!--Import FontAwesome for icons-->
	<script src="https://kit.fontawesome.com/abc7f9b08f.js" crossorigin="anonymous"></script>
</head>

<div>
	<!--Navbar overlayed on every page-->
	<nav>
		<!--Web app name-->
		<ul>
			<li><strong><a href="/carnivals">Sports Carnival Manager</a></strong></li>
    	</ul>

		<!--Display navbar if logged in-->
    	{#if data.loggedIn}
    	<ul>
			<!--Links to pages-->
			<li><a href="/carnivals">Carnivals</a></li>
      		<li><a href="/students">Students</a></li>
      		<li><a href="/houses">Houses</a></li>
      		<li><a href="/records">Records</a></li>
			<li><a href="https://docs.google.com/document/d/1EDETbrxlj94bFKMae59e_JWl4_bBhmmf">User Manual</a></li>

			<!--Display logged-in user's name-->
			<li>Hello {data.staffName}</li>
			<li><form method="POST" action="/auth/?/logout"><button>Logout</button></form></li>
    	</ul>
    	{/if}
  	</nav>
  
	<!--Main body of page loaded here-->
  	<slot/>
</div>

<style>
	div {
		margin-left: 5%;
		margin-right: 5%;
	}

	button {
		background-color: rgb(158, 189, 203);
		border: none;
	}
</style>