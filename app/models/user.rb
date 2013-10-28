class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  rails_admin do
  end
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :registerable, :confirmable
  has_many :transactions
end