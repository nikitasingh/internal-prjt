class SubCategoriesController < ApplicationController
  # GET /sub_categories
  # GET /sub_categories.json
  def index
    @sub_categories = SubCategory.order("id asc").page( params[:page]).per(5)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sub_categories }
    end
  end

  # GET /sub_categories/1
  # GET /sub_categories/1.json
  def show
    @sub_category = SubCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sub_category }
    end
  end

  # GET /sub_categories/new
  # GET /sub_categories/new.json
  def new
    @sub_category = SubCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sub_category }
    end
  end

  # GET /sub_categories/1/edit
  def edit
    @sub_category = SubCategory.find(params[:id])
  end

  # POST /sub_categories
  # POST /sub_categories.json
  def create
    @sub_category = SubCategory.new(params[:sub_category])

    respond_to do |format|
      if @sub_category.save
        format.html { redirect_to sub_categories_url, notice: 'Sub category was successfully created.' }
        format.json { render json: @sub_category, status: :created, location: @sub_category }
      else
        format.html { render action: "new" }
        format.json { render json: @sub_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sub_categories/1
  # PUT /sub_categories/1.json
  def update
    @sub_category = SubCategory.find(params[:id])

    respond_to do |format|
      if @sub_category.update_attributes(params[:sub_category])
        format.html { redirect_to sub_categories_url, notice: 'Sub category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sub_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sub_categories/1
  # DELETE /sub_categories/1.json
  def destroy
     @sub_category = SubCategory.find(params[:id])
    
      @sub_category.destroy

    respond_to do |format|
      format.html { redirect_to sub_categories_url }
      format.json { head :no_content }
    end
  end
    def list_events_for_category
      @sub_category= SubCategory.find(params[:id])
        @events = SubCategory.find(params[:id]).events.page(params[:page]).per(5)
         #@sub_category=@sub_category.page(params[:page])
         # @sub_category = SubCategory.order("id asc").page( params[:page]).per(5)

 
      end
end
