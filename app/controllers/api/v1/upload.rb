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
          upload = Upload.new

          # This is the kind of File object Grape understands so let's pass the hash to it
          upload.file = ActionDispatch::Http::UploadedFile.new(attachment)
          upload.file_path = attachment[:filename]
          upload.name = file[:filename]
          upload.save
        end
      end
    end
  end
end