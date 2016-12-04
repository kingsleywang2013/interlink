class Job < ApplicationRecord
  belongs_to :user
  has_many :user_job_relations
  has_many :users, through: :user_job_relations

  def self.type_options
    ['Full Time','Part Time', 'Casual', 'Contract']
  end

end
