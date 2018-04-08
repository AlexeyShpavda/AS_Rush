class Article < ApplicationRecord
  validates :title, :summary, :body, presence: true
end
