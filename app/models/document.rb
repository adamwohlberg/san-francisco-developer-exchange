class Document < ActiveRecord::Base
  # attr_accessible :attachment, :remove_attachment
  has_attached_file :attachment
  validates_attachment_content_type :attachment, content_type: /\Aimage\/.*\Z/

  attr_accessor :remove_attachment
end
