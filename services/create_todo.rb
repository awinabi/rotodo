class EmptyParams < StandardError; end
class DateAlreadyReserved < StandardError; end

class CreateTodo
  attr_writer :task

  def initialize(params)
    @params = params['task']
  end

  def create
    raise EmptyParams if empty_params?
    filter_params

    @todo = Todo.create(created_at: Date.today, task: @task)
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
    puts '~~~~>> PARAMS', @params
  end

  def empty_params?
    @params.empty?
  end
end
