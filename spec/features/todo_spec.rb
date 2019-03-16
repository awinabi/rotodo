require 'spec_helper'

describe "todo actions", type: :feature, js: true do
  let(:user) { Fabricate(:user) }

  before(:each) do
    login_user(user)
  end

  it 'creates new todo' do
    visit '/'
    fill_in 'task', with: 'My First task'

    expect(Todo.count).to eq(0)
    click_button 'Save'
    expect(Todo.count).to eq(1)
  end

  it 'returns empty params error' do
    visit '/'

    expect(Todo.count).to eq(0)
    click_button 'Save'
    expect(Todo.count).to eq(0)
  end
end
