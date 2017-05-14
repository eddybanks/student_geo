class Student < ApplicationRecord
  belongs_to :ethnicity
  belongs_to :nationality
  belongs_to :region
  belongs_to :high_school

end
