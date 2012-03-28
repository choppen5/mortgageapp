desc "Reset database to initial state"
task reset: :environment do
  Rake::Task['db:migrate:reset'].invoke
  Rake::Task['db:populate'].invoke
  Rake::Task['db:test:prepare'].invoke
end
