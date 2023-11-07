class Diary < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :user
  belongs_to :work
  has_one_attached :image
  belongs_to :start_time
  belongs_to :ending_time
  has_one :comment

  validates :user_id, presence: true
  validates :place, presence: true
  validates :category_id, presence: true, numericality:{ other_than: 1 }
  validates :work, presence: true
  validates :start_time, presence: true
  validates :ending_time, presence: true
  validates :image, presence: true

end
