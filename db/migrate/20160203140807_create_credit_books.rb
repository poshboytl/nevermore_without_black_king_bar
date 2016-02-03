class CreateCreditBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :credit_books do |t|
      t.string :commit
      t.string :identity
      t.integer :category
      t.integer :state
      t.integer :fee
      t.integer :unixtime
      t.string :provider

      t.timestamps
    end
  end
end
