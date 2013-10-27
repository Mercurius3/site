class TransactionMailer < ActionMailer::Base
  default from: "axelgraff@gmail.com"

    def transaction_confirmation(transaction)
      @transaction = transaction
      mail(to: @transaction.user.email, subject: "Aanmelding")
    end
end
