class StudentsController < ApplicationController
  def index
  end

  def new
    @dojos = Dojo.all
    @dojo = Dojo.find(params[:id])
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      redirect_to "/dojos/#{@student.dojo_id}", notice: "You have successfully created a Student!"
    else
      flash[:errors] = @student.errors.full_messages
      redirect_to :back
    end
  end

  def show
    @student = Student.with_dojo(params[:s_id])
    @cohort = Student.cohort(@student)
  end

  def edit
    @dojos = Dojo.all
    @student = Student.find(params[:s_id])
  end

  def update
    @student = Student.find(params[:s_id])

    if @student.update(student_params)
      redirect_to students_show_path(@student.dojo_id, @student), notice: "You have successfully updated a Student!"
    else
      flash[:errors] = @student.errors.full_messages
      redirect_to :back
    end
  end

  def destroy
    Student.find(params[:s_id])
    redirect_to :root
  end

  private
  def student_params
    params.require(:student).permit(:first_name, :last_name, :email, :dojo_id)
  end
end
