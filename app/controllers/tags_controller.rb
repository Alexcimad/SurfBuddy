class TagsController < ApplicationController

# CREATE
  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    # @tag.user = current_user
    if @tag.save
      redirect_to tag_path(@tag) #modifier
    else
      render :new
    end
  end

end

#INDEX
def
    @tags = Tag.all
end