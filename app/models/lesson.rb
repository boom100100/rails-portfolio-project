class Lesson < ApplicationRecord
  has_one_attached :zip_file

  has_many :lesson_tags
  has_many :tags, through: :lesson_tags

  belongs_to :course

  has_many :lesson_course_students
  has_many :course_students, through: :lesson_course_students


  scope :by_status, -> (status) { where('status = ?', status) }
  scope :published, -> { by_status("public") }
  scope :drafts, -> { by_status("draft") }

  validates :content, length: { minimum: 10 }
  validates :course, presence: true
  validates :description, length: { minimum: 10 }
  validates :name, presence: true, uniqueness: { case_sensitive: false, message: 'This lesson name is already taken.' }
  validates :status, presence: true
  validates :zip_file, content_type: :zip
  validates :tag_ids, presence: true



end
