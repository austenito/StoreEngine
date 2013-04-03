class Category < ActiveRecord::Base
  attr_accessible :name
  validates :name, presence: true
  validates_uniqueness_of :name
  has_and_belongs_to_many :products
end
