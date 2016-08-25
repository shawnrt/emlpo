class CreateCharges < ActiveRecord::Migration[5.0]
  def change
    create_table :charges do |t|
      t.belongs_to :membership, foreign_key: true
      t.string :stripe_token
      t.string :customer_id
      t.string :charge_id
      t.belongs_to :membership_type, foreign_key: true

      t.timestamps
    end
  end
end
