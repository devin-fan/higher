class ApplicantController < ApplicationController
  def index
    @job = Job.find(params[:job_id]) 
    @questions = Question.all.order(:id)
    @applicants = Applicant.joins(:jobs).where("jobs.id == ?", @job.id).to_a
    @ratings = @applicants.map { |a| { applicant: a, ratings: @questions.map { |q| a.ratings.where("question_id == ?", q.id).first } } }
  end

  def show
    @applicant = Applicant.find(params[:id])
  end

  def compare
    @applicants = Applicant.order("RANDOM()").limit(2).to_a
    @applicant1 = @applicants[0]
    @applicant2 = @applicants[1]
    @question = Question.find(params[:question_id])
  end

  def rate
    @applicant1 = Applicant.find(params[:id1])
    @applicant2 = Applicant.find(params[:id2])
    @questions = Question.all.order(:id)
    @questions.each do |q|
            
    end
  end
end
