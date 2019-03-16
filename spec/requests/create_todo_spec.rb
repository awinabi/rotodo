require 'spec_helper'

describe 'Create todo' do
  it 'should create a todo' do
    login_as Fabricate(:user)
    post 'api/todos', { task: 'My First Todo' }

    expect(last_response.status).to eq(200)
    expect(Todo.count).to eq(1)
    todo = Todo.last

    expect(todo.task).to eq('My First Todo')
  end
end
