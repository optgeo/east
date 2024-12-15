import maplibregl from 'maplibre-gl';
import { Protocol } from 'pmtiles';
import 'maplibre-gl/dist/maplibre-gl.css';

let protocol = new Protocol();
maplibregl.addProtocol("pmtiles", protocol.tile);

const map = new maplibregl.Map({
  container: 'map',
  style: 'style.json',
  center: [140, -6], 
  zoom: 5
});

map.on('load', () => {
  console.log('Map loaded with style.json');
});

