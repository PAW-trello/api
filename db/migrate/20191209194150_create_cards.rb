class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.string :title
      t.string :description
      t.string :label
      t.references :list

      t.timestamps
    end
  end
end
