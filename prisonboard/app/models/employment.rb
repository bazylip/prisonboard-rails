class Employment < ApplicationRecord
    validates :start_date, presence: true
    has_one :job_offer
    has_one :inmate
end
