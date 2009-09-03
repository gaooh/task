class TasksController < ApplicationController
  # GET /tasks
  # GET /tasks.xml
  def index
    @tasks = Task.my_tasks(current_user.id)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tasks }
    end
  end

  def request_index
    @tasks = Task.request_tasks(current_user.id)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tasks }
    end    
  end
  
  def fixed_index
    @tasks = Task.fixed_tasks(current_user.id)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tasks }
    end    
  end
  
  def close_index
    @tasks = Task.close_tasks(current_user.id)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tasks }
    end    
  end
  
  # GET /tasks/1
  # GET /tasks/1.xml
  def show
    @task = Task.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.xml
  def new
    @task = Task.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.xml
  def create
    @task = Task.new(params[:task])
    @task.keep_user_id = current_user.id
    @task.user_id = current_user.id
    @task.read = false
    @task.open
    
    respond_to do |format|
      if @task.save
        flash[:notice] = '新しく仕事を作成しました。'
        format.html { redirect_to(@task) }
        format.xml  { render :xml => @task, :status => :created, :location => @task }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @task.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.xml
  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        flash[:notice] = 'Task was successfully updated.'
        format.html { redirect_to(@task) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @task.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.xml
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to(tasks_url) }
      format.xml  { head :ok }
    end
  end
  
  def fixed_confirm
    @task = Task.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @task }
    end
  end
  
  def fixed
    @task_message = TaskMessage.new(params[:task_message])
    @task_message.user_id = current_user.id
    @task_message.read = false
    
    @task = Task.find(params[:task_message][:task_id])
    @task.keep_user_id = @task.user_id
    @task.fixed
    
    respond_to do |format|
      if @task_message.save && @task.save
        flash[:notice] = 'タスクを完了しました。'
        format.html { redirect_to(@task) }
        format.xml  { render :xml => @task, :status => :created, :location => @task }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @task.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def close_confirm
    @task = Task.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @task }
    end
  end
  
  def close
    @task_message = TaskMessage.new(params[:task_message])
    @task_message.user_id = current_user.id
    @task_message.read = false
    
    @task = Task.find(params[:task_message][:task_id])
    @task.keep_user_id = @task.user_id
    @task.close
    
    respond_to do |format|
      if @task_message.save && @task.save
        flash[:notice] = 'タスクを完了しました。'
        format.html { redirect_to(@task) }
        format.xml  { render :xml => @task, :status => :created, :location => @task }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @task.errors, :status => :unprocessable_entity }
      end
    end
  end
end
