class AddLoginTokenToMembership < ActiveRecord::Migration[5.0]
  def change
    add_column :memberships, :token, :text
  end
end
