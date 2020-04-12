class TagsController < ApplicationController
  def index
    @tag = Tag.new
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
  end

  def show
    @tag = Tag.find_by(id: params[:id])
    @courses = @tag.courses
  end

  def create
    @tag = Tag.create(tag_params)
    unless @tag
      flash[:error] = 'Could not create tag.'
    end
    redirect_to tags_path
  end

  def edit
    @tag = Tag.find_by(id: params[:id])
  end

  def update
    tag = Tag.find_by(id: params[:id])
    tag.update(tag_params)
    redirect_to tag
  end

  def destroy
    @tag = Tag.find_by(id: params[:id])
    @tag.destroy
    redirect_to tags_path
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end
