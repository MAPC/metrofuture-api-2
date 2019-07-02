require 'csv'
require_relative '../lib/seeds/geojson/municipalitiesJSON'
include MunicipalitiesJson

require_relative '../lib/seeds/geojson/icc'
include IccJson

require_relative '../lib/seeds/geojson/magic'
include MagicJson

require_relative '../lib/seeds/geojson/metrowest'
include MetrowestJson

require_relative '../lib/seeds/geojson/nspc'
include NspcJson

require_relative '../lib/seeds/geojson/nstf'
include NstfJson

require_relative '../lib/seeds/geojson/ssc'
include SscJson

require_relative '../lib/seeds/geojson/swap'
include SwapJson

require_relative '../lib/seeds/geojson/tric'
include TricJson

SUBREGIONS = { 
  icc: ICC_JSON,
  magic: MAGIC_JSON, 
  metrowest: METROWEST_JSON, 
  nspc: NSPC_JSON, 
  nstf: NSTF_JSON, 
  ssc: SSC_JSON, 
  swap: SWAP_JSON, 
  tric: TRIC_JSON
}

def load_subregions_csv
  csv_text = File.read(Rails.root.join('lib', 'seeds', 'subregions.csv'))
  csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1')
  csv.each do |row|
    a = Subregion.new
    a.name = row[0]
    a.abbv = row[1]
    a.save
  end
end

def load_municipalities_csv
  csv_text = File.read(Rails.root.join('lib', 'seeds', 'municipalities.csv'))
  csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1')
  csv.each do |row|
    a = Municipality.new
    a.name = row[0]
    a.muni_id = row[2]
    a.geojson = get_geo_json(a.name)
    a.image = '/images/town.jpg'
    a.save
  end
end

def get_geo_json(town)
  MUNICIPALITIES_JSON[:municipalities].detect do |muni|
    if muni[:properties][:town].downcase == town.downcase
      return muni
    end
  end
end

def load_subregion_municipalities_csv
  csv_text = File.read(Rails.root.join('lib', 'seeds', 'municipalities.csv'))
  csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1')
  csv.each do |row|
    a = SubregionMunicipality.new
    a.municipality_id = Municipality.find_by(name: row[0]).id
    a.subregion_id = row[2]
    a.save
  end
end

def load_projects_csv
  csv_text = File.read(Rails.root.join('lib', 'seeds', 'projects2.csv'))
  csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1')
  csv.each do |row|
    cleaner = CleanerService.new
    a = Project.new
    a.title = row['Name']
    a.image = '/images/project.jpg'
    a.status = cleaner.clean(row['Project Status'])
    a.primary_department = cleaner.clean(row['Lead Department'])
    a.primary_department_css_class = cleaner.snake_case(row['Lead Department'])
    a.start_date = cleaner.clean(row['Start Date'])
    a.end_date = cleaner.clean(row['End Date'])
    a.actual_completion_date = cleaner.clean(row['Actual Completion Date'])
    a.project_manager_last_name = row['Project Manager'].split(',')[0]
    a.project_manager_first_name = row['Project Manager'].split(',')[1]
    a.project_geography = cleaner.clean(row['Project Geography'].downcase)
    a.equity_considerations = cleaner.clean(row['Equity Considerations'])
    a.show_on_website_map = cleaner.clean(row['Show on website Map']) == "Show" ? true : false
    a.client = cleaner.clean(row['Client'])
    a.collaboration_departments = cleaner.clean(row['Collaboration Departments (text)'])
    a.description = cleaner.clean(row['Short Description'])
    a.equity_categories = cleaner.clean(row['Equity categories (text)'])
    a.equity_comment = cleaner.clean(row['Equity Comment'])
    a.equity_impact = cleaner.clean(row['Equity Impact'])
    a.external_partner = cleaner.clean(row['External Partner'])
    a.funding = cleaner.clean(row['Funding'])
    a.location_city = cleaner.clean(row['Location. City'])
    a.location_state = cleaner.clean(row['Location. State'])
    a.location_zip = cleaner.clean(row['Location. Zip'])
    a.mapc_project_num = cleaner.clean(row['MAPC Project #'])
    a.climate_change = cleaner.clean(row['StrPr.Climate Change'])
    a.equity = cleaner.clean(row['StrPr.Equity'])
    a.regional_collaboration = cleaner.clean(row['StrPr.Regional Collaboration'])
    a.smart_growth = cleaner.clean(row['StrPr.Smart Growth'])
    a.website = cleaner.clean(row['Website'])
    a.save
  end
end

def load_project_municipalities_csv
  csv_text = File.read(Rails.root.join('lib', 'seeds', 'municipalities-by-project.csv'))
  csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1')
  csv.each do |row|
    p = Project.find_by(title: row[1])
    project_id = p.id
    m = Municipality.try(:find_by_name, row[7])
    municipality_id = m.id if m

    mp = MunicipalityProject.find_or_create_by(project_id: project_id, municipality_id: municipality_id)
    mp.save
  end
end

def main
  load_subregions_csv
  load_municipalities_csv
  load_subregion_municipalities_csv
  load_projects_csv
  load_project_municipalities_csv
end

main
