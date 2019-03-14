require 'sequel'

class Todo < Sequel::Model

  subset(:today, :completed_at => Date.today)

  alias_method :save!, :save
  plugin :validation_helpers
  plugin :json_serializer

  def self.by_day(day)
    Todo.where(created_at: day)
  end

  def validate
    super
    validates_presence [:task]
  end
end
