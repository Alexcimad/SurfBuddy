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
    // console.log(document)
    // // event.getElementbyId('addTag').innerHTML
    // addOnCard.insertAdjacentHTML('beforeend', '<span class="card-tags card-tags-favorite"><%= tag.tag.name %></span>');
    // console.log(this.modalTarget)
    // $('#tagModal').on('hidden.bs.modal', function () {
    //   window.alert('hidden event fired!');
    // });
    
  }
}