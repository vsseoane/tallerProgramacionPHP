/* Google maps variables */
var marker;
var uluru;
var zoom = 6;


function placeMarker(position, map) {

    if (marker == null) {
        marker = new google.maps.Marker({
            position: position,
            map: map
        });
    } else {
        //marker.setMap(null);

        marker.setPosition(position);
        marker.setMap(map);
    }

    map.panTo(position);
}

function initMap() {

    if (uluru == null) {
        // Centro en Montevideo
        zoom = 12;
        uluru = {lat: -34.901112, lng: -56.164532};
    }

    var map = new google.maps.Map(document.getElementById('map-publish'), {
        zoom: zoom,
        center: uluru
    });

    map.addListener('click', function (e) {
        placeMarker(e.latLng, map);
        $("#latitud").val(e.latLng.lat);
        $("#longitud").val(e.latLng.lng);
    });

}

