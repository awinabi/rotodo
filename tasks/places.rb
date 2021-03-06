require 'yaml'
require_relative '../models/todo'

namespace :todo do
  task :create do
    todos = YAML::load(File.open('todos.yml'))

    todos.each do |todo|
      Todo.create(task: todo.task)
    end
    puts '<= todos created'
  end
end
