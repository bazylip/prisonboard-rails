class Company < ApplicationRecord
    validates :full_name, presence: true
    validates :short_name, presence: true
    validates :address, presence: true
end
