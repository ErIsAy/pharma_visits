class Planning < ActiveRecord::Base

validates :title, presence: true
validates :shift, presence: true

    SHIFTS =
      [
        ['AM', 'AM'],
        ['PM', 'PM']

      ]

end
