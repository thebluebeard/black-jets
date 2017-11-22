class Flight < ApplicationRecord
  belongs_to :user
  belongs_to :jet
  has_many :reviews, dependent: :destroy
  has_many :bookings
  has_many :airports
  geocoded_by :origin
  after_validation :geocode, if: :origin_changed?

  # def self.search(search)
  #   if search
  #     find(:all, :conditions => ['destination LIKE ?', "%#{search}%"])
  #   else
  #     find(:all)
  #   end
  # end

end

