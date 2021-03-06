class CourseStudent < ApplicationRecord
  belongs_to :course
  belongs_to :student

  has_many :lesson_course_students
  has_many :lessons, through: :lesson_course_students

  scope :by_progress, -> (progress) { where('completed = ?', progress) }
  scope :complete_lessons, -> { by_progress(true) }
  scope :incomplete_lessons, -> { by_progress(false) }

end
