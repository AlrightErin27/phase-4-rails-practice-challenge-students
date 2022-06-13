class TeachersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :error_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :error_unproc_entity

  # GET /teachers
  def index
    render json: Teacher.all, status: :ok
  end

  # GET /teachers/:id
  def show
    render json: find_teacher, status: :ok
  end

  # POST /teachers
  def create
    teacher = Teacher.create!(teacher_params)
    render json: teacher, status: :created
  end

  # PATCH /teaches/:id
  def update
    teacher = find_teacher
    teacher.update!(teacher_params)
    render json: teacher, status: :accepted
  end

  # DELETE /teaches/:id
  def destroy
    find_teacher.destroy
    head :no_content
  end

  private

  #----------------------   ERRORS   ----------------------#
  def error_not_found
    render json: { error: 'Teacher not found' }, status: :not_found
  end

  def error_unproc_entity(exception)
    render json: {
             errors: exception.record.errors.full_messages,
           },
           status: :unprocessable_entity
  end

  #---------------------- CODE DRYER -----------------------#
  def find_teacher
    Teacher.find(params[:id])
  end

  #----------------------    PARAMS    ----------------------#
  def teacher_params
    params.permit(:name)
  end
end
