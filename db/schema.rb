# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_08_12_225145) do
  create_table "air_pollutants", force: :cascade do |t|
    t.string "full_name"
    t.string "abbreviation"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "diseases", force: :cascade do |t|
    t.string "name"
    t.string "icd_code"
    t.integer "version"
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "geographic_locations", force: :cascade do |t|
    t.string "location_in_publication"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "continent"
    t.decimal "latitude", precision: 6, scale: 4
    t.decimal "longitude", precision: 6, scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meta_variables", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pollens", force: :cascade do |t|
    t.string "pollen_type"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pub_air_pollutant_meta_variables", force: :cascade do |t|
    t.integer "publication_id"
    t.integer "air_pollutant_id"
    t.integer "meta_variable_id"
    t.decimal "value", precision: 4, scale: 3
    t.decimal "upper_limit", precision: 4, scale: 3
    t.decimal "lower_limit", precision: 4, scale: 3
    t.string "annotation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["air_pollutant_id"], name: "index_pub_air_pollutant_meta_variables_on_air_pollutant_id"
    t.index ["meta_variable_id"], name: "index_pub_air_pollutant_meta_variables_on_meta_variable_id"
    t.index ["publication_id"], name: "index_pub_air_pollutant_meta_variables_on_publication_id"
  end

  create_table "pub_air_pollutants", force: :cascade do |t|
    t.integer "publication_id"
    t.integer "air_pollutant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["air_pollutant_id"], name: "index_pub_air_pollutants_on_air_pollutant_id"
    t.index ["publication_id"], name: "index_pub_air_pollutants_on_publication_id"
  end

  create_table "pub_diseases", force: :cascade do |t|
    t.integer "publication_id"
    t.integer "disease_id"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["disease_id"], name: "index_pub_diseases_on_disease_id"
    t.index ["publication_id"], name: "index_pub_diseases_on_publication_id"
  end

  create_table "pub_geographic_locations", force: :cascade do |t|
    t.integer "publication_id"
    t.integer "geographic_location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["geographic_location_id"], name: "index_pub_geographic_locations_on_geographic_location_id"
    t.index ["publication_id"], name: "index_pub_geographic_locations_on_publication_id"
  end

  create_table "pub_pollens", force: :cascade do |t|
    t.integer "publication_id"
    t.integer "pollen_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pollen_id"], name: "index_pub_pollens_on_pollen_id"
    t.index ["publication_id"], name: "index_pub_pollens_on_publication_id"
  end

  create_table "pub_statistical_methods", force: :cascade do |t|
    t.integer "publication_id"
    t.integer "statistical_method_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["publication_id"], name: "index_pub_statistical_methods_on_publication_id"
    t.index ["statistical_method_id"], name: "index_pub_statistical_methods_on_statistical_method_id"
  end

  create_table "pub_subject_types", force: :cascade do |t|
    t.integer "publication_id"
    t.integer "subject_type_id"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["publication_id"], name: "index_pub_subject_types_on_publication_id"
    t.index ["subject_type_id"], name: "index_pub_subject_types_on_subject_type_id"
  end

  create_table "pub_weather_relation_codes", force: :cascade do |t|
    t.integer "publication_id"
    t.integer "weather_id"
    t.integer "relation_code_id"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["publication_id"], name: "index_pub_weather_relation_codes_on_publication_id"
    t.index ["relation_code_id"], name: "index_pub_weather_relation_codes_on_relation_code_id"
    t.index ["weather_id"], name: "index_pub_weather_relation_codes_on_weather_id"
  end

  create_table "pub_weathers", force: :cascade do |t|
    t.integer "publication_id"
    t.integer "weather_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["publication_id"], name: "index_pub_weathers_on_publication_id"
    t.index ["weather_id"], name: "index_pub_weathers_on_weather_id"
  end

  create_table "publications", force: :cascade do |t|
    t.string "title"
    t.string "authors"
    t.string "journal"
    t.datetime "published_at"
    t.string "url"
    t.string "doi"
    t.string "access"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "relation_codes", force: :cascade do |t|
    t.string "relation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "statistical_methods", force: :cascade do |t|
    t.string "name"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

<<<<<<< HEAD
  create_table "study_periods", force: :cascade do |t|
    t.integer "publication_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["publication_id"], name: "index_study_periods_on_publication_id"
  end

  create_table "study_results", force: :cascade do |t|
    t.integer "publication_id"
    t.string "outcome"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["publication_id"], name: "index_study_results_on_publication_id"
=======
  create_table "study_outcomes", force: :cascade do |t|
    t.string "outcome"
    t.text "comment"
    t.integer "publication_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["publication_id"], name: "index_study_outcomes_on_publication_id"
  end

  create_table "study_periods", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.text "comment"
    t.integer "publication_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["publication_id"], name: "index_study_periods_on_publication_id"
>>>>>>> a8ca176 (created Rake task for syncing with data from CSV files)
  end

  create_table "subject_types", force: :cascade do |t|
    t.string "name"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "weathers", force: :cascade do |t|
    t.string "primary"
    t.string "secondary"
    t.string "derived"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
