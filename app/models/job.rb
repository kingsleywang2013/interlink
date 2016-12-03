class Job < ApplicationRecord
  belongs_to :user

  def self.type_options
    ['Full Time','Part Time', 'Casual', 'Contract']
  end

end
