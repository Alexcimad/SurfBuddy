import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';

const buildMap = (mapElement) => {
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    return new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/outdoors-v11'
    });
  };

  const addMarkersToMap = (map, markers) => {
    markers.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window);
      const element = document.createElement('div');
      element.dataset.id = marker.id;
      element.className = 'marker';
      element.style.backgroundImage = `url('${marker.image_url}')`;
      element.style.backgroundSize = 'contain';
      element.style.width = '50px';
      element.style.height = '50px';

      new mapboxgl.Marker(element)
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(map);
    });
  };

  const fitMapToMarkers = (map, markers) => {
    const bounds = new mapboxgl.LngLatBounds();
    markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    map.fitBounds(bounds, { padding: 100, maxZoom: 5 });
  };

  // const scrollToDiv = () => {
  //   const markers = document.querySelectorAll('.marker');
  //   markers.forEach(marker => {
  //     marker.addEventListener(('click'), (event) => {
  //       const dataId = event.currentTarget.getAttribute('data-id');
  //       console.log(dataId)
  //       const activeTarget = document.querySelector('.center');
  //       const target = document.getElementById(dataId)
  //       console.log(target.parentElement)
  //       target.parentElement.scrollIntoView();
  //       // activeTarget.classList.remove('center');
  //       // target.parentElement.classList.add('center');
  //     });
  //   });
  // };

  const initMapbox = () => {
    const mapElement = document.getElementById('map');
    if (mapElement) {
      const map = buildMap(mapElement);
      const markers = JSON.parse(mapElement.dataset.markers);
      addMarkersToMap(map, markers);
      fitMapToMarkers(map, markers);
      // scrollToDiv(markers);
    }
  };

  export { initMapbox };
