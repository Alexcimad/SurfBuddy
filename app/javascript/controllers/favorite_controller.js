import { Controller } from "stimulus"


export default class extends Controller {
  static targets = [ "output" ]

  toggle(event) {
    console.log('toggle');
    console.log(event.currentTarget);
    event.currentTarget.classList.toggle('fav');
  }

}