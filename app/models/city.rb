class City < ApplicationRecord
	has_many :users
	has_many :gossips, through: :users
	has_many :commentaries, through: :gossips
	has_many :sub_commentaries, through: :commentaries
	has_many :likes, through: :gossips
end
