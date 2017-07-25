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

function replyAnswer(id, username) {
  var button = document.getElementById('answerComments');
  button.classList.toggle('answercomments')
  var replybox = document.getElementById('answerMessage');
  replybox.value += "<a href = '#comment-" + id + "'>" + "@" + username + ":" + "</a>" + "<br>";                       
}

function replyAnswerComment(id, username) {
  var button = document.getElementById('answerComments');
  button.classList.toggle('answercomments')
  var replybox = document.getElementById('answerMessage');
  replybox.value += "<a href = '#comment-" + id + "'>" + "@" + username + ":" + "</a>" + "<br>";                       
}