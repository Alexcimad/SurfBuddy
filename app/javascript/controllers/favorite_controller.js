import { Controller } from "stimulus"


export default class extends Controller {
  static targets = [ "output", "modal" ]

  toggle(event) {
    // console.log('toggle');
    // console.log(event.currentTarget);
    event.currentTarget.classList.toggle('fav');
    // var d1 = document.getElementById('one');
    // d1.insertAdjacentHTML('afterend', '<div id="two">two</div>');
  }

  toggleProfile(event) {
    // console.log('toggle');
    // console.log(event.currentTarget);
    event.currentTarget.classList.toggle('fav-p');
  }

  toggleTag(event) {
    event.currentTarget.classList.toggle('card-tags-favorite');
    // console.log(this.modalTarget)
    // $('#tagModal').on('hidden.bs.modal', function () {
    //   window.alert('hidden event fired!');
    // });
  }
}