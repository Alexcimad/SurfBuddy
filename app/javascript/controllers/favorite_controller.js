import { Controller } from "stimulus"


export default class extends Controller {
  static targets = [ "output", "modal" ]

  toggle(event) {
    // console.log('toggle');
    // console.log(event.currentTarget);
    event.currentTarget.classList.toggle('fav');
  }

  toggleTag(event) {
    event.currentTarget.classList.toggle('tag-no-favorite');
    console.log(this.modalTarget)
    $('#tagModal').on('hidden.bs.modal', function () {
      window.alert('hidden event fired!');
    });
  }
}