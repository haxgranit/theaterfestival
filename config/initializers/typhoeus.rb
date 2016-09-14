require "faraday"
require "typhoeus/adapters/faraday"
Ethon.logger = Logger.new("/dev/null")
Searchkick.client = Elasticsearch::Client.new(hosts: ["elasticsearch:9200", "elasticsearch:9201"], retry_on_failure: true)
