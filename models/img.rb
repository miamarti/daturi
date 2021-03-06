require "data-uri"

class Img
  attr_reader :name, :type, :size, :base64

  def initialize(name, type, data)
    @name = name
    @type = type
    @data = data
    @size = (File.size(@data).to_f / 1000).round(1)
    @base64 = toURI
  end

  private
  def toURI
    "data:" + @type + ";base64," + Base64.encode64(@data.read).gsub!(/\s/, "")
  end
end