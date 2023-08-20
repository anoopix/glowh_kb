require 'csv'

module CsvData
    class SyncService
        def csv_model_list
            [
                'air_pollutant',
                'disease',
                'geographic_location',
                'meta_variable',
                'pollen',
                'publication',
                'relation_code',
                'statistical_method',
                'subject_type',
                'weather'
            ]
        end

        def csv_relation_list
            [
                'pub_air_pollutant_meta_variable',
                'pub_air_pollutant',
                'pub_disease',
                'pub_geographic_location',
                'pub_pollen',
                'pub_statistical_method',
                'pub_subject_type',
                'pub_weather_relation_code',
                'pub_weather',
                'study_result',
                'study_period'
            ]
        end

        def initialize
            gather_csv_files_to_sync
        end

        def execute
            sync_model_tables
            sync_relation_tables
        end

        def gather_csv_files_to_sync
            puts "Gathering csv files to sync..."
            @tables_to_skip = []
            csv_model_list.each do |csv_table|
                if File.exists?("Glowhkb_excel/#{csv_table}.csv")
                    csv_file = File.open("Glowhkb_excel/#{csv_table}.csv", "r:ISO-8859-1")
                    instance_variable_set("@#{csv_table}_set", CSV.parse(csv_file))
                else
                    puts "File missing: #{csv_table}"
                    @tables_to_skip << csv_table
                end
            end

            csv_relation_list.each do |csv_table|
                if File.exists?("Glowhkb_excel/#{csv_table}.csv")
                    csv_file = File.open("Glowhkb_excel/#{csv_table}.csv", "r:ISO-8859-1")
                    instance_variable_set("@#{csv_table}_set", CSV.parse(csv_file))
                else
                    puts "File missing: #{csv_table}"
                    @tables_to_skip << csv_table
                end
            end
        end

        def sync_model_tables
            puts "Syncing model tables ..."
            csv_model_list.each do |csv_table|
                next if @tables_to_skip.include? csv_table
                sync_model_table(csv_table)
            end
            puts "Model tables synced"
        end

        def sync_relation_tables
            puts "Syncing relation tables ..."
            csv_relation_list.each do |csv_table|
                next if @tables_to_skip.include? csv_table
                sync_relation_table(csv_table)
            end
            puts "Relation tables synced"
        end

        def sync_model_table(csv_table_name)
            model = csv_table_name.camelcase.constantize
            obj_name = csv_table_name.humanize

            puts "Syncing #{csv_table_name}.csv ..."

            table_set = instance_variable_get("@#{csv_table_name}_set")

            table_set.each_with_index do |row, index|
                next if index.zero?

                attributes = {}
                model.column_names.each_with_index do |column_name, index|
                    next if ['created_at', 'updated_at'].include? column_name

                    if model.column_for_attribute(column_name).type == :datetime
                        value = DateTime.new(row[index].to_i)
                    else
                        value = (row[index].nil? || row[index].downcase == 'null') ? nil : row[index]
                    end
                    attributes.merge!(column_name => value)
                end

                existing_entity = model.where(id: attributes.values[0]).first

                if existing_entity.present?
                    id_attr_index = model.where({attributes.keys[1] => attributes.values[1]}).count > 1 ? 2 : 1
                    puts "Updating #{obj_name} '#{attributes.values[id_attr_index]}'..."
                    existing_entity.update(attributes)
                    next
                end

                entity = model.new(attributes)
                unless entity.save
                    puts "Error creating #{obj_name}"
                    ap entity.errors.messages
                end
            end

            puts "#{csv_table_name}.csv synced"
            puts ""
        end

        def sync_relation_table(csv_table_name)
            model = csv_table_name.camelcase.constantize
            obj_name = csv_table_name.humanize

            puts "Syncing #{csv_table_name}.csv ..."

            table_set = instance_variable_get("@#{csv_table_name}_set")

            table_set.each_with_index do |row, index|
                next if index.zero?

                attributes = {}
                model.column_names.each_with_index do |column_name, index|
                    next if ['created_at', 'updated_at'].include? column_name

                    if model.column_for_attribute(column_name).type == :datetime
                        value = DateTime.new(row[index].to_i)
                    else
                        value = (row[index].nil? || row[index].downcase == 'null') ? nil : row[index]
                    end
                    attributes.merge!(column_name => value)
                end

                existing_entity = model.where(id: attributes.values[0]).first

                if existing_entity.present?
                    puts "Updating #{obj_name} '#{attributes.values[0]}'..."
                    existing_entity.update(attributes)
                    next
                end

                entity = model.new(attributes)
                unless entity.save
                    ap attributes
                    puts "Error creating #{obj_name}"
                    ap entity.errors.messages
                end
            end

            puts "#{csv_table_name}.csv synced"
            puts ""
        end
    end
end