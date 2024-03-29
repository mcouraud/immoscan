require 'dbf'
data = File.open('public/france2016.dbf')
widgets = DBF::Table.new(data)

namespace :city do
  desc "Update the Cities table with all the right codes."
  task update_all: :environment do
    widgets.each do |record|
      City.create(name: record['NCC'].to_s, ci: "#{record['DEP']}0#{record['COM']}")
      puts City.last.inspect
    end
  end
end
