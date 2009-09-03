class FriendsController < ApplicationController
  # GET /friends
  # GET /friends.xml
  def index
    @friends = Friend.find(:all, :conditions => [' user_id = ? ', current_user.id])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @friends }
    end
  end

  # GET /friends/1
  # GET /friends/1.xml
  def show
    @friend = User.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @friend }
    end
  end

  # GET /friends/new
  # GET /friends/new.xml
  def new
    @friend = User.find(params[:friend_user_id])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @friend }
    end
  end

  # GET /friends/1/edit
  def edit
    @friend = Friend.find(params[:id])
  end

  def add
    @friend = Friend.new
    @friend.user_id = current_user.id
    @friend.friend_user_id = params[:friend_user_id]

    respond_to do |format|
      if @friend.save
        flash[:notice] = 'Friend was successfully created.'
        format.html { redirect_to :action => :show, :id => @friend.friend_user_id }
        format.xml  { render :xml => @friend, :status => :created, :location => @friend }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @friend.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /friends/1
  # PUT /friends/1.xml
  def update
    @friend = Friend.find(params[:id])

    respond_to do |format|
      if @friend.update_attributes(params[:friend])
        flash[:notice] = 'Friend was successfully updated.'
        format.html { redirect_to(@friend) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @friend.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /friends/1
  # DELETE /friends/1.xml
  def destroy
    @friend = Friend.find(params[:id])
    @friend.destroy

    respond_to do |format|
      format.html { redirect_to(friends_url) }
      format.xml  { head :ok }
    end
  end
  
  def search
    unless params[:user].nil?
      @friends = User.find(:all, :conditions => ['login = ? or email = ? ', params[:user][:login], params[:user][:email]])
    end
    respond_to do |format|
      format.html 
      format.xml  { head :ok }
    end
  end
  
  def task_request
    @friends = Friend.find(:all, :conditions => [' user_id = ? ', current_user.id])
    @task = Task.find(params[:task_id])
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @friends }
    end
  end
  
  def add_task_request_confirm
    @task = Task.find(params[:task_id])
    @friend = User.find(params[:friend_user_id])
  end
  
  def add_task_request
    @task = Task.find(params[:task][:task_id])
    @task.keep_user_id = params[:task][:friend_user_id]
    
    @task_message = TaskMessage.new(params[:task_message])
    @task_message.task_id = @task.id
    @task_message.user_id = current_user.id
    @task_message.read = false
    
    respond_to do |format|
      if @task.save && @task_message.save
        flash[:notice] = 'メンバーに仕事を依頼しました。'
        format.html { redirect_to(@task) }
        format.xml  { head :ok }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @task.errors, :status => :unprocessable_entity }
      end
    end
  end
end
