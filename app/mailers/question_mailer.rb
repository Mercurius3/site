class QuestionMailer < ActionMailer::Base
  default from: "axelgraff@gmail.com"
  
  def new_question(question)
    @question = question
    mail(to: @question.email, subject: "Bericht")
  end
end
