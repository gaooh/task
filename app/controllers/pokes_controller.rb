class PokesController < ApplicationController
  # GET /pokes
  # GET /pokes.xml
  def index
    @pokes = Poke.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pokes }
    end
  end

  # GET /pokes/1
  # GET /pokes/1.xml
  def show
    @poke = Poke.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @poke }
    end
  end

  # GET /pokes/new
  # GET /pokes/new.xml
  def new
    @poke = Poke.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @poke }
    end
  end

  # GET /pokes/1/edit
  def edit
    @poke = Poke.find(params[:id])
  end

  # POST /pokes
  # POST /pokes.xml
  def create
    @poke = Poke.new(params[:poke])

    respond_to do |format|
      if @poke.save
        flash[:notice] = 'Poke was successfully created.'
        format.html { redirect_to(@poke) }
        format.xml  { render :xml => @poke, :status => :created, :location => @poke }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @poke.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pokes/1
  # PUT /pokes/1.xml
  def update
    @poke = Poke.find(params[:id])

    respond_to do |format|
      if @poke.update_attributes(params[:poke])
        flash[:notice] = 'Poke was successfully updated.'
        format.html { redirect_to(@poke) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @poke.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pokes/1
  # DELETE /pokes/1.xml
  def destroy
    @poke = Poke.find(params[:id])
    @poke.destroy

    respond_to do |format|
      format.html { redirect_to(pokes_url) }
      format.xml  { head :ok }
    end
  end
  
  def add
    poke = Poke.find(:first, :conditions => [' task_id = ? and user_id = ? ', params[:task_id], current_user.id])
    if poke.nil?
      poke = Poke.new({:task_id => params[:task_id], :user_id => current_user.id, :num => 1})
    else
      poke.num = poke.num + 1
    end
    
    respond_to do |format|
      if poke.save
        flash[:notice] = '( ´∀｀)σ)Д｀)'
      end
      format.html { redirect_to :controller => 'tasks', :action => 'show', :id => poke.task_id }
      format.xml  { head :ok }
    end
  end
end
