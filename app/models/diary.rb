class Diary < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :user
  has_one_attached :image
  has_many :comments

  validates :place, presence: true
  validates :category_id, presence: true, numericality:{ other_than: 1 }
  validates :work, presence: true
  validates :start_time, presence: true
  validates :ending_time, presence: true
  validates :image, presence: true
end