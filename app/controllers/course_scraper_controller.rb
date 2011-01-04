class CourseScraperController < ApplicationController
require 'rubygems'
require 'xmlsimple'

def ParseSemester(year, season)
  
  # Initialize
  Major.delete_all
  Course.delete_all
  Section.delete_all
  
	# for the loops (they are mostly hash iterators) ,  k stands for key and v stand for value

	# Build the URLs
    # ex:	semester = "2011/spring"
	semester = year + "/" + season
	base_url = "http://courses.illinois.edu/cis/" + semester 
	url = base_url + "/schedule/index.xml"

	# Grab the response from the URL as a string
	xml_data = Net::HTTP.get_response(URI.parse(url)).body

	# Turn the string into a hash of data 
	catalog = XmlSimple.xml_in(xml_data)

	# Iterate through the subjects found in the hash
	catalog['subject'].each do |subject|
		print "-------\nSubject\n-------\n\n"


    
    # Add the subject to the database
    currentMajor = Major.create(:phone => subject['phone'].to_s.delete("-").to_i,
              :webSiteAddress => subject['webSiteAddress'].to_s,
              :address2 => subject['address2'].to_s,
              :contact => subject['contact'].to_s,
              :contactTitle => subject['contactTitle'].to_s,
              :subjectDescription => subject['subjectDescription'].to_s,
              :subjectCode => subject['subjectCode'].to_s,
              :unitName => subject['unitName'].to_s
    )

		# Build a url based off of the current subject code
		subjectURL = base_url + "/schedule/" + subject['subjectCode'].to_s + "/index.xml"
		
		# Fetch the courses for the subject and decrypt the data from the url
		subjectXML_data = Net::HTTP.get_response(URI.parse(subjectURL)).body
		subjectCourses = XmlSimple.xml_in(subjectXML_data)	

		# Iterate through the courses offered in the class 
		subjectCourses['subject'][0].each do |k, v|
			# Found a course tag, get all the information about the course
			if k == "course"
				v.each do |course|
					#print "-------\nCourse START\n-------\n\n"
					
				  currentCourse = currentMajor.courses.create(
					  :courseNumber => course['courseNumber'].to_s.to_i,
					  :hours => course['hours'],
					  :description => course['description'],
					  :title => course['title'],
					  :subjectCode => course['subjectCode'],
					  :subjectId => course['subjectId'].to_s.to_i
					)
					puts course['title']
					course.each do |k, v|
						if k == "section"
							#print "-------\nSection\n-------\n\n"
							v.each do |section|
					      
							  currentSection = currentCourse.sections.create(
							    :room => section['roomNumber'].to_s.to_i,
							    :days => section['days'],
							    :referenceNumber => section['referenceNumber'].to_s.to_i,
							    :notes => section['sectionNotes'],
							    :type => section['sectionType'],
							    :instructor => section['instructor'],
							    :startTime => Time.parse(section['startTime'].to_s),
							    :endTime => Time.parse(section['endTime'].to_s),
							    :building => section['building'],
							    :sectionId => section['sectionId'].to_s
							  )
								section.each do |k, v|
									#print "\t\t\t<" + k + ">"+ v.to_s + "</"+ k+ ">\n"
								end
							end
							#print "-------\nSection END\n-------\n\n"
						else
							#print "\t\t<" + k + ">"+ v.to_s + "</"+ k+ ">\n"
						end
					end
					#print "-------\nCourse END\n-------\n\n"
				end
			end
		end
=begin
		puts "Phone: " + subject['phone'].to_s
		puts "webSiteAddress: " + subject['webSiteAddress'].to_s
		puts "address2: " + subject['address2'].to_s
		puts "contact: " + subject['contact'].to_s
		puts "contactTitle: " + subject['contactTitle'].to_s
		puts "subjectDescription: " + subject['subjectDescription'].to_s
		puts "subjectCode: " + subject['subjectCode'].to_s
		puts "unitName: " + subject['unitName'].to_s


		# iterate through the elements of the subject 
		# -General information about each subject/major
		subject.each do |k,v|
			#print "<" + k + ">"+ v.to_s + "</"+ k+ ">\n"
		end
=end
		print "\n"
	#	puts subject['subjectCode']
	end
end

	def scrape
		flash[:notice] = "Scraping!"	
		@semester = params[:semester]
		@year = params[:year]
		ParseSemester( @year, @semester )
	end

end
