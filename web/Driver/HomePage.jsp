
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" />
        <script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"></script>
        <style>
            html, body, #map {
                height: 100%;
                margin: 0;
                padding: 0;
            }
        </style>
    </head>
    <body>
        <div id="map" ></div>
    </body>
    <script  src="../Assets/Jq/jquery.js"></script>
    <script>
        var map = L.map('map').setView([10.0286512, 76.5950595], 13);
        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors',
            maxZoom: 18,
        }).addTo(map);
        var marker = L.marker([0, 0]).addTo(map);
        var watchID = navigator.geolocation.watchPosition(function(position) {
            var latitude = position.coords.latitude;
            var longitutde = position.coords.longitude;
            updateLocation(latitude, longitutde)
            var latlng = [position.coords.latitude, position.coords.longitude];
            marker.setLatLng(latlng);
            map.setView(latlng, 13);
        }, function(error) {
            console.log(error);
        }, {enableHighAccuracy: true, maximumAge: 1000, timeout: 1000});



        function updateLocation(latitude,longitude) {
            $.ajax({
                type: "POST",
                data: {latitude: latitude,longitude:longitude},
                url: "../Assets/AjaxPages/AjaxLocationUpdate.jsp",
                success: function(result) {
                    console.log(result)
                },
            });
        }

    </script>
</html>
