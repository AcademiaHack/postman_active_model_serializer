class CreateBanksPeopleJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_join_table :banks, :people do |t|
      t.index :bank_id
      t.index :person_id
    end
  end
end
