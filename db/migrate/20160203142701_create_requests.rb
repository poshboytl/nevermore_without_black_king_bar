class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.integer :credit_book_id
      t.integer :state
      t.string :sender

      t.timestamps
    end
  end
end
