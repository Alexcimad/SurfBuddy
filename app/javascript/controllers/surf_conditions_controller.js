import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "meteo" ]

  connect() {
    //console.log(this.meteoTargets[0].lastElementChild.innerText)
  }

  meteoTargetConnected(meteo){
    const apiResponse = {}
    console.log("Target connected")
    console.log(meteo.dataset)
    fetch('https://api.windy.com/api/point-forecast/v2', {
    method: 'POST',
    headers: {
      'Accept': 'application/json, text/plain, */*',
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({"lat": meteo.dataset.latitude,
    "lon": meteo.dataset.longitude,
    "model": "gfsWave",
    "parameters": ["waves", "windWaves", "swell1", "swell2"],
    "key": "ush812LCNxuBzbqH9d7yuakyPxMaoN36"})
    }).then(res => res.json())
    .then((data) => data['waves_height-surface'])
    .then((waveHeight) => {meteo.lastElementChild.innerText = waveHeight[0]})

  }
}