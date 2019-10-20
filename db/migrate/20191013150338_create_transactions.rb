class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.references :merchant
      t.string :uuid
      t.decimal :amount, dafult: 0
      t.string :status
      t.timestamps
    end
  end
end
