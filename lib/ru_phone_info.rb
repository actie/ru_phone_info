require "ru_phone_info/version"
require "ru_phone_info/regions"
require "csv"

module RuPhoneInfo
  def self.get phone
    phone = prepare_phone phone
    code = get_code phone
    number = get_number phone
    result = mobile_phones.find { |row| row[0]==code && number >= row[1].to_i && number.to_i <= row[2].to_i }
    if result
      {
        code: result[0],
        begin: result[1],
        end: result[2],
        capacity: result[3],
        operator: result[4],
        region: result[5],
        region_code: get_region_code(result[5])
      }
    else
      nil
    end
  end

  def self.mobile_phones
    data = File.read("#{File.dirname(__FILE__)}/ru_phone_info/data/Kody_DEF-9kh.csv")

    files_content = data.force_encoding("cp1251").encode("utf-8")
    files_content.gsub!("\t", '').gsub!("\r", '').gsub!('"', '')

    CSV.parse(files_content, col_sep: ";", row_sep: "\n", skip_blanks: true)
  end

#  private

  def self.get_number phone
    phone[-7, 11].to_i
  end

  def self.get_code phone
    phone[-10, 3]
  end

  def self.prepare_phone phone
    phone.gsub(/[^\d]/, '')
  end

  def self.get_region_code region_name
    words = self.prepare_string region_name
    all_regions.map do |region|
      region_words = self.prepare_string(region[:name])
      return region[:code] unless (words & region_words).empty?
    end
  end

  def self.prepare_string string
    words = string.downcase.scan(/[[:word:]]+/)
    words - STOP_WORDS
  end

  def self.all_regions
    REGIONS.map { |code, name| { code: code, name: name } }
  end
end
