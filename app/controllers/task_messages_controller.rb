class TaskMessagesController < ApplicationController
  # GET /task_messages
  # GET /task_messages.xml
  def index
    @task_messages = TaskMessage.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @task_messages }
    end
  end

  # GET /task_messages/1
  # GET /task_messages/1.xml
  def show
    @task_message = TaskMessage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @task_message }
    end
  end

  # GET /task_messages/new
  # GET /task_messages/new.xml
  def new
    @task_message = TaskMessage.new
    @task = Task.find(params[:task_id])
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @task_message }
    end
  end

  # GET /task_messages/1/edit
  def edit
    @task_message = TaskMessage.find(params[:id])
  end

  # POST /task_messages
  # POST /task_messages.xml
  def create
    @task_message = TaskMessage.new(params[:task_message])
    @task_message.user_id = current_user.id
    @task_message.read = false
    
    respond_to do |format|
      if @task_message.save
        flash[:notice] = 'メッセージをおくりました'
        format.html { redirect_to :controller => :tasks, :action => :show, :id => @task_message.task_id }
        format.xml  { render :xml => @task_message, :status => :created, :location => @task_message }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @task_message.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /task_messages/1
  # PUT /task_messages/1.xml
  def update
    @task_message = TaskMessage.find(params[:id])

    respond_to do |format|
      if @task_message.update_attributes(params[:task_message])
        flash[:notice] = 'TaskMessage was successfully updated.'
        format.html { redirect_to(@task_message) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @task_message.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /task_messages/1
  # DELETE /task_messages/1.xml
  def destroy
    @task_message = TaskMessage.find(params[:id])
    @task_message.destroy

    respond_to do |format|
      format.html { redirect_to(task_messages_url) }
      format.xml  { head :ok }
    end
  end
end
