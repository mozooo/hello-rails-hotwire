class BusSchedulesController < ApplicationController
  before_action :set_bus_schedule, only: %i[ show edit update destroy ]

  # GET /bus_schedules
  def index
    @bus_schedules = BusSchedule.all
  end

  # GET /bus_schedules/1
  def show
  end

  # GET /bus_schedules/new
  def new
    @bus_schedule = BusSchedule.new
  end

  # GET /bus_schedules/1/edit
  def edit
  end

  # POST /bus_schedules
  def create
    @bus_schedule = BusSchedule.new(bus_schedule_params)

    if @bus_schedule.save
      redirect_to @bus_schedule, notice: "Bus schedule was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bus_schedules/1
  def update
    if @bus_schedule.update(bus_schedule_params)
      redirect_to @bus_schedule, notice: "Bus schedule was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /bus_schedules/1
  def destroy
    @bus_schedule.destroy
    redirect_to bus_schedules_url, notice: "Bus schedule was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bus_schedule
      @bus_schedule = BusSchedule.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bus_schedule_params
      params.require(:bus_schedule).permit(:departure_hour, :departure_minute, :bus_line_id)
    end
end
