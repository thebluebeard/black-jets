class Jet < ApplicationRecord
  belongs_to :user
  has_many :flights, dependent: :destroy
  has_attachments :photos, maximum: 10

end
