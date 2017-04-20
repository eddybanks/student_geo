require 'csv'

def total_var(args)
  arr = ""
  for i in args
    arr << i.to_s + " " if !i.nil?
  end
  return arr
end

@unm_geocode = Geocoder.search('University of New Mexico')[0].coordinates

def distance_to_unm(address)
  Geocoder::Calculations.distance_between(Geocoder.search(address)[0].coordinates, @unm_geocode)
end

def distance_to_unm_coord(coordinates)
  Geocoder::Calculations.distance_between(coordinates, @unm_geocode)
end

def geocode_address(address)
  return {
    latitude:  (x = Geocoder.search(address)[0].latitude).present? ? x.to_f : nil,
    longitude: (x = Geocoder.search(address)[0].longitude).present? ? x.to_f : nil
  }
end

files = {
  students: 'db/data/student_addresses_201680_geocodio.csv',
  high_schools: 'db/data/student_high_schools_201680_geocodio.csv'
}

columns =  JSON.parse(File.open('db/data/csv_defs.json').read)


CSV.foreach(files[:students], { headers: true }) do |s|
  student = Student.create(
    banner: (x = s[columns["students"]["banner"][1]]).nil? ? nil : x,
    # date_of_birth: (x = s[columns["students"]["date_of_birth"][1]]).nil? ? nil : x,
    street_line1: (x = s[columns["students"]["ma_street_line1"][0]]).nil? ? nil : x,
    street_line2: (x = s[columns["students"]["ma_street_line2"][0]]).nil? ? nil : x,
    street_line3: (x = s[columns["students"]["ma_street_line3"][0]]).nil? ? nil : x,
    postal_code: (x = s[columns["students"]["ma_postal_code"][0]]).nil? ? nil : x,
    latitude: (x = s[columns["students"]["latitude"][0]]).nil? ? nil : x,
    longitude: (x = s[columns["students"]["longitude"][0]]).nil? ? nil : x,
    distance_to_unm: (x = distance_to_unm_coord([s[columns["students"]["latitude"][0]],
                          s[columns["students"]["longitude"][0]]]))
  )
end

CSV.foreach(files[:high_schools], { headers: true }) do |h|
  high_school = HighSchool.create(
    name: (x = h[columns["high_schools"]["institution_name"][0]]).nil? ? nil : x,
    act_code: (x = h[columns["high_schools"]["act_code"][0]]).nil? ? nil : x,
    street_line1: (x = h[columns["high_schools"]["street_line1"][0]]).nil? ? nil : x,
    street_line2: (x = h[columns["high_schools"]["street_line2"][0]]).nil? ? nil : x,
    street_line3: (x = h[columns["high_schools"]["street_line3"][0]]).nil? ? nil : x,
    latitude: (x = h[columns["high_schools"]["latitude"][0]]).nil? ? nil : x,
    longitude: (x = h[columns["high_schools"]["longitude"][0]]).nil? ? nil : x,
    distance_to_unm: (x = distance_to_unm_coord([h[columns["high_schools"]["latitude"][0]],
                          h[columns["high_schools"]["longitude"][0]]]))
  )
end
