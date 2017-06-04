require 'test_helper'

class TodoWorkerTest < MiniTest::Unit::TestCase
  def test_job_creation
    TodoWorker.perform_async({description: 'foo', status: false})
    assert_equal 1, TodoWorker.jobs.size
  end
end

