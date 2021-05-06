class Doctor < ApplicationRecord
  has_many :appointments
  has_many :patients, through: :appointments
  belongs_to :city
  has_many :join_table_specialty_doctor
  has_many :specialty, through: :join_table_specialty_doctor
end
