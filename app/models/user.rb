class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy

  attachment :image

  validates :name,  length: { in: 2..20 }
  validates :name, presence: true
  validates :introduction,  length: { maximum: 50 }

  default_scope -> { order(created_at: :desc) }
end

