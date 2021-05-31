window.addEventListener("load", () => {
  const timeElem = document.getElementById("timer");
  countdown(timeElem);
  submitExam(timeElem);
})

function countdown(timeElem) {
  let n = parseInt(timeElem.innerHTML)
  setInterval(function(){ 
    if(n > 1) {
      n --
      timeElem.innerHTML = n; 
    }
  }, 1000);
}


function submitExam(timeElem) {
  let n = parseInt(timeElem.innerHTML)
  setTimeout(function() {
    document.getElementById("new_submission").submit();
  }, n * 1000)
}