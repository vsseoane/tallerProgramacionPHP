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
    }else{
        //marker.setMap(null);

        marker.setPosition(position);
        marker.setMap(map);
    }
    
    map.panTo(position);
}

function getLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(onSuccess);
    } else {
        x.innerHTML = "Geolocation is not supported by this browser.";
    }
}
function onSuccess(position) {
    debugger;
    if(position != null){
        uluru = { lat: position.coords.latitude, lng: position.coords.longitude };
    }   
}

function initMap() {

    getLocation();

    if(uluru == null ){
        // Center Montevideo position if actual position can not be obtained
        zoom = 12;
        uluru = { lat: -34.901112, lng: -56.164532 };
    }

    var map = new google.maps.Map(document.getElementById('map-publish'), {
        zoom: zoom,
        center: uluru
    });
    /*var marker = new google.maps.Marker({
      position: uluru,
      map: map
    });*/

    map.addListener('click', function (e) {
        placeMarker(e.latLng, map);
        alert(e.latLng);
    });

}

