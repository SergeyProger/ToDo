class Project < ApplicationRecord
  validates :name, presence: true, length: { maximum: 100 }
  has_many :tasks, dependent: :destroy
end
