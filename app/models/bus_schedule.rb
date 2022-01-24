class BusSchedule < ApplicationRecord
    belongs_to :bus_line
    scope :list_all, -> { eager_load(:bus_line).order(:departure_hour, :departure_minute, :id) }

    validates :departure_hour,
        presence: true,
        numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than: 24, allow_blank: true }
    validates :departure_minute,
        presence: true,
        numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than: 60, allow_blank: true }
    validates :bus_line_id,
        presence: true,
        numericality: { only_integer: true }
end
