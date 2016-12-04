class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts
  has_one :profile
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :jobs
  has_many :user_job_relations
  has_many :jobs, through: :user_job_relations

  def full_name
    profile.first_name + ' ' + profile.last_name
  end

  def can_add_friend?(friend)
    friendships.where(friend_id: friend.id).count < 1
  end

  def except_current_user(friends)
    friends.reject { |friend| friend.id==self.id }
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
