class Inmate < ApplicationRecord
    validates :name, :surname, :pesel, :average_rating, :birth_date, presence:true
    validates :pesel, uniqueness: true
    has_many :qualifications, dependent: :destroy
    belongs_to :employment, optional: true
end
