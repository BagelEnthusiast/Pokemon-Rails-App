class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :content
      t.string :op1
      t.string :op2
      t.string :op3
      t.string :op4
      t.string :correct_answer

      t.timestamps
    end
  end
end
