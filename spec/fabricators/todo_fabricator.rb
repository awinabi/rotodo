Fabricator(:todo) do
  task 'My First Task'
  user
  assigned_user { Fabricate(:user) }
end

