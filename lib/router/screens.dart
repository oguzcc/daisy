enum Screens {
  /* 
╔═══════════════════════╗
║     INITIAL ROUTES    ║
╚═══════════════════════╝
  */
  splash('/splash', 'Splash'),
  onboard('/onboard', 'Onboard'),

  /*
╔═════════════════╗
║   AUTH ROUTES   ║
╚═════════════════╝
 */

  signIn('/signIn', 'Sign In'),
  signUp('/signUp', 'Sign Up'),

  /* 
╔═══════════════════════╗
║      HOME ROUTES      ║
╚═══════════════════════╝
  */

  home('/home', 'Home'),

  /* 
╔═══════════════════════╗
║    PROFILE ROUTES     ║
╚═══════════════════════╝
  */

  profile('/profile', 'Profile'),

  /* 
╔═══════════════════════════╗
║        OTHER ROUTES       ║
╚═══════════════════════════╝
  */

  story('/story', 'Story');

  const Screens(this.path, this.name);
  final String path;
  final String name;
}
