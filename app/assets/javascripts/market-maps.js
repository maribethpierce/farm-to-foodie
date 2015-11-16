if ($("#market-map").length > 0) {
  var showdata = $("#market-map")[0].dataset;
  var latitude = showdata.lat;
  var longitude = showdata.lng;
  var name = showdata.farm
  var marketLocation = new google.maps.LatLng(latitude, longitude);

  $(document).ready(initializeMarketMap(marketLocation));
}

function initializeMarketMap(location) {
  var mapProp = {
    center: location,
    zoom: 11,
    // mapTypeId:google.maps.MapTypeId.HYBRID,
    // mapTypeControl: false,
    streetViewControl: true
  };

  var map = new google.maps.Map(document.getElementById('market-map'), mapProp);

  var marker = new google.maps.Marker({
    map: map,
    position: location,
    title: name
  });

  var geocoding  = new google.maps.Geocoder();
    $("#submit_button_geocoding").click(function(){
      codeAddress(geocoding);
      marker.setMap(map);
    });

  $(window).resize(function() {
    google.maps.event.trigger(map, "resize");
    map.setCenter(location);
  });
}
