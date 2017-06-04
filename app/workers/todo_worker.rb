class TodoWorker
  include Sidekiq::Worker

  def perform(todo_description)
    todo_job = Todo.new(todo_description)
    return true if todo_job.save
    false
  end
end
