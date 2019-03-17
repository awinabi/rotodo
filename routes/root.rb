RodaApp.route('home') do |r|
  r.get do
    env['warden'].authenticate!
    response['Content-Type'] = 'text/html'
    r.params['day'] ? @day = ( Date.parse r.params['day'] ) : @day = Date.today

    @todos = Todo.created_by(current_user.id)
    @assigned_todos = Todo.assigned_to(current_user.id)

    view('todos/index')
  end
end
