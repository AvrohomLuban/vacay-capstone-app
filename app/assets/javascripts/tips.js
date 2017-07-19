// function seeAddComment(){
//   var show = document.getElementById('tipComments');
//   show.classList.toggle('hide');
//   var top = document.getElementById('addTipComment').offsetTop;
//   window.scrollTo(0, top); 
// }

function seeTipComments(id){
  var show = document.getElementById('tipComments'+id);
  show.classList.toggle('hide')
}

// function tipReply(id, username){
//   var replybox = document.getElementById('tipComment');
//   replybox.value += "<a href = '#comment-" + id + "'>" + "@" + username + ":" + "</a>" + "<br>";
//   var top = document.getElementById('addTipComment').offsetTop;
//   window.scrollTo(0, top);                   
// }
