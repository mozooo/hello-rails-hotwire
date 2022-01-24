class BusLinesController < ApplicationController
  before_action :set_bus_line, only: %i[ show edit update destroy ]

  # GET /bus_lines
  def index
    @bus_lines = BusLine.all
  end

  # GET /bus_lines/1
  def show
  end

  # GET /bus_lines/new
  def new
    @bus_line = BusLine.new
  end

  # GET /bus_lines/1/edit
  def edit
  end

  # POST /bus_lines
  def create
    @bus_line = BusLine.new(bus_line_params)

    if @bus_line.save
      redirect_to @bus_line, notice: "Bus line was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bus_lines/1
  def update
    if @bus_line.update(bus_line_params)
      redirect_to @bus_line, notice: "Bus line was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /bus_lines/1
  def destroy
    @bus_line.destroy
    redirect_to bus_lines_url, notice: "Bus line was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bus_line
      @bus_line = BusLine.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bus_line_params
      params.require(:bus_line).permit(:name)
    end
end
