class TransactionsController < ApplicationController
#  before_action :authenticate_user!
  def new
    @product = Product.find(params[:product_id])
    @transaction = Transaction.new
    @user = @transaction.build_user
  end

  def create
    @transaction = Transaction.new(transaction_params)
		@email = transaction_params[:user_attributes][:email]
		@user = User.find_by_email(@email) || @user = create_user(@email)
		puts @user.id
		puts @user.email
		@transaction.user = @user
    if @transaction.save
      TransactionMailer.transaction_confirmation(@transaction).deliver_now
      redirect_to root_path, notice: 'Wij hebben uw aanmelding ontvangen, u ontvangt per mail een bevestiging!'
    else
      flash[:alert] = "Er is een probleem met uw aanmelding!"
      render :action => 'new'
    end
  end
  
  private
  
    def transaction_params
      params.require(:transaction).permit(:email, :product_id, user_attributes: [:email], product_attributes: [ :name, :id ]) 
    end
 
		def create_user(email)
			user = User.new(email: email)
			user.skip_confirmation!
			user
		end
		 
end
