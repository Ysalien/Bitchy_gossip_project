class Gossip < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  has_many :comments
  has_many :likes, as: :likeable, dependent: :destroy
  has_many :tags, through: :tag_gossips
end
