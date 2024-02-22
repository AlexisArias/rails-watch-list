class Comment < ApplicationRecord
  belongs_to :bookmarks

  validates :content, length: { minimum: 6 }
end
