function gmap_show(center) {
  if ((center.lat == null) || (center.lng == null) ) {    // validation check if coordinates are there
    return 0;
  }

  handler = Gmaps.build('Google');    // map init
  handler.buildMap({provider: {}, internal: {id: 'map'}}, function(){
    markers = handler.addMarkers([    // put marker method
      {

        "lat": center.lat,    // coordinates from parameter center
        "lng": center.lng,
        "picture": {    // setup marker icon
        //  "url": 'http://bounceworld.co.za/bounceworld/wp-content/uploads/2015/10/map_marker.png',
          "width":  32,
          "height": 32
        },
        "infowindow": "<b>" + center.name + "</b> " + center.address + ", " + center.postal_code + " " + center.city
      }
    ]);
    handler.bounds.extendWith(markers);
    handler.fitMapToBounds();
    handler.getMap().setZoom(12);    // set the default zoom of the map
  });
}

function gmap_form(center) {
  handler = Gmaps.build('Google');    // map init
  handler.buildMap({provider: {}, internal: {id: 'map'}}, function(){
    if (center && center.lat && center.lng) {    // statement check - new or edit view
      markers = handler.addMarkers([    // print existent marker
        {
          "lat": center.lat,
          "lng": center.lng,
          "picture": {
        //    "url": 'http://bounceworld.co.za/bounceworld/wp-content/uploads/2015/10/map_marker.png',
            "width":  32,
            "height": 32
          },
          "infowindow": "<b>" + center.name + "</b> " + center.address + ", " + center.postal_code + " " + center.city
        }
      ]);
      handler.bounds.extendWith(markers);
      handler.fitMapToBounds();
      handler.getMap().setZoom(12);
    }
    else {    // show the empty map
      handler.fitMapToBounds();
      handler.map.centerOn([19.142249, -70.713501]);
      handler.getMap().setZoom(7);
    }
  });

  var markerOnMap;

  function placeMarker(location) {    // simply method for put new marker on map
    if (markerOnMap) {
      markerOnMap.setPosition(location);
    }
    else {
      markerOnMap = new google.maps.Marker({
        position: location,
        map: handler.getMap()
      });
    }
  }

  google.maps.event.addListener(handler.getMap(), 'click', function(event) {    // event for click-put marker on map and pass coordinates to hidden fields in form
    placeMarker(event.latLng);
    document.getElementById("map_lat").value = event.latLng.lat();
    document.getElementById("map_lng").value = event.latLng.lng();
  });
}
