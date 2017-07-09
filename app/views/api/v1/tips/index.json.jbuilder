json.array! @tips.each do | tip |
  json.id tip.id
  json.text tip.text
  json.user_id tip.user_id
  json.venue tip.venue
  json.location_id tip.location_id
  json.created_at tip.created_at
end
