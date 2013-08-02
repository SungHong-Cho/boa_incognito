class Picture
  include Rails.application.routes.url_helpers
  include Mongoid::Document
  attr_accessible :image, :path
  mount_uploader :image, PictureUploader

  before_create :default_name

  def default_name
    self.name ||= File.basename(image.filename, '.*').titleize if image
  end
end
