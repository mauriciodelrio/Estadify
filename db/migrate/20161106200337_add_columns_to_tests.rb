class AddColumnsToTests < ActiveRecord::Migration
  def change
    add_column :tests, :good_answers, :integer
    add_column :tests, :question1, :integer
    add_column :tests, :question2, :integer
    add_column :tests, :question3, :integer
    add_column :tests, :question4, :integer
    add_column :tests, :question5, :integer
    add_column :tests, :question6, :integer
    add_column :tests, :question7, :integer
    add_column :tests, :question8, :integer
    add_column :tests, :question9, :integer
    add_column :tests, :question10, :integer
  end
end
