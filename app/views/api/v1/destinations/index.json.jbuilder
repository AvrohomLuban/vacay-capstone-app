json.array! @desinations.each do | destination |
  json.id destination.id
  json.report_id destination.report_id
  json.location_id destination.location_id
end