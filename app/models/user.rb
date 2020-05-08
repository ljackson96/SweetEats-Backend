class User < ApplicationRecord
    has_many :ratings
    has_many :recipes, through: :ratings
end
