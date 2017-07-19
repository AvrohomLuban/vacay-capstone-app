function goToReportNotification(id, nId) {
  window.location.href = "/reports/" + id + "?notification=" + nId;
}

function goToQuestionNotification(id, nId) {
  window.location.href = "/questions/" + id + "?notification=" + nId;
}

function goToAnswerNotification(id, nId) {
  window.location.href = "/questions/" + id + "?notification=" + nId;
}

function goToTipNotification(id, nId) {
  window.location.href = "/tips/?id="+ id + "&notification=" + nId;
}