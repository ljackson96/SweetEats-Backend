class Recipe < ApplicationRecord
    has_many :ratings
    has_many :users, through: :ratings
    validates :name, presence: true, uniqueness: true 
    validates :description, presence: true
    validates :vid_url, presence: true
    validates :thumb_url, presence: true
end
