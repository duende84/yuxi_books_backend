require 'nokogiri'

module API
  module V1
    class Books < Grape::API
      include API::V1::Defaults

      resource :upload do
        post do
          # takes the :file value and assigns it to a variable
          file = params[:file]

          # the file parameter needs to be converted to a hash that paperclip understands as:
          attachment = {
            :filename => file[:filename],
            :type => file[:type],
            :headers => file[:head],
            :tempfile => file[:tempfile]
          }

          # creates a new Upload object
          upload = Upload.where(name: attachment[:filename]).first_or_initialize
          upload.file = ActionDispatch::Http::UploadedFile.new(attachment)
          upload.file_path = attachment[:filename]

          if upload.save
            # read xml file
            f = File.open(upload.file.path)
            doc = Nokogiri::XML(f)

            # serialize each xml object in book object
            doc.css("Book").each do |node|
              book = Book.where(title: node.xpath('Title').inner_text).first_or_initialize
              book.author = node.xpath('Author').inner_text
              book.country = node.xpath('Country').inner_text
              book.language = node.xpath('Language').inner_text
              book.price = node.xpath('Price').inner_text
              book.quantity = node.xpath('Quantity').inner_text
              book.save
            end
          end
        end
      end
    end
  end
end