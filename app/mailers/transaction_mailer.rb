class TransactionMailer < ActionMailer::Base
	default from: "info@lassche-lassche.nl"

	def transaction_confirmation(transaction)
		@transaction = transaction
		mail(to: @transaction.user.email, subject: "Aanmelding #{transaction.product.name}")
	end
end
