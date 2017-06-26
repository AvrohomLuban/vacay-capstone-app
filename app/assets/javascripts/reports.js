function reply(id, username){
  var replybox = document.getElementById('replybox');
  replybox.value += "<a href = '#comment-" + id + "'>" + "@" + username + ":" + "</a>" + "<br>";
  var top = document.getElementById('add-new-comment').offsetTop;
  window.scrollTo(0, top);                        
}

