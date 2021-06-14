window.addEventListener("load", () => {
  const timeElem = document.getElementById("timer");
  const timeForm = document.getElementById("submission_response_time");
  countdown(timeElem);
  submitExam(timeElem);
  setRespTime(timeForm)
})

function countdown(timeElem) {
  let duration = parseInt(timeElem.innerHTML) * 60
  let timer = duration, minutes, seconds;
  setInterval(function () {
    minutes = parseInt(timer / 60, 10)
    seconds = parseInt(timer % 60, 10);

    minutes = minutes < 10 ? "0" + minutes : minutes;
    seconds = seconds < 10 ? "0" + seconds : seconds;

    timeElem.textContent = minutes + ":" + seconds;

    --timer;

    //if (--timer < 0) {
    //  timeElem.textContent = "Timeout"
    //}
  }, 1000);
}


function setRespTime(timeForm) {
  let respTime = parseInt(timeForm.value)
  setInterval(function(){ 
    respTime ++;
    timeForm.value = respTime;
  }, 1000);
}

function submitExam(timeElem) {
  const n = parseInt(timeElem.innerHTML) * 60
  setTimeout(function() {
    document.getElementById("new_submission").submit();
  }, n * 1000)
}

$(document).ready(function(){
  $('.check').click(function(event) {
    const options = $(event.target).closest('.row').find('.check');
    options.not(this).prop('checked', false);
  });
});