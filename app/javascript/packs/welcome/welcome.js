var locationSelect = document.getElementById('location-select');

locationSelect.addEventListener( "invalid",
  function( event ) {
    locationSelect.classList.add('error')
    setTimeout(function(){
      document.getElementById('location-select').classList.remove('error')
    },300);
    event.preventDefault();
  }
);