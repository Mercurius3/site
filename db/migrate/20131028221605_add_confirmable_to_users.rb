class AddConfirmableToUsers < ActiveRecord::Migration
  # Note: You can't use change, as User.update_all with fail in the down migration
  def self.up
    add_column :users, :confirmation_token, :string
    add_column :users, :confirmed_at, :datetime
    add_column :users, :confirmation_sent_at, :datetime
    # add_column :users, :unconfirmed_email, :string # Only if using reconfirmable
    add_index :users, :confirmation_token, :unique => true
    # User.reset_column_information # Need for some types of updates, but not for update_all.
    # To avoid a short time window between running the migration and updating all existing
    # users as confirmed, do the following
    User.update_all(:confirmed_at => Time.now)
    # All existing user accounts should be able to log in after this.
    add_column :users, :middle_name, :string
    add_column :users, :birth_date, :date
    add_column :users, :street, :string
    add_column :users, :street_number, :string
    add_column :users, :post_code, :string
    add_column :users, :city, :string
  end

  def self.down
    remove_columns :users, :confirmation_token, :confirmed_at, :confirmation_sent_at, :middle_name, :birth_date, :street, :street_number, :post_code, :city
    # remove_columns :users, :unconfirmed_email # Only if using reconfirmable
  end
end