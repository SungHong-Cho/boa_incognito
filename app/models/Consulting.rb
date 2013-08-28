class Consulting
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia
  
  field :name, type: String
  field :number, type: String
  field :email, type: String
  field :datetime, type: DateTime
  field :file_name, type: String, default: ""
  field :comment, type: String
  field :med_ccl, type: Boolean, default: true
  field :med_lp, type: Boolean, default: true

end
