class CreateExams < ActiveRecord::Migration[5.1]
  def change
    create_table :exams do |t|
      t.string :subject
      t.string :date
      t.string :time

      t.timestamps
    end
  end
end
