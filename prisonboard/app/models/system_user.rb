class SystemUser < Person
    validates :username, :password, presence: true
    validates :username, uniqueness: true
end
