class Board < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { maximum: 255 }
  validates :body, presence: true, length: { maximum: 65_535 }
  validate :extension_whitelist
  mount_uploader :board_image, BoardImageUploader

  def extension_whitelist
    %w(jpg jpeg gif png)
  end
end
