module API
  module V1
    class Books < Grape::API
      include API::V1::Defaults

      resource :books do
        desc "Return all books"
        get "", root: :books do
          books = Book.all
          present :books, books, with: API::BookEntity
        end

        desc "Return a book"
        params do
          requires :id, type: String, desc: "ID of the book"
        end
        get ":id", root: "book" do
          book = Book.where(id: permitted_params[:id]).first!
          present :books, book, with: API::BookEntity
        end
      end
    end
  end
end