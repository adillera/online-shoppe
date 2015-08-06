class Image < ActiveRecord::Base
  belongs_to :product

  has_attached_file :photo, styles: { medium: '300x', thumb: '150x' }
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end
