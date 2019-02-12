class Subscriber < ApplicationRecord
  validates :f_name, :l_name, :country,
            presence: true
end
