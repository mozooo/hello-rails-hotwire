class ListBusSchedulesController < ApplicationController
    def index
      sleep 2
      @bus_schedules = BusSchedule.list_all
    end
  end