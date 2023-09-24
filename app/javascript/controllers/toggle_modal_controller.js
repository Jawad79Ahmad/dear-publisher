import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle_modal"
export default class extends Controller {
  connect() {
    // console.log('hi toggle modal controller');
  }

  showModal(event) {
    var modalID = event.target.getAttribute("data-toggle-modal-argument");
    document.getElementById(modalID).classList.remove('hidden');
    document.getElementById(modalID + '-backdrop').classList.remove('hidden');
  }

  hideModal(event) {
    var modalID = event.target.getAttribute("data-toggle-modal-argument");
    document.getElementById(modalID).classList.add('hidden');
    document.getElementById(modalID + '-backdrop').classList.add('hidden');
  }

  toggleModal(event) {
    var modalID = event.target.getAttribute("data-toggle-modal-argument");
    var modal = document.getElementById(modalID);
    if(modal.classList.contains('hidden')) {
      modal.classList.remove('hidden');
    } else {
      modal.classList.add('hidden');
    }
    var modalBackdrop = document.getElementById(modalID + '-backdrop');
    if(modalBackdrop.classList.contains('hidden')) {
      modalBackdrop.classList.remove('hidden');
    } else {
      modalBackdrop.classList.add('hidden');
    }
  }
}
