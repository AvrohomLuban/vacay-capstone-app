// var length = '';
// var currentReportId = '';
// window.onload = function(e) { 
//   length = window.location.pathname.split("/").length;
//   currentReportId = window.location.pathname.split("/")[length - 1];
//   console.log("window on load");
//   console.log(length);
//   console.log(currentReportId);
// };
document.addEventListener("DOMContentLoaded", function(event) {
  var app1 = new Vue({
    el: '#app1',
    data: {
      report: [],
      currentReportId:  window.location.pathname.match(/\d+/)[0]
      
    },
      mounted: function() {
        $.get('/api/v1/reports/' + this.currentReportId, function(result) {
          console.log(result);
         this.report = result;
        }.bind(this));
     },
     methods: {
     },
  });
});
