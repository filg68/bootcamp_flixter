class User < ApplicationRecord

  has_many :courses
  has_many :enrollments
  # method 4 for extracting  the enrollments associated with this account
  has_many :enrolled_courses, through: :enrollments, source: :course
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable


  def enrolled_in?(course)
    
    # method 1 - the full code way

    # enrolled_courses = []
    # enrollments.each do |enrollment|
    #  enrolled_courses << enrollment.course
    # end

    #method 2 - the short form way
    # enrolled_courses = enrollments.collect do |enrollment|
    #  enrollment.course
    # end

    # method 3 - the completely illegible secret code way
    # enrolled_courses = enrollments.collect(&:course)

    # method 4 - through a database rule - see above

    return enrolled_courses.include?(course)
  end

end
