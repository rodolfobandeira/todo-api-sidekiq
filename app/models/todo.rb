class Todo < ActiveRecord::Base
  def add_todo_job(todo_description)
    return true if TodoWorker.perform_async(todo_description)
    false
  end
end
