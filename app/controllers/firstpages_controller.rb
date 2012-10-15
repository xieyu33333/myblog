class FirstpagesController < ApplicationController
  skip_before_filter :authorize, only: [:page, :back,:content,:update, :destroy]

  # GET /firstpages
  # GET /firstpages.json
  
  def index
    @firstpages = Firstpage.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @firstpages }
    end
  end

  # GET /firstpages/1
  # GET /firstpages/1.json
  def show
    @firstpage = Firstpage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @firstpage }
    end
  end

  # GET /firstpages/new
  # GET /firstpages/new.json
  def new
    @firstpage = Firstpage.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @firstpage }
    end
  end

  # GET /firstpages/1/edit
  def edit
    @firstpage = Firstpage.find(params[:id])
  end

  # POST /firstpages
  # POST /firstpages.json
  def create
    @firstpage = Firstpage.new(params[:firstpage])

    respond_to do |format|
      if @firstpage.save
        format.html { redirect_to @firstpage, notice: 'Firstpage was successfully created.' }
        format.json { render json: @firstpage, status: :created, location: @firstpage }
      else
        format.html { render action: "new" }
        format.json { render json: @firstpage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /firstpages/1
  # PUT /firstpages/1.json
  def update
    @firstpage = Firstpage.find(params[:id])

    respond_to do |format|
      if @firstpage.update_attributes(params[:firstpage])
        format.html { redirect_to @firstpage, notice: 'Firstpage was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @firstpage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /firstpages/1
  # DELETE /firstpages/1.json
  def destroy
    @firstpage = Firstpage.find(params[:id])
    @firstpage.destroy

    respond_to do |format|
      format.html { redirect_to firstpages_url }
      format.json { head :no_content }
    end
  end
  
  # GET /firstpages/page
  # GET /firstpages/page.json
  def page
    @select = Firstpage.where(:pid=>params[:pid])
   # @select = Firstpage.find_all_by_pid(params[:par_id])
    respond_to do |format|
      format.html # page.html.erb
      format.js { render :layout => false }
      format.json { render :json => @select}
    end
  end
  
 def back
    @select = Firstpage.select('pid').where(:title=>params[:id])
   
    respond_to do |format|
      format.html # page.html.erb
      format.js { render :layout => false }
      format.json { render :json => @select}
    end
  end
  
  def content
    @select = Firstpage.where(:title=>params[:id])
    
    respond_to do |format|
      format.html # page.html.erb
      format.js { render :layout => false }
      format.json { render :json => @select}
    end
  end
end
