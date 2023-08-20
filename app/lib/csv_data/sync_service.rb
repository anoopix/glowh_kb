require 'csv'

module CsvData
    class SyncService
        def csv_model_list
            [
                ['air_pollutant', ['full_name']],
                ['disease', ['name']],
                ['geographic_location', ['location_in_publication', 'city', 'state', 'country', 'continent']],
                ['meta_variable', ['name']],
                ['pollen', ['pollen_type']],
                ['publication', ['title']],
                ['relation_code', ['relation']],
                ['statistical_method', ['name']],
                ['subject_type', ['name']],
                ['weather', ['primary', 'secondary', 'derived']]

            ]
        end

        def csv_relation_tables
            [
                # 'pub_air_pollutant_meta_variable',
                # 'pub_air_pollutant',
                # 'pub_disease',
                # 'pub_geographic_location',
                # 'pub_pollen',
                # 'pub_statistical_method',
                # 'pub_subject_type',
                # 'pub_weather_relation_code',
                # 'pub_weather',
                # 'study_outcomes',
                # 'study_periods'
            ]
        end

        def initialize
            gather_csv_files_to_sync
        end

        def execute
            sync_model_tables
        end

        def gather_csv_files_to_sync
            puts "Gathering csv files to sync..."
            @tables_to_skip = []
            csv_model_list.each do |csv_table|
                if File.exists?("Glowhkb_excel/#{csv_table[0]}.csv")
                    csv_file = File.open("Glowhkb_excel/#{csv_table[0]}.csv", "r:ISO-8859-1")
                    instance_variable_set("@#{csv_table[0]}_set", CSV.parse(csv_file))
                else
                    puts "File missing: #{csv_table[0]}"
                    @tables_to_skip << csv_table[0]
                end
            end
        end

        def sync_model_tables
            csv_model_list.each do |csv_table|
                next if @tables_to_skip.include? csv_table[0]
                sync_table(csv_table[0], csv_table[1])
            end
        end

        def sync_table(csv_table_name, identifiers)
            model = csv_table_name.camelcase.constantize
            obj_name = csv_table_name.humanize

            puts "Syncing #{csv_table_name}.csv ..."

            table_set = instance_variable_get("@#{csv_table_name}_set")

            table_set.each_with_index do |row, index|
                next if index.zero?

                attributes = {}
                identifier_attrs = {}
                model.column_names.each_with_index do |column_name, index|
                    next if ['id', 'created_at', 'updated_at'].include? column_name

                    if model.column_for_attribute(column_name).type == :datetime
                        value = DateTime.new(row[index].to_i)
                    else
                        value = (row[index].nil? || row[index].downcase == 'null') ? nil : row[index]
                    end
                    attributes.merge!(column_name => value)

                    if identifiers.include? column_name.downcase
                        identifier_attrs.merge!(column_name => value)
                    end
                end
                
                if model.where(identifier_attrs).present?
                    id_attr_index = model.where({identifier_attrs.keys[0] => identifier_attrs.values[0]}).count > 1 ? 1 : 0
                    puts "#{obj_name} '#{identifier_attrs.values[id_attr_index]}' is already in database"
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
    end
end