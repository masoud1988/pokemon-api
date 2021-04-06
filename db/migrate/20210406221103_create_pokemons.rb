class CreatePokemons < ActiveRecord::Migration[6.0]
  def change
    create_table :pokemons do |t|
      t.integer :number,      null: false
      t.string :name,         null: false, default: ""
      t.string :type_1,       null: false, default: ""
      t.string :type_2                    
      t.integer :total,       null: false, default: 0
      t.integer :hp,          null: false, default: 0
      t.integer :attack,      null: false, default: 0
      t.integer :defense,     null: false, default: 0
      t.integer :sp_atk,      null: false, default: 0
      t.integer :sp_def,      null: false, default: 0
      t.integer :speed,       null: false, default: 0
      t.integer :generation,  null: false
      t.boolean :legendary,   null: false, default: false
      t.references :user,     null: false, foreign_key: true

      t.timestamps
    end
  end
end
