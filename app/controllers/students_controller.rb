class StudentsController < ApplicationController

  def index
    if params[:name]
      # students = Student.find_by(first_name: params[:name]) || Student.find_by(last_name: params[:name])
      students = Student.where("first_name LIKE ? OR last_name LIKE ?", "%#{params[:name]}%", "%#{params[:name]}%")
      # byebug
                else
                  students = Student.all
                end
    render json: students
  end

  
  def show
    student = Student.find(params[:id])
    render json: student
  end

end
