class Tag < ApplicationRecord
  has_many :gossips, through: :tag_gossips 
end
