require 'sequel'

class Todo < Sequel::Model
  plugin :validation_helpers
  plugin :json_serializer
  plugin :def_dataset_method

  many_to_one :user
  many_to_one :assigned_user, class: :User
  subset(:today, :completed_at => Date.today)

  alias_method :save!, :save

  def validate
    super
    validates_presence [:task]
  end

  def self.by_day(day)
    Todo.where(created_at: day)
  end

  def self.assigned_to(user_id)
    Todo.where(assigned_user_id: user_id)
  end

  def self.created_by(user_id)
    Todo.where(user_id: user_id)
  end
end
