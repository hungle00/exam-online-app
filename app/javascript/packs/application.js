// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "chartkick/chart.js"
import 'bootstrap';
import './stylesheets/application.scss'

// test jquery
/*function readyFn() {
  console.log("Hello World!")
};
$(document).on('turbolinks:load', () => {
  readyFn();
})*/

window.show = function(event) {
  event.preventDefault();
  let p = event.target.closest(".card")
  const updateForm = p.querySelector(".question-form")
  const question = p.querySelector(".options")
  if(updateForm.classList.contains("d-none")) {
    updateForm.classList.remove("d-none");
    question.classList.add("d-none");
  } else {
    updateForm.classList.add("d-none");
    question.classList.remove("d-none");
  }

}

window.addQuestion = function(event) {
  event.preventDefault();  
  const template = document.querySelector("template#question");
  //console.log(template)
  const questions = document.querySelector(".questions");
  
  const question = template.innerHTML.replace(/NEW_RECORD/g, new Date().getTime())
  //console.log(question)
  questions.insertAdjacentHTML('afterend', question)
}

window.removeQuestion = function(event) {
  event.preventDefault();
  const question = event.target.closest(".question")
  console.log(question)
  // New records are simply removed from the page
  if (question.dataset.newRecord == "true") {
    question.remove()
  // Existing records are hidden and flagged for deletion
  } else {
    console.log(question.querySelector(".remove-question"))
    question.querySelector(".remove-question").value = 1
    question.style.display = 'none'
  }
}

window.addOption = function(event) {
  event.preventDefault();   
  //let p = event.target.parentElement
  let p = event.target.closest(".options")
  const template = p.querySelector("template");
  //console.log(template)
  //debugger
  const option = template.innerHTML.replace(/NEW_OPTION/g, new Date().getTime())  // for uniq option form, can use random() instead
  //console.log(option)
  event.target.parentElement.insertAdjacentHTML('beforebegin', option)
}

window.removeOption = function(event) {
  event.preventDefault();  
  let wrapper = event.target.closest(".nested-fields")

  // New records are simply removed from the page
  if (wrapper.dataset.newRecord == "true") {
    wrapper.remove()
  
  // Existing records are hidden and flagged for deletion
  } else {
    //console.log(wrapper.querySelector("input[name*='_destroy']"))
    wrapper.querySelector("input[name*='_destroy']").value = 1
    wrapper.style.display = 'none'
  }
}

Rails.start()
Turbolinks.start()
ActiveStorage.start()

