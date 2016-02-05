json.books @books do |b|
  json.id    b.id
  json.title b.title
  json.author b.author
  json.country b.country
  json.language b.language
  json.price b.price
  json.quantity b.quantity
end