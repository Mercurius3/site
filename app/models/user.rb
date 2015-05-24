class User < ActiveRecord::Base
  # before_create :subscription_checked?
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  rails_admin do
  end
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :registerable, :confirmable#, :validatable
  has_many :transactions
  
  # validate :email, uniqueness: true, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create }
  # validate :street_number, presence: true
  validates :first_name, presence: true
	validates :last_name, presence: true
end
