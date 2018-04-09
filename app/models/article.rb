class Article < ApplicationRecord
  mount_uploader :pictureforarticle, PictureForArticleUploader
  validates :title, :summary, :body, presence: true
end
