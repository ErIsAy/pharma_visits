class Planning < ActiveRecord::Base

belongs_to :user
belongs_to :doctor
validates :title, presence: true
validates :shift, presence: true

    SHIFTS =
      [
        ['AM', 'AM'],
        ['PM', 'PM']

      ]

end
