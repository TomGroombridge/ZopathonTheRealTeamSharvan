class PostcodeFinder

	attr_reader :postcode

	def initialize postcode
    @postcode = postcode
  end

  def call
  	response = HTTParty.get("http://api.postcodes.io/postcodes/#{@postcode.gsub(/\s+/, '')}")

  	@body = response['result']
  end

end
