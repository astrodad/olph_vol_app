#lib/tasks/import.rake
namespace :db do
desc "Imports a CSV file into an ActiveRecord table"
task import_activities: :environment do

  filename = 'db/data/olph-activities.csv'
  model = 'Activity'

  lines = File.new(filename).readlines
  header = lines.shift.strip
  keys = header.split(',')
  lines.each do |line|
    params = {}
    values = line.strip.split(',')
    keys.each_with_index do |key,i|
      params[key] = values[i]
    end
    Module.const_get(model).create(params)
  end
end
end