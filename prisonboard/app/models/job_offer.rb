class JobOffer < ApplicationRecord
  belongs_to :company
  belongs_to :employment, optional: true
end
