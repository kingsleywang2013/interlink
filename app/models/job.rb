class Job < ApplicationRecord
  belongs_to :user
  has_many :user_job_relations
  has_many :users, through: :user_job_relations
  has_many :apply_jobs

  validates :job_title, presence: true
  validates :employment_type, presence: true
  validates :job_requirement, presence: true
  validates :job_location, presence: true
  validates :user_id, presence: true

  def self.type_options
    ['Full Time','Part Time', 'Casual', 'Contract']
  end

  def self.search(job_title, job_location)
    if job_title.blank? and !job_location.blank?
      job_location_matches(job_location)
    elsif job_location.blank? and !job_title.blank?
      job_title_matches(job_title)
    elsif !job_title.blank? and !job_location.blank?
      where("job_title like? AND job_location LIKE?", "%#{job_title}%", "%#{job_location}%")
    else
      return Job.none
    end

  end

  def self.job_title_matches(job_title)
    matches('job_title', job_title)
  end

  def self.job_location_matches(job_location)
    matches('job_location', job_location)
  end

  def self.matches(field_name, params)
    where("#{field_name} like ?", "%#{params}%")
  end

end
