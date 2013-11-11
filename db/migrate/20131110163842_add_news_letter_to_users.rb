class AddNewsLetterToUsers < ActiveRecord::Migration
  def change
    add_column :users, :news_letter, :boolean
  end
end
