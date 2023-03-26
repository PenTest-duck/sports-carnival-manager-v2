<script>
    import '@picocss/pico/css/pico.css'
  import Nav from '../lib/components/navigation/navbar.svelte';

    /** @type {import('./$types').LayoutData} */
    //export let data;

    let navbar = {logo: 'images/favicon.ico', navItems: [{destination: '/', name: "Home"}]}
</script>
<div>
  <nav>
      <ul>
        <li><strong><a href="/">Sports Carnival Manager</a></strong></li>
      </ul>
      <ul>
        <li><a href="/">Home</a></li>
        <li><a href="/students">Students</a></li>
        <li><a href="/carnivals">Carnivals</a></li>
        <li><a href="/auth/signup" role="button">Sign Up</a></li>
        <li><a href="/auth/login" role="button">Login</a></li>
      </ul>
    </nav>
  
  <slot/>
</div>