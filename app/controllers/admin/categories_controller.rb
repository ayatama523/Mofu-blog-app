# frozen_string_literal: true

class Admin::CategoriesController < Admin::ApplicationController
  # skip_before_action :authenticate_user!, only: %i[index]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create 
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = t('.success')
      redirect_to admin_categories_path
    else
      flash.now[:error] = t('.failure')
      render :new
    end
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      flash[:success] = t('.success')
    else
      flash.now[:error] = t('.failure')
    end
    redirect_to admin_categories_path
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:success] = t('.success')
      redirect_to admin_categories_path
    else
      flash.now[:error] = t('.failure')
      render :edit
    end
  end

  private

  def category_params
    params.require(:category).permit(
      :name
    )
  end

end
