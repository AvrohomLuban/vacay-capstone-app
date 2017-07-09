json.array! @bookmarks.each do | bookmark |
  json.id bookmark.id
  json.user_id bookmark.user_id
  json.report_id bookmark.report_id
  json.tip_id bookmark.tip_id
  json.question_id bookmark.question_id
end