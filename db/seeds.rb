# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Job.create(title: "Rails Developer", description: "Pain in the butt")

Applicant.create(first_name: "Devin", last_name: "Fan", gpa: "-6.0", education_info: "None.", application_info: "None.")

Applicant.create(first_name: "Sean", last_name: "Park", gpa: "5.0", education_info: "Some.", application_info: "Some.")

ApplicantJob.create(applicant_id: 2, job_id: 1)

ApplicantJob.create(applicant_id: 1, job_id: 1)

Question.create(question: "Which is smarter?", description: "Choose the smarter looking one.")

Rating.create(applicant_id: 1, question_id: 1, score: 100, comparison_count: 1)

Rating.create(applicant_id: 2, question_id: 1, score: 100, comparison_count: 1)


