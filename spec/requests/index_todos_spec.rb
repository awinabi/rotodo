require 'spec_helper'

describe 'Index todos' do
  let!(:todo) { Fabricate(:todo) }

  it 'should return todos list' do
    get 'api/todos', { }

    expect(last_response.status).to eq(200)
    parsed_response = JSON.parse(last_response.body)

    expect(parsed_response.size).to eq(1)
  end
end
