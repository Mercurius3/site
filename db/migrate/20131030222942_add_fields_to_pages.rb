class AddFieldsToPages < ActiveRecord::Migration
  def change
    add_column :pages, :main_navigation, :boolean
    add_column :pages, :active, :boolean
  end
end
