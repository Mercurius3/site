class TransactionMailer < ActionMailer::Base
  default from: "axelgraff@gmail.com"

    def transaction_confirmation(transaction, user)
      @transaction = transaction
      @user = user
      mail(to: user.email, subject: "Aanmelding")
    end
end
