class Product < ActiveRecord::Base
  #belongs_to :kit

  has_many :kit_products
  has_many :kits, :through => :kit_products
end
