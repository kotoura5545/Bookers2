class Book < ApplicationRecord

	belongs_to :user


	validates :opinion, length: { maximum: 200 }
	validates :opinion, :book_title, presence: true

	default_scope -> { order(created_at: :desc) }

end
