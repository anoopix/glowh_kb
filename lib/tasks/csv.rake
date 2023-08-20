namespace :csv do
    desc "Sync data from CSV tables"

    task sync: :environment do
        CsvData::SyncService.new.execute
    end
end