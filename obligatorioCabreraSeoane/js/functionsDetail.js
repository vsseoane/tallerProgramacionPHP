/* Google maps variables */
var marker;
var uluru;
var zoom;
var map;


function placeMarker(vLat, vLng) {

    var position = new google.maps.LatLng(vLat, vLng);

    console.log(vLat + " " + vLng);

    marker = new google.maps.Marker({
        position: position,
        map: map
    });

    map.panTo(position);
}

function initMap() {

    if (uluru == null) {
        // Posicion central en Montevideo
        zoom = 15;
        uluru = {lat: -34.901112, lng: -56.164532};
    }

    map = new google.maps.Map(document.getElementById('map-publish'), {
        zoom: zoom,
        center: uluru
    });

    var lat = $("#inputLatitud").val();
    var lng = $("#inputLongitud").val();

    placeMarker(lat, lng);


}