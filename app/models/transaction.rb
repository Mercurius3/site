class Transaction < ActiveRecord::Base
  rails_admin do
  end
  belongs_to :user
  belongs_to :product
  accepts_nested_attributes_for :user
  accepts_nested_attributes_for :product
	validates :accept_conditions, presence: true
end
