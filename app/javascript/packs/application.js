// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import 'bootstrap';
import './stylesheets/application.scss'

window.show = function(event) {
  event.preventDefault();
  let p = event.target.parentElement
  const updateForm = p.querySelector(".d-none")
  const question = p.querySelector(".card")
  //console.log(question)
  updateForm.classList.remove("d-none");
  question.classList.add("d-none")

}

window.addOption = function(event) {
  event.preventDefault();   
  let p = event.target.parentElement
  const template = p.querySelector("template");
  const option = template.innerHTML.replace(/NEW_RECORD/g, new Date().getTime())  // for uniq option form, can use random() instead
  p.insertAdjacentHTML('beforebegin', option)
  console.log(template)
}

window.removeOption = function(event) {
  event.preventDefault();  
  let wrapper = event.target.closest(".nested-fields")
  console.log(wrapper)

  // New records are simply removed from the page
  if (wrapper.dataset.newRecord == "true") {
    wrapper.remove()
  
  // Existing records are hidden and flagged for deletion
  } else {
    wrapper.querySelector("input[name*='_destroy']").value = 1
    wrapper.style.display = 'none'
  }
}

Rails.start()
Turbolinks.start()
ActiveStorage.start()

