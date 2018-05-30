class Planning < ActiveRecord::Base

belongs_to :user
belongs_to :doctor
belongs_to :cycle
has_many :visits, :dependent => :destroy
validates :title, presence: true
validates :shift, presence: true
validates :date_visit, presence: true

    SHIFTS =
      [
        ['AM', 'AM'],
        ['PM', 'PM']

      ]

end
