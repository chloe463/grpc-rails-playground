class CreateEnquetes < ActiveRecord::Migration[7.0]
  def change
    create_table :enquetes do |t|
      t.string :title
      t.text :description
      t.integer :status
      t.datetime :start_at
      t.datetime :end_at
      t.timestamps
    end
  end
end
