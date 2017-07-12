// var modal = document.getElementById('myModal');

// Get the image and insert it inside the modal - use its "alt" text as a caption

// var captionText = document.getElementById("caption");
// function enlarge() {
//   var modal = document.getElementById('myModal');
//   var img = document.getElementById('myImg');
//   var modalImg = document.getElementById("img01");
//   modal.style.display = "block";
//   modalImg.src = document.getElementById('myImg').src;
//   // captionText.innerHTML = this.alt;
// }

function enlarge(id) {
  var modal = document.getElementById('myModal');
  var img = document.getElementById('myImg');
  var modalImg = document.getElementById("img01");
  modal.style.display = "block";
  var bg = document.getElementById('myImg-' + id).style['background-image'];
  bg = bg.replace('url(','').replace(')','').replace(/"/gi, "");
  modalImg.src = bg;
  // captionText.innerHTML = this.alt;
}
// Get the <span> element that closes the modal


// When the user clicks on <span> (x), close the modal
// var span = document.getElementsByClassName("close")[0];
function closeModal() { 
  console.log("close please");
  var modal = document.getElementById('myModal');
  modal.style.display = "none";
}
