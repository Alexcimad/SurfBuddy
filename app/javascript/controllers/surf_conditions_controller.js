import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "meteo" ]

  connect() {
    console.log(this.meteoTargets)
  }

  meteoTargetConnected(meteo){
    console.log("Target connected")
    console.log(meteo.dataset)
    fetch('https://api.windy.com/api/point-forecast/v2', {
    method: 'POST',
    headers: {
      'Accept': 'application/json, text/plain, */*',
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({"lat": 43.484750,
    "lon": -1.558943,
    "model": "gfsWave",
    "parameters": ["waves", "windWaves", "swell1", "swell2"],
    "key": "ush812LCNxuBzbqH9d7yuakyPxMaoN36"
  })
    }).then(res => res.json())
    .then(res => console.log(res));
    }
}