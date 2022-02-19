import { Controller } from "stimulus"

toggle(event) {
    console.log('toggle');
    console.log(event.currentTarget);
    event.currentTarget.classList.toggle('fav');
  }