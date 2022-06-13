class StudentsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :error_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :error_unproc_entity

  # GET /students
  def index
    render json: Student.all, status: :ok
  end

  # GET /student/:id
  def show
    render json: find_student, status: :ok
  end

  # POST /students
  def create
    student = Student.create!(student_params)
    render json: student, status: :created
  end

  # PATCH /students/:id
  def update
    student = find_student
    student.update!(student_params)
    render json: student, status: :accepted
  end

  # DELETE /students/:id
  def destroy
    find_student.destroy
    head :no_content
  end

  private

  #----------------------   ERRORS   ----------------------#
  def error_not_found
    render json: { error: 'Student not found' }, status: :not_found
  end

  def error_unproc_entity(exception)
    render json: {
             errors: exception.record.errors.full_messages,
           },
           status: :unprocessable_entity
  end

  #---------------------- CODE DRYER -----------------------#
  def find_student
    Student.find(params[:id])
  end

  #----------------------    PARAMS    ----------------------#
  def student_params
    params.permit(:name, :major, :age, :teacher_id)
  end
end
