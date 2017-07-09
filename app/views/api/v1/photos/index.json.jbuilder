json.array! @photos.each do | photo |
  json.id photo.id
  json.title photo.title
  json.image photo.image
end