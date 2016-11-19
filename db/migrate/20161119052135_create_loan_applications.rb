class CreateLoanApplications < ActiveRecord::Migration[5.0]
  def change
    create_table :loan_applications do |t|
      t.integer :loan_amount
      t.integer :loan_term

      t.timestamps
    end
  end
end
