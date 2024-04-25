# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# Créer des villes
City.create(name: 'Paris', zip_code: '75000')
City.create(name: 'Lyon', zip_code: '69000')
City.create(name: 'Marseille', zip_code: '13000')

# Créer des spécialités
Specialty.create(name: 'Cardiology', description: 'Arret du coeur')
Specialty.create(name: 'Dermatology', description: 'Peau transparante')
Specialty.create(name: 'Gastroenterology', description: 'Digestif qui digeste')
Specialty.create(name: 'Pediatrics', description: 'Enfant pro')

# Créer des médecins et associer les spécialités
doctor1 = Doctor.create(first_name: 'John', last_name: 'Doe', city: City.first)
doctor1.specialties << Specialty.first
doctor1.specialties << Specialty.second

doctor2 = Doctor.create(first_name: 'Jane', last_name: 'Smith', city: City.second)
doctor2.specialties << Specialty.second
doctor2.specialties << Specialty.third

doctor3 = Doctor.create(first_name: 'Bob', last_name: 'Johnson', city: City.third)
doctor3.specialties << Specialty.first
doctor3.specialties << Specialty.fourth

# Créer des patients
Patient.create(first_name: 'Michael', last_name: 'Brown', city: City.first)
Patient.create(first_name: 'Emma', last_name: 'Watson', city: City.second)
Patient.create(first_name: 'Oliver', last_name: 'Jones', city: City.third)

# Créer des rendez-vous
Appointment.create(date: DateTime.new(2024, 3, 1, 10, 0, 0), doctor: doctor1, patient: Patient.first, city: City.first)
Appointment.create(date: DateTime.new(2024, 3, 2, 14, 0, 0), doctor: doctor2, patient: Patient.second, city: City.second)
Appointment.create(date: DateTime.new(2024, 3, 3, 9, 0, 0), doctor: doctor3, patient: Patient.third, city: City.third)
Appointment.create(date: DateTime.new(2024, 3, 4, 11, 0, 0), doctor: doctor1, patient: Patient.third, city: City.third)