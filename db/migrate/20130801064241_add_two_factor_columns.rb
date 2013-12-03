class AddTwoFactorColumns < ActiveRecord::Migration
  def change
    add_column :users, :pin, :string, default: nil
    add_column :users, :phone, :integer, default: nil
  end
end
