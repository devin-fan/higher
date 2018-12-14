class ApplicantController < ApplicationController
  def index
    @job = Job.find(params[:job_id]) 
    @questions = Question.all.order(:id)
    @applicants = Applicants.where(
  end

  def show
  end

end
