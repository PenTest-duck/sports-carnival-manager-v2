<script>
    import '@picocss/pico/css/pico.css'

    /** @type {import('./$types').LayoutData} */
    export let data;

    let navbar = {logo: 'images/favicon.ico', navItems: [{destination: '/', name: "Home"}]}
</script>

<head>
  <script src="https://kit.fontawesome.com/abc7f9b08f.js" crossorigin="anonymous"></script>
</head>

<div style="margin-left: 5%; margin-right: 5%">
  <nav>
    <ul>
      <li><strong><a href="/">Sports Carnival Manager</a></strong></li>
    </ul>
    {#if data.loggedIn}
    <ul>
      <li><a href="/">Home</a></li>
      <li><a href="/students">Students</a></li>
      <li><a href="/houses">Houses</a></li>
      <li><a href="/records">Records</a></li>
      <li><a href="/carnivals">Carnivals</a></li>
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
  
  <slot/>
</div>