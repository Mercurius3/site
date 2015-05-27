class QuestionMailer < ActionMailer::Base
  default from: "info@lassche-lassche.nl"
  
  def new_question(question)
    @question = question
		attachments['logo.jpg'] = File.read("#{Rails.root}/app/assets/images/logo.jpg")
    mail(to: @question.email, bcc: "info@lassche-lassche.nl", subject: "Bericht")
  end
end
