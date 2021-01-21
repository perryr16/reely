class StreamingResults
  def initialize()
    @service = GoWatchService.new
  end

  def streaming_data(imdb_id)
    results = @service.get_streaming_data(imdb_id)
    results[:offers].map { |offer| {provider: offer[:provider], price: offer[:price], url: offer[:url]}}
  end
end