require "ru_phone_info/version"
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
        region: result[5]
      }
    else
      nil
    end
  end

  private

  def self.mobile_phones
    data = File.read("#{File.dirname(__FILE__)}/ru_phone_info/data/Kody_DEF-9kh.csv")

    files_content = data.force_encoding("cp1251").encode("utf-8")
    files_content.gsub!("\t", '').gsub!("\r", '').gsub!('"', '')

    CSV.parse(files_content, col_sep: ";", row_sep: "\n", skip_blanks: true)
  end

  def self.get_number phone
    phone[-7, 11].to_i
  end

  def self.get_code phone
    phone[-10, 3]
  end

  def self.prepare_phone phone
    phone.gsub(/[^\d]/, '')
  end
end
