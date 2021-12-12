class Employment < ApplicationRecord
    validates :start_date, presence: true
    has_one :job_offer, foreign_key: true
    has_one :inmate, foreign_key: true
end
