function clicked_like_answer() {
  var button = document.getElementById('like_answer');
  button.classList.toggle('btn-contrast')
}

function clicked_dislike_answer() {
  var button = document.getElementById('dislike_answer');
  button.classList.toggle('btn-contrast')
}

function seeAnswerComments() {
  var button = document.getElementById('answerComments');
  button.classList.toggle('answercomments')
}