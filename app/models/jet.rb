class Jet < ApplicationRecord
  belongs_to :user
  has_many :flights, dependent: :destroy
end
