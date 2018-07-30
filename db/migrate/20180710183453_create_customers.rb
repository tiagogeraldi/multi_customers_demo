class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :name

      t.timestamps
    end

    add_reference :posts, :customers, index: true, foreign_key: true
  end
end
