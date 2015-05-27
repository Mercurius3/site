class TransactionsController < ApplicationController
  # before_action :authenticate_user!
  def new
    @transaction = Transaction.new
    @product = Product.find(params[:product_id])
    @transaction.build_user
		@conditions = Page.find_by_permalink!('voorwaarden')
  end

  def create
    @transaction = Transaction.new(transaction_params)
		@product = Product.find(transaction_params[:product_id])
		email = transaction_params[:user_attributes][:email]
		@user = User.find_by_email(email) || @user = create_user(transaction_params[:user_attributes])
		@user.first_name = transaction_params[:user_attributes][:first_name]
		@user.last_name = transaction_params[:user_attributes][:last_name]
		@user.phone_number = transaction_params[:user_attributes][:phone_number]
    @transaction.user = @user
    if @transaction.save
      TransactionMailer.transaction_confirmation(@transaction).deliver
      redirect_to root_path, notice: 'Hartelijk dank voor uw aanmelding. U ontvangt, als het goed is, binnen enkele ogenblikken een mailbericht van ons. Zo niet, controleer dan s.v.p. uw spambox.'
		else
			if @user.save
				@conditions = Page.find_by_permalink!('voorwaarden')
				flash[:error] = "Er is een probleem met uw aanmelding!"
				puts "user is saved, but there is another problem"
				puts transaction_params.inspect
				transaction_params[:user_attributes][:id]=nil
				render action: 'new', transaction_params: transaction_params
			else
				@conditions = Page.find_by_permalink!('voorwaarden')
				flash[:error] = "Er is een probleem met uw aanmelding!"
				puts "can't save"
				render action: 'new', transaction_params: transaction_params
			end
		end
  end
  
  private
  
    def transaction_params
      params.require(:transaction).permit( :message, :accept_conditions, :product_id, user_attributes: [ :email, :first_name, :last_name, :phone_number ], product_attributes: [ :name, :id ])
    end

		def create_user(user_attributes)
			user = User.new(email: user_attributes[:email], first_name: user_attributes[:first_name], last_name: user_attributes[:last_name], phone_number: user_attributes[:phone_number])
			user.skip_confirmation!
			user
		end
end
