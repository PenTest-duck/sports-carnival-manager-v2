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
			<li><strong><a href="/">Sports Carnival Manager</a></strong></li>
    	</ul>

		<!--Display navbar if logged in-->
    	{#if data.loggedIn}
    	<ul>
			<!--Links to pages-->
      		<li><a href="/">Home</a></li>
      		<li><a href="/students">Students</a></li>
      		<li><a href="/houses">Houses</a></li>
      		<li><a href="/records">Records</a></li>
      		<li><a href="/carnivals">Carnivals</a></li>

			<!--Display logged-in user's name-->
			{#if data.staffName != ""}
				<li>Hello {data.staffName}</li>
				<li><form method="POST" action="/auth/?/logout"><button>Logout</button></form></li>
			{:else}
				<li><a href="/auth/signup" role="button">Sign Up</a></li>
				<li><a href="/auth/login" role="button">Login</a></li>
			{/if}
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
</style>