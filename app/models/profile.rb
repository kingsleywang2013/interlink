class Profile < ApplicationRecord
  belongs_to :user
  mount_uploader :picture, AvatarUploader
  validate :picture_size

  private
    def picture_size
      if picture.size > 5.megabytes
        error.add(:picture, "should be less than 5MB")
      end
    end
end
