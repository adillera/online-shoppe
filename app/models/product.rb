class Product < ActiveRecord::Base
  has_many :images, dependent: :destroy
  belongs_to :category
end
