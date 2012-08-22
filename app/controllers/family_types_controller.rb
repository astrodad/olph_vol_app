class FamilyTypesController < ApplicationController
  # GET /family_types
  # GET /family_types.json
  def index
    @family_types = FamilyType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @family_types }
    end
  end

  # GET /family_types/1
  # GET /family_types/1.json
  def show
    @family_type = FamilyType.find(params[:id])

    #Get the accounts that match this family type
    @accounts = Account.where('family_type_id = '+params[:id]+'')

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @family_type }
    end
  end

  # GET /family_types/new
  # GET /family_types/new.json
  def new
    @family_type = FamilyType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @family_type }
    end
  end

  # GET /family_types/1/edit
  def edit
    @family_type = FamilyType.find(params[:id])
  end

  # POST /family_types
  # POST /family_types.json
  def create
    @family_type = FamilyType.new(params[:family_type])

    respond_to do |format|
      if @family_type.save
        format.html { redirect_to @family_type, notice: 'Family type was successfully created.' }
        format.json { render json: @family_type, status: :created, location: @family_type }
      else
        format.html { render action: "new" }
        format.json { render json: @family_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /family_types/1
  # PUT /family_types/1.json
  def update
    @family_type = FamilyType.find(params[:id])

    respond_to do |format|
      if @family_type.update_attributes(params[:family_type])
        format.html { redirect_to @family_type, notice: 'Family type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @family_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /family_types/1
  # DELETE /family_types/1.json
  def destroy
    @family_type = FamilyType.find(params[:id])
    @family_type.destroy

    respond_to do |format|
      format.html { redirect_to family_types_url }
      format.json { head :no_content }
    end
  end
end
