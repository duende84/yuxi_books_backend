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
    expose :created_at
    expose :updated_at
  end

  class BookNameEntity < Grape::Entity
    expose :id
    expose :title
  end
end