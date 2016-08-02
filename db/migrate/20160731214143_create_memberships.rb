class CreateMemberships < ActiveRecord::Migration[5.0]
  def change
    create_table :memberships do |t|
      t.string :first_name
      t.string :last_name
      t.string :company_name
      t.string :email
      t.string :address
      t.string :city
      t.string :province
      t.string :postal
      t.string :phone
      t.string :payment_type
      t.string :payment_type_id
      t.datetime :last_paid
      t.datetime :next_payment
      t.text :notes
      t.belongs_to :membership_type, index: true
      t.boolean :email_communications

      t.timestamps
    end
    create_table :membership_types do |t|
      t.string :name
      t.string :duration
      t.text :descprition
      t.integer :price

      t.timestamps
    end
  end
end
