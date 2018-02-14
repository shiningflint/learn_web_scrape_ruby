require 'httparty'
require 'nokogiri'

# RESOURCE RELATED
def get_from_file
  File.read("sample-file.txt")
end

def get_resource(url = "")
  if url == ""
    get_from_file()
  else
    HTTParty.get(url, verify: false)
  end
end

# NOKOGIRI RELATED
def get_jpy_jual(htmlResource)
  nokogiriObject = Nokogiri::HTML(htmlResource)
  theElement = nokogiriObject.css("table.table > tbody > tr:nth-child(12) > td:nth-child(2)")
  theElement.children
end

# START THE PROGRAM
def init
  # url = "https://www.bca.co.id/id/Individu/Sarana/Kurs-dan-Suku-Bunga/Kurs-dan-Kalkulator"
  url = ""

  htmlResource = get_resource(url)
  goodStuff = get_jpy_jual(htmlResource)
  puts goodStuff
end

init
