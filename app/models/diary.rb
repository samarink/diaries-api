class Diary < ApplicationRecord
  DIARY_KINDS = %w[public private]

  validates :title, :kind, presence: true
  validates :kind, inclusion: { in: DIARY_KINDS }
  validates :expiration, absence: true, unless: -> { kind == 'private' }
end
