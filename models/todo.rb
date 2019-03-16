require 'sequel'

class Todo < Sequel::Model
  plugin :validation_helpers
  plugin :json_serializer
  plugin :def_dataset_method

  subset(:today, :completed_at => Date.today)

  alias_method :save!, :save

  def self.by_day(day)
    Todo.where(created_at: day)
  end

  def validate
    super
    validates_presence [:task]
  end
end
