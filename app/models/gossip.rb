# frozen_string_literal: true

class Gossip < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :commentaries, dependent: :destroy
  has_many :sub_commentaries, through: :commentaries, dependent: :destroy
  validates :author, presence: true
  validates :title, presence: true
<<<<<<< HEAD
	def self.include_id?(integer)
		Gossip.ids.include?(integer)
	end
=======

  def self.include_id?(integer)
    Gossip.ids.include?(integer)
   end
>>>>>>> 510d0ba761c930da3c4c651128718697155a5860
end

