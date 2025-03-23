desc 'drops the db, creates db, migrates db and populates sample data'
task setup: [:environment] do
  if Rails.env.production?
    puts "Skipping db:drop and db:create in production"
    Rake::Task['db:migrate'].invoke  # Just migrate the database
  else
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    Rake::Task['db:migrate'].invoke
  end

  Rake::Task['populate_with_sample_data'].invoke
end

task populate_with_sample_data: [:environment] do
  if Rails.env.production?
    puts "Skipping deleting and populating sample data in production"
  else
    puts "sample data has been added."
  end
  create_sample_data!
end

def create_sample_data!
  puts 'Seeding with sample data...'
  create_user! email: 'oliver@example.com', name: 'Oliver'
  create_user! email: 'sam@example.com', name: 'Sam'
  puts 'Done! Now you can login with either "oliver@example.com" or "sam@example.com", using password "welcome"'
end

def create_user!(options = {})
  user_attributes = { password: 'welcome', password_confirmation: 'welcome' }
  attributes = user_attributes.merge options
  User.create! attributes
end
