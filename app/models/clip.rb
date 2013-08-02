class Clip
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia

  field :visible, type: Boolean, default: false
  field :title, type: String
  field :youtube_url, type: String
  field :priority, type: Integer
end
