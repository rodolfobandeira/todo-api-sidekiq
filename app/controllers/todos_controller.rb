class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy]

  # GET /todos
  # GET /todos.json
  def index
    @todos = Todo.all
  end

  # GET /todos/1
  # GET /todos/1.json
  def show; end

  # GET /todos/new
  def new
    @todo = Todo.new
  end

  # GET /todos/1/edit
  def edit; end

  # POST /todos
  # POST /todos.json
  def create
    @todo = Todo.new
    todo_job = @todo.add_todo_job(todo_params)

    respond_to do |format|
      if todo_job
        flash[:notice] = 'Todo was successfully scheduled for creation.'
        format.html { redirect_to :todos }
        format.json { render :show, status: :created, location: @todo }
      else
        format.html { render :new }
        format.json do
          render json: @todo.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /todos/1
  # PATCH/PUT /todos/1.json
  def update
    respond_to do |format|
      if @todo.update(todo_params)
        format.html do
          redirect_to @todo, notice: 'Todo was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @todo }
      else
        format.html { render :edit }
        format.json do
          render json: @todo.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /todos/1
  # DELETE /todos/1.json
  def destroy
    @todo.destroy
    respond_to do |format|
      format.html do
        redirect_to todos_url, notice: 'Todo was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  def set_todo
    @todo = Todo.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit([:description, :status]).to_h
  end
end
