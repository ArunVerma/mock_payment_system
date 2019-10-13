# frozen_string_literal: true
class CreateMerchants < ActiveRecord::Migration[6.0]
  def change
    create_table :merchants do |t|

      t.timestamps
    end
  end
end
