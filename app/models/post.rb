class Post < ApplicationRecord
	belongs_to :user
	has_one_attached :image
	has_many :comments, dependent: :destroy

	acts_as_votable

	validates :title, presence: true
	validates :description, presence: true
	validate :correct_image_type

	private
	# mathod that defines all the allowed formats of images
	def correct_image_type
		if image.attached? && !image.content_type.in?(%w(image/jpeg image/png))
			errors.add(:image, 'must be a .jpeg or .png')
		end
	end
end