class KitsController < ApplicationController

  def index
    @kits = Kit.all
    respond_to do |format|
      format.html
    end
  end

  def show
    @kit = Kit.find(params[:id])
    @products = @kit.all_products_including_children
    respond_to do |format|
      format.html
    end
  end

  def new
    @kit = Kit.new
    respond_to do |format|
      format.html
    end
  end


  def edit
    @kit = Kit.find(params[:id])
  end

  def create
    @kit = Kit.new(params[:kit])
    respond_to do |format|
      if @kit.save
        format.html { redirect_to @kit, notice: 'Kit was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end


  def update
    @kit = Kit.find(params[:id])
    respond_to do |format|
      if @kit.update_attributes(params[:kit])
        format.html { redirect_to @kit, notice: 'Kit was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end



  def destroy
    @kit = Kit.find(params[:id])
    @kit.destroy
    respond_to do |format|
      format.html { redirect_to kits_url }
    end
  end
end
