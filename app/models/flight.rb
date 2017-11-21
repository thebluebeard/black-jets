class Flight < ApplicationRecord
  belongs_to :user
  belongs_to :jet
  has_many :reviews, dependent: :destroy
end
