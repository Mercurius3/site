class QuestionMailer < ActionMailer::Base
  default from: "info@lassche-lassche.nl"
  
  def new_question(question)
    @question = question
    mail(to: @question.email, bcc: ["mercurius3@me.com","marielle@lassche-lassche.nl"], subject: "Bericht")
  end
end
