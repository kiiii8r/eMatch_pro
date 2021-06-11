function scroll_rock() {
  const navLower = document.getElementById('nav-lower')
    window.addEventListener('scroll', function(){
    
      if( 45 < window.scrollY ) {
        navLower.classList.add('fixed');
      } else {
        navLower.classList.remove('fixed');
      };
    });
  };

window.addEventListener('load', scroll_rock);