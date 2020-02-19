class TidLog < ApplicationRecord
  include PgSearch
  acts_as_taggable
  pg_search_scope :search_for,
                   against: %i(title body),
                    using: {
                     tsearch: { prefix: true }
                    }

  belongs_to :user

  scope :ordered, -> { order(created_at: :desc) }
end
