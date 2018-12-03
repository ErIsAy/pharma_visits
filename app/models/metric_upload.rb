class MetricUpload < ActiveRecord::Base
  mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
  validates :name, presence: true # Make sure the owner's name is present.
  # attr_accessor :remote_attachment_url
  #  attr_accessor :id, :attachment, :remote_attachment_url, :created_at, :updated_at, :name
end
