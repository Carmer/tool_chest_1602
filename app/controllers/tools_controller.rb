class ToolsController < ApplicationController

  def index
    @tools = Tool.all
  end

  def show
    @tool = Tool.find(params[:id])
  end

  def new
    @tool = Tool.new
  end

  def create
    @tool = Tool.new(tool_params)
    if @tool.save
      redirect_to tool_path(@tool)   # Rails is 'smart' enough to also do => 'redirect_to @tool'
    else
      render :new
    end
  end

  private

  def tool_params
    params.require(:tool).permit(:name, :price, :quantity)
  end
end
