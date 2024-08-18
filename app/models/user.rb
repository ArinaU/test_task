
class User < ApplicationRecord
  has_many :interests_users, dependent: :destroy
  has_many :interests, through: :interests_users

  has_many :skills_users, dependent: :destroy
  has_many :skills, through: :skills_users

  validates :name, :patronymic, :email, :age, :nationality, :country, :gender, presence: true
  validates :age, numericality: { greater_than_or_equal_to: 0, less_than: 90 }
  validates :gender, inclusion: { in: GENDERS }

  validates :email, presence: true, length: { maximum: 255 },
            format: { with: URI::MailTo::EMAIL_REGEXP },
            uniqueness: true
end