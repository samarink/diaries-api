class Note < ApplicationRecord
  validates :text, presence: true

  belongs_to :diary
end
