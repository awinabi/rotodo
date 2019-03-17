RodaApp.route('todo') do |r|

  # POST /api/todos
  r.post do
    begin
      @todo = CreateTodo.new(r.params, current_user)
      created_todo = @todo.create

      status(200)
      { responseText: { todo: created_todo.task }, success: true }.to_json

      rescue ArgumentError, EmptyParams, DateAlreadyReserved, Sequel::ValidationFailed => e
        status(400)
        @todo.error_message(e)
    end
  end

  # GET api/todos
  r.get do
    Todo.all
  end
end
