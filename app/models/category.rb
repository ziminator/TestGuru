class Category < ApplicationRecord

  has_many :tests
  default_scope { order(category: :asc) }
  validates :title, presence: true

end
