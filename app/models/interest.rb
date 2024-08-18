# frozen_string_literal: true
class Interest < ApplicationRecord
  has_many :interest_users, dependent: :destroy
  has_many :users, through: :interests_users

  validates :name, presence: true, uniqueness: true
end