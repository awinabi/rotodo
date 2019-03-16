class EmptyParams < StandardError; end
class DateAlreadyReserved < StandardError; end

class CreateTodo
  attr_writer :task

  def initialize(params, user)
    @params = params['task']
    @user = user
  end

  def create
    raise EmptyParams if empty_params?
    filter_params

    @todo = Todo.create(created_at: Date.today, task: @task, user_id: @user.id, assigned_user_id: @user.id)
  end

  def success_message
    "Todo created #{@task}"
  end

  def error_message(error)
    "Sorry, errors occured: #{error}"
  end

  private

  def filter_params
    @task = @params
  end

  def empty_params?
    @params.empty?
  end
end
