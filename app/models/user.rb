class User < ApplicationRecord
	devise :database_authenticatable, :registerable,
	:recoverable, :rememberable, :validatable

	has_many :posts, dependent: :destroy
	has_many :comments, dependent: :destroy
end
