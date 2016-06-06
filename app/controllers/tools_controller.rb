class ToolsController < ApplicationController

  def new
    @tool = Tool.new
  end

  def show
    @tool = Tool.find(params[:id])
  end

  def edit
    @tool = Tool.find(params[:id])
  end

  def update
    @tool = Tool.find(params[:id])
    if @tool.update_attributes( tool_params )
      redirect_to @tool
    else
      render :edit
    end
  end

  def index
    @tools = Tool.all
  end

  def create
    @tool = Tool.new( tool_params )

    if @tool.save
      flash[:notice] = "Tool: #{@tool.name} has been created!"
      redirect_to tool_path(@tool)
    else
      render :new
    end
  end

  def show
    @tool = Tool.find(params[:id])
  end

  def destroy
    Tool.find(params[:id]).destroy
    redirect_to tools_path
  end

  private

  def tool_params
    params.require(:tool).permit(:name, :quantity, :price)
  end
end
