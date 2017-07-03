json.array! @reports.each do | report |
  json.id report.id
  json.title report.title
  json.duration report.duration
  json.season report.season
  json.text report.text
end