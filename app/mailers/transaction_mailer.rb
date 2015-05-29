class TransactionMailer < ActionMailer::Base
  default from: "info@lassche-lassche.nl"

    def transaction_confirmation(transaction)
      @transaction = transaction
			attachments['logo.jpg'] = File.read("#{Rails.root}/app/assets/images/logo.jpg")
      mail(to: @transaction.user.email, bcc: "info@lassche-lassche.nl", subject: "Aanmelding #{@transaction.product.name}")
    end
end
