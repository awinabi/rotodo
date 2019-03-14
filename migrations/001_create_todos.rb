Sequel.migration do
  change do
    create_table(:todos) do
      primary_key :id, unique: true
      String :task, null: false
      Date :created_at, null: true
      Date :completed_at, null: true
    end
  end
end
