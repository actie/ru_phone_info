require 'spec_helper'

describe RuPhoneInfo do
  it 'has a version number' do
    expect(RuPhoneInfo::VERSION).not_to be nil
  end

  it 'can`t find invalid phone' do
    subject = RuPhoneInfo.get('99999')
    expect(subject).to be nil
  end

  it 'rostelecom single number' do
    subject = RuPhoneInfo.get('9012653475')
    expect(subject[:region]).to eq 'Пермский край'
    expect(subject[:operator]).to eq 'ОАО Ростелеком'
    expect(subject[:region_code]).to eq 'PER'
  end

  it 'find my phone' do
    subject = RuPhoneInfo.get('89891676438')
    expect(subject[:region]).to eq 'Краснодарский край'
    expect(subject[:operator]).to eq 'ОАО Мобильные ТелеСистемы'
    expect(subject[:region_code]).to eq 'KDA'
  end

  it 'find other phone' do
    subject = RuPhoneInfo.get('+7 909 444 45 13')
    expect(subject[:region]).to eq 'Краснодарский край'
    expect(subject[:operator]).to eq 'ОАО Вымпел-Коммуникации'
    expect(subject[:region_code]).to eq 'KDA'
  end

  it 'find phone with 8' do
    expect(RuPhoneInfo.get('89891676438')).not_to be nil
  end

  it 'find phone with +7' do
    expect(RuPhoneInfo.get('89891676438')).not_to be nil
  end

  it 'find phone with spaces and brackets' do
    expect(RuPhoneInfo.get('+7 (989) 167 64 38')).not_to be nil
  end

  it 'for any phone can be finded region code' do
    RuPhoneInfo.mobile_phones.map do |row|
      subject = RuPhoneInfo.get_region_code(row[5])
      expect(subject).not_to be nil
    end
  end
end
