# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Patient.destroy_all
Doctor.destroy_all
Appointment.destroy_all
City.destroy_all
Specialty.destroy_all
JoinTableSpecialtyDoctor.destroy_all

=begin
5.times do |index|
  City.create(name: Faker::Nation.capital_city)
  Patient.create(first_name: "prénom#{index}", last_name: "nom#{index}", city_id: City.all.sample.id)
  Doctor.create(first_name: "prénom#{index}", last_name: "nom#{index}", specialty: "specialty#{index}", zip_code: "3100#{index}", city_id: City.all.sample.id)
  Specialty.create(name: ["Cardiologue", "Proctologue", "Psychologue", "Médecin de campagne"].sample)
  JoinTableSpecialtyDoctor.create(doctor_id: Doctor.all.sample.id, specialty_id: Specialty.all.sample.id)
  Appointment.create(date: "'2020-12-#{index} 10:00:00'", doctor_id: Doctor.all.sample.id, patient_id: Patient.all.sample.id, city_id: City.all.sample.id)
end
=end

5.times do
  specialty = Specialty.create(name: ["Cardiologue", "Proctologue", "Psychologue", "Médecin de campagne"].sample)
  city = City.create(name: Faker::Nation.capital_city)
  doctor = Doctor.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city_id: City.all.sample.id)
  join_table_specialty_doctors = JoinTableSpecialtyDoctor.create(doctor_id: Doctor.all.sample.id, specialty_id: Specialty.all.sample.id)
  patient = Patient.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city_id: City.all.sample.id)
  appointment = Appointment.create(doctor_id: Doctor.all.sample.id, patient_id: Patient.all.sample.id, date: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now), city_id: City.all.sample.id)
end