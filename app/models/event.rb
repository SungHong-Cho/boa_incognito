class Event
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia

  field :visible, type: Boolean, default: true
  field :title, type: String
  field :content, type: String
  field :priority, type: Integer
  mount_uploader :thumb_image, ImageUploader
end
