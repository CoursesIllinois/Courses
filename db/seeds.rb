# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

def ParseSemester(year, season)

  # Initialize
  Major.delete_all
  Course.delete_all
  Section.delete_all

  # for the loops (they are mostly hash iterators) ,  k stands for key and v stand for value

  # Build the URLs
  # ex: semester = "2011/spring"
  semester = year + "/" + season
  base_url = "http://courses.illinois.edu/cis/" + semester 
  url = base_url + "/schedule/index.xml"

  # Grab the response from the URL as a string
  xml_data = Net::HTTP.get_response(URI.parse(url)).body

  # Turn the string into a hash of data 
  catalog = XmlSimple.xml_in(xml_data)

  # Iterate through the subjects found in the hash
  catalog['subject'].each do |subject|

    puts "-------\nSubject\n-------\n"

    # Add the subject/major to the database
    currentMajor = Major.create(:phone => subject['phone'][0].delete("-").to_i,
        :webSiteAddress => subject['webSiteAddress'][0],
        :address2 => subject['address2'][0],
        :contact => subject['contact'][0],
        :contactTitle => subject['contactTitle'][0],
        :subjectDescription => subject['subjectDescription'][0],
        :subjectCode => subject['subjectCode'][0],
        :unitName => subject['unitName'][0]
        )

    # Build a url based off of the current subject code
    subjectURL = base_url + "/schedule/" + subject['subjectCode'][0] + "/index.xml"

    # Fetch the courses for the subject and decrypt the data from the url
    subjectXML_data = Net::HTTP.get_response(URI.parse(subjectURL)).body
    subjectCourses = XmlSimple.xml_in(subjectXML_data)['course']

    # Iterate through the courses offered in the class 
    subjectCourses.each do |course|
      currentCourse = currentMajor.courses.create(
          :courseNumber => course['courseNumber'][0].to_i,
          :hours => course['hours'][0],
          :description => course['description'][0],
          :title => course['title'][0],
          :subjectCode => course['subjectCode'][0],
          :subjectId => course['subjectId'][0].to_i
          )

      puts currentCourse.title

      courseSections = course['section']
      courseSections.each do |section|
        currentSection = currentCourse.sections.create(
            :room => section['roomNumber'][0].to_i,
            :days => section['days'][0],
            :referenceNumber => section['referenceNumber'][0].to_i,
            :notes => section['sectionNotes'][0],
            :type => section['sectionType'][0],
            :instructor => section['instructor'][0],
            :startTime => Time.parse(section['startTime'][0]),
            :endTime => Time.parse(section['endTime'][0]),
            :building => section['building'][0],
            :sectionId => section['sectionId'][0]
            )
      end
    end
  end
end

ParseSemester( '2011', 'spring' )
