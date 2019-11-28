class User < ApplicationRecord
  authenticates_with_sorcery!

  mount_uploader :image, ImageUploader
end
