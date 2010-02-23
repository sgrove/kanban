class CardsController < ApplicationController
  before_filter :find_project
  before_filter :find_stage
  
  # GET /cards
  # GET /cards.xml
  def index
    @cards = @stage.cards

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cards }
    end
  end

  # GET /cards/1
  # GET /cards/1.xml
  def show
    @card = @stage.cards.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @card }
    end
  end

  # GET /cards/new
  # GET /cards/new.xml
  def new
    @card = @stage.cards.build(:project => @project)

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @card }
    end
  end

  # GET /cards/1/edit
  def edit
    @card = @stage.cards.find(params[:id])
  end

  # POST /cards
  # POST /cards.xml
  def create
    @card = @stage.cards.new(params[:card])

    respond_to do |format|
      if @card.save
        format.html { redirect_to(@project, :notice => 'Card was successfully created.') }
        format.xml  { render :xml => @card, :status => :created, :location => @card }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @card.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cards/1
  # PUT /cards/1.xml
  def update
    @card = @stage.cards.find(params[:id])

    respond_to do |format|
      if @card.update_attributes(params[:card])
        format.html { redirect_to(@project, :notice => 'Card was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @card.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cards/1
  # DELETE /cards/1.xml
  def destroy
    @card = @stage.cards.find(params[:id])
    @card.destroy

    respond_to do |format|
      format.html { redirect_to(@project) }
      format.xml  { head :ok }
    end
  end
  
  
  def advance
    @card = @stage.cards.find(params[:id])
    next_stage = @project.stages[@project.stages.index(@stage) + 1] rescue nil
    if next_stage && @card.update_attribute(:stage, next_stage)
      respond_to do |format|
        format.html { redirect_to(@project) }
        format.xml  { head :ok }
      end
    end
  end

  def recede
    @card = @stage.cards.find(params[:id])
    next_stage = @project.stages[@project.stages.index(@stage) - 1] rescue nil
    if next_stage && @card.update_attribute(:stage, next_stage)
      respond_to do |format|
        format.html { redirect_to(@project) }
        format.xml  { head :ok }
      end
    end
  end


protected

  def find_project
    @project = Project.find(params[:project_id])
  end
  
  def find_stage
    @stage = @project.stages.find(params[:stage_id])
  end

end
