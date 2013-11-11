class User < ActiveRecord::Base
  before_create :subscription_checked?
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  rails_admin do
  end
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :registerable, :confirmable
  has_many :transactions
  
  validate :email, uniqueness: true, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create }
  
  private
  def subscription_checked?
    if self.news_letter
      @gb = Gibbon::API.new(ENV['MAILCHIMP_API_TOKEN'])
      @gb.lists.subscribe({
        :id => ENV['MAILCHIMP_LIST_ID'], 
        :email => {:email => self.email},
        :merge_vars => {
          :FNAME => self.first_name,
          :LNAME => self.last_name},
        :double_optin => false
      })
    end
  end
end