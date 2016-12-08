class ApplyJob < ApplicationRecord
  belongs_to :user
  belongs_to :job

  mount_uploader :resume, AttachmentUploader

  validates :cover_letter, presence: true

end
