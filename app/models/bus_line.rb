class BusLine < ApplicationRecord
    has_many :bus_schedules
    after_create_commit -> { broadcast_append_to 'bus_lines', partial: 'bus_lines/list_item' }
    after_update_commit -> { broadcast_update_to 'bus_lines', partial: 'bus_lines/list_item' }
    after_destroy_commit -> { broadcast_remove_to 'bus_lines' }

    validates :name, presence: true
end
