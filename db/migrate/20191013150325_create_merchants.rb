class CreateMerchants < ActiveRecord::Migration[6.0]
  def change
    create_table :merchants do |t|
      t.string :name
      t.string :description
      t.string :email
      t.string :status
      t.decimal :transactions_sum, default: 0
      t.timestamps
    end
  end
end
