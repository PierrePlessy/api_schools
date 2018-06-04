json.school do
  json.id @school.id
  json.created_at @school.created_at
  json.updated_at @school.updated_at
  json.name @school.name
  json.address @school.address
  json.zip_code @school.zip_code
  json.city @school.city
  json.openings @school.city
  json.phone @school.phone
  json.email @school.email
  json.nb_student @school.nb_student
  json.status @school.status
  json.latitude @school.latitude
  json.longitude @school.longitude
end
