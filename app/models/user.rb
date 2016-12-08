class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts, dependent: :destroy
  has_one :profile
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  has_many :jobs, dependent: :destroy
  has_many :user_job_relations, dependent: :destroy
  has_many :jobs, through: :user_job_relations
  has_many :comments, dependent: :destroy
  has_many :apply_jobs

  def full_name
    profile.first_name + ' ' + profile.last_name
  end

  def can_add_friend?(friend)
    friendships.where(friend_id: friend.id).count < 1
  end

  def can_save_job?(job)
    user_job_relations.where(job_id: job.id).count < 1
  end

  def except_current_user(friends)
    friends.reject { |friend| friend.id==self.id }
  end

  def post_job?(job)
    job.user_id == self.id
  end

  def applied_job?(job)
    apply_jobs.where(job_id: job.id).first
  end

  def self.search(params)
    return User.none if params.blank?
    params.strip!
    params.downcase!
    (first_name_matches(params) and last_name_matches(params) and email_matches(params)).uniq
  end

  def self.first_name_matches(params)
    matches('first_name', params)
  end

  def self.last_name_matches(params)
    matches('last_name', params)
  end

  def self.email_matches(params)
    matches('email', params)
  end

  def self.matches(field_name, params)
    where("#{field_name} like ?", "%#{params}%")
  end
end
