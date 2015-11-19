class Picture < ActiveRecord::Base
  mount_uploader :file, PictureUploader

  def stripped_file_name
    file.stripped.file.filename
  end

  def stripped_file_url
    file.stripped.url
  end

end
