class Project < ApplicationRecord
  validates :name, presence: true, length: { maximum: 100 }
  validates_presence_of :colorpro
  has_many :tasks, dependent: :destroy
  COLORPROJECT= [['red', 1],
                 ['orange', 2],
                 ['yellow', 3],
                 ['green', 4],
                 ['blue', 5],
                 ['purple', 6],
                 ['pink', 7]]
end
