class CreateExams < ActiveRecord::Migration[5.1]
  def change
    create_table :exams do |t|
      t.string :date
      t.string :time
      t.string :length
      t.string :roll

      t.timestamps
    end
  end
end
