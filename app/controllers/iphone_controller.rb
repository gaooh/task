class IphoneController < ApplicationController
  before_filter :login_required
  
  def index
    @tasks = Task.my_tasks(current_user.id)
    @fixed_tasks = Task.fixed_tasks(current_user.id)
    @close_tasks = Task.close_tasks(current_user.id)
    @request_tasks = Task.request_tasks(current_user.id)
    @friends = Friend.find(:all, :conditions => [' user_id = ? ', current_user.id])
  end
  
  def setting
  end
  
  def update
    @user = User.find(current_user.id)

    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = 'ユーザ情報を更新しました'
        format.html { redirect_to :action => :setting }
        format.xml  { head :ok }
      else
        format.html { render :action => "setting" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end
end
