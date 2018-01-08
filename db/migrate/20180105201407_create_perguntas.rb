class CreatePerguntas < ActiveRecord::Migration[5.1]
  def change
    create_table :perguntas do |t|
      t.string :titulo
      t.references :cargo, foreign_key: true

      t.timestamps
    end
  end
end
