class TransactionsController < ApplicationController
  before_action :authenticate_user!
  def new
    @product = Product.find(params[:product_id])
    @transaction = Transaction.new
    @user = @transaction.build_user
  end

  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.user = current_user
    if @transaction.save
      TransactionMailer.transaction_confirmation(@transaction).deliver
      redirect_to root_path, notice: 'Wij hebben uw aanmelding ontvangen!'
    else
      flash[:alert] = "Er is een probleem met uw aanmelding!"
      render :action => 'new'
    end
  end
  
  private
  
    def transaction_params
      params.require(:transaction).permit( :user_id, :product_id, user_attributes: [ :email, :id ], product_attributes: [ :name, :id ])
    end
  
end
