class Book < ApplicationRecord

	belongs_to :user

	attachment :image

	default_scope -> { order(created_at: :desc) }

end
