json.array! @locations.each do | location |
  json.id location.id
  json.city location.city
  json.state location.state
  json.country location.country
end