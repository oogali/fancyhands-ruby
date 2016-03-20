require "oauth"
class Request

  def initialize(key, secret, test, url)
    @url = url
    @test = test
    @consumer = OAuth::Consumer.new(key, secret)
  end  

  def post(piece, data="")
    if @test
      data[:test] = @test
    end
    response = @consumer.request(:post, @url + piece, nil, {}, data)
    return JSON.parse(response.body)
  end

  def delete(piece, data="")
    if data
      uri = Addressable::URI.new
      uri.query_values = data
      data = uri.query
    end
    full = @url + piece + "?" + data
    response = @consumer.request(:delete, full)
    return JSON.parse(response.body)
  end

  def put(piece, data="")
    # {'Content-Type' => 'application/x-www-form-urlencoded'}
    if @test
      data[:test] = @test
    end    
    response = @consumer.request(:put, @url + piece, nil, {}, data)    
    return JSON.parse(response.body)
  end

  def get(piece, data="")
    if @test
      data[:test] = @test
    end    
    if data
      uri = Addressable::URI.new
      uri.query_values = data
      data = uri.query
    end    
    full = @url + piece + "?" + data
    response = @consumer.request(:get, full)
    return JSON.parse(response.body)
  end

end
