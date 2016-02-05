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

        desc "Return a book by ID"
        params do
          requires :id, type: String, desc: "ID of the book"
        end
        get ":id", root: "book" do
          book = Book.where(id: permitted_params[:id]).first!
          present :books, book, with: API::BookEntity
        end
      end

      desc "Return all information of books in spanish language"
      get "/spanish" do
        books = Book.where(language: 'Spanish')
        present :books, books, with: API::BookEntity
      end

      desc "Return name of books in french language"
      get "/french" do
        books = Book.select(:id,:title).where(language: 'French')
        present :books, books, with: API::BookNameEntity
      end

      desc "Return name of books with price greater or equal than 100"
      get "/price" do
        books = Book.select(:id,:title).where(["price >= ?", 100])
        present :books, books, with: API::BookNameEntity
      end

      desc "Return all information of books with quantity less or equal than 100"
      get "/quantity" do
        books = Book.where(["quantity <= ?", 100])
        present :books, books, with: API::BookEntity
      end
    end
  end
end