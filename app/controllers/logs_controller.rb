class LogsController < ApplicationController

  def index
    @logs = Log.all
  end

  def show
    @log = Log.find(params[:id])
  end

  def new
    @log = Log.new
    @logs = Log.paginate :page => params[:page], :per_page => 5
  end

  def create
    @log = Log.new(log_params)
    @logs = Log.paginate :page => params[:page], :per_page => 5

    if @log.save
      redirect_to @log
    else
      render :new, status: :unprocessable_entity, logs: @logs
    end
  end

  def edit
    @log = Log.find(params[:id])
  end

  def update
    @log = Log.find(params[:id])

    if @log.update(log_params)
      redirect_to @log
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @log = Log.find(params[:id])
    @log.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def log_params
      params.require(:log).permit(:title, :body, :status)
    end
end
