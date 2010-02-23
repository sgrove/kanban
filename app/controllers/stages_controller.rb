class StagesController < ApplicationController
  before_filter :find_project
  
  # GET /stages
  # GET /stages.xml
  def index
    @stages = @project.stages.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stages }
    end
  end

  # GET /stages/1
  # GET /stages/1.xml
  def show
    @stage = @project.stages.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @stage }
    end
  end

  # GET /stages/new
  # GET /stages/new.xml
  def new
    @stage = @project.stages.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @stage }
    end
  end

  # GET /stages/1/edit
  def edit
    @stage = @project.stages.find(params[:id])
  end

  # POST /stages
  # POST /stages.xml
  def create
    @stage = @project.stages.build(params[:stage])

    respond_to do |format|
      if @stage.save
        format.html { redirect_to(@project, :notice => 'Stage was successfully created.') }
        format.xml  { render :xml => @stage, :status => :created, :location => [@project, @stage] }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @stage.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /stages/1
  # PUT /stages/1.xml
  def update
    @stage = @project.stages.find(params[:id])

    respond_to do |format|
      if @stage.update_attributes(params[:stage])
        format.html { redirect_to(@project, :notice => 'Stage was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @stage.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /stages/1
  # DELETE /stages/1.xml
  def destroy
    @stage = @project.stages.find(params[:id])
    @stage.destroy

    respond_to do |format|
      format.html { redirect_to(@project) }
      format.xml  { head :ok }
    end
  end

protected

  def find_project
    @project = Project.find(params[:project_id])
  end
end
