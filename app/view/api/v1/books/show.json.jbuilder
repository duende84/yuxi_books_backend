json.book do
  json.id    @book.id
  json.title @booktitle
  json.author @book.author
  json.country @book.country
  json.language @book.language
  json.price @book.price
  json.quantity @book.quantity
end