import { Controller } from "stimulus"


export default class extends Controller {
  static targets = [ "output", "modal" ]

  toggle(event) {
    // console.log('toggle');
    // console.log(event.currentTarget);
    event.currentTarget.classList.toggle('fav');
  }

  toggleProfile(event) {
    // console.log('toggle');
    // console.log(event.currentTarget);
    event.currentTarget.classList.toggle('fav-p');
  }

  toggleTag(event) {
    event.currentTarget.classList.toggle('card-tags-favorite');
    // // event.getElementbyId('addTag').innerHTML
    // console.log(event.currentTarget);
    document.getElementById(`addTag${event.currentTarget.dataset.spotid}`).insertAdjacentHTML('beforeend', `<span class="card-tags card-tags-favorite">${event.currentTarget.innerHTML}</span>`);
    // console.log(this.modalTarget)
    // $('#tagModal').on('hidden.bs.modal', function () {
    //   window.alert('hidden event fired!');
    // });
    
  }
}