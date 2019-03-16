Sequel.migration do
  up do
    add_column :todos, :user_id, Integer, null: false
    add_column :todos, :assigned_user_id, Integer, null: false
  end

  down do
    drop_column :todos, :user_id
    drop_column :todos, :assigned_user_id
  end
end
