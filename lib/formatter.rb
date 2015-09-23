require 'csv'
require 'pp'
require 'json'


module Formatter
  def self.format(data, type = 'csv')
    if !['csv', 'json', 'pretty_print'].include?(type)
      raise 'Formatter: invalid format'
    end

    self.send(type.to_sym, data)
  end

  private

  def self.csv(data)
    CSV.generate do |csv|
      csv << data.first.to_h.keys

      data.each do |d|
        csv << d.to_h.values
      end
    end
  end

  def self.json(data)
    JSON.generate(data)
  end

end
