require 'grape-entity'

module API
  class BookEntity < Grape::Entity
    expose :id
    expose :title
    expose :author
    expose :country
    expose :language
    expose :price
    expose :quantity
  end
end