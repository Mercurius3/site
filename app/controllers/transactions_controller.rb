class TransactionsController < ApplicationController
  # before_action :authenticate_user!
  def new
    @product = Product.find(params[:product_id])
    @transaction = Transaction.new
    @transaction.build_user
		@conditions = Page.find_by_permalink!('voorwaarden')
  end

  def create
    @transaction = Transaction.new(transaction_params)
		@product = Product.find(transaction_params[:product_id])
		email = transaction_params[:user_attributes][:email]
		@user = User.find_by_email(email) || @user = create_user(transaction_params[:user_attributes])
    @transaction.user = @user
    if @transaction.save
      TransactionMailer.transaction_confirmation(@transaction).deliver
      redirect_to root_path, notice: 'Wij hebben uw aanmelding ontvangen!'
    else
			@conditions = Page.find_by_permalink!('voorwaarden')
      flash[:alert] = "Er is een probleem met uw aanmelding!"
			puts "can't save"
      render :action => 'new'
    end
  end
  
  private
  
    def transaction_params
      params.require(:transaction).permit( :user_id, :message, :accept_conditions, :product_id, user_attributes: [ :email, :id, :first_name, :last_name ], product_attributes: [ :name, :id ])
    end

		def create_user(user_attributes)
			user = User.new(email: user_attributes[:email], first_name: user_attributes[:first_name], last_name: user_attributes[:last_name])
			user.skip_confirmation!
			user
		end
  
end
