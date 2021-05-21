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

// test update option by js
document.addEventListener("DOMContentLoaded", (event) => {
  const template = document.getElementsByTagName("template")[0]
  const addBtn = document.querySelector(".add-option")
  //console.log(template.innerHTML)
  addBtn.addEventListener("click", event => {
    event.preventDefault()
    const option = template.innerHTML.replace(/NEW_RECORD/g, new Date().getTime())  // for uniq option form, can use random() instead
    addBtn.insertAdjacentHTML('beforebegin', option)
  })
})

Rails.start()
Turbolinks.start()
ActiveStorage.start()

