require 'csv'

def total_var(args)
  arr = ""
  for i in args
    arr << i.to_s + " " if !i.nil?
  end
  return arr
end

def geocode_address(address)
  return {
    latitude:  (x = Geocoder.search(address)[0].latitude).present? ? x.to_f : nil,
    longitude: (x = Geocoder.search(address)[0].longitude).present? ? x.to_f : nil
  }
end

files = {
  students: 'db/data/fz21_student_address_201680.csv',
  high_schools: 'db/data/fz21_student_high_schools_201680.csv'
}

columns = {
  students: {
    banner: 'UNM_BANNER_ID',
    ipeds: 'IPEDS_VALUES_DESC',
    citizenship: 'NATION_OF_CITIZENSHIP_DESC',
    street_line1: 'STREET_LINE1',
    street_line2: 'STREET_LINE2',
    street_line3: 'STREET_LINE3',
    city: 'CITY',
    postal_code: 'POSTAL_CODE',
    nation: 'NATION_DESC'
  },
  high_schools: {
    banner: 'UNM_BANNER_ID',
    act_code: 'HED_HIGH_SCHOOL_CODE',
    institution_name: 'INSTITUTION_NAME',
    street_line1: 'STREET_LINE1',
    street_line2: 'STREET_LINE2',
    street_line3: 'STREET_LINE3',
    city: 'CITY',
    state: 'STATE_PROVINCE'
  }
}

CSV.foreach(files[:students]) do |s|
  student = Student.create(
    banner: s[0],
    address: total_var(s[3..7])
  )
end
