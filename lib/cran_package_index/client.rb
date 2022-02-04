require "faraday"
require "faraday_middleware"
require 'ostruct'
require 'json'


module CranPackageIndex
    class Client
        BASE_URL = "https://cran.r-project.org/src/contrib/"
        attr_accessor :adapter
        def initialize(adapter: Faraday.default_adapter)
            @adapter = adapter
        end

        def connection
            @connection ||= Faraday.new do |conn|
                conn.url_prefix = BASE_URL
                conn.request :json
                conn.response :json, content_type: "application/json"
                conn.adapter adapter
            end
        end

        def get
            result = connection.get("PACKAGES").body
            packages = result.split("\n").select{ |item|item.include? "Package:"}
            versions = result.split("\n").select{ |item|item.include? "Version:"}
            size = packages.length()
            @all_pacakge_version = Hash.new "initial"
            for i in 0..size do 
                if (packages[i].nil?) == false
                    pack = packages[i]
                    pack["Package:"] = " "
                    vers = versions[i]
                    vers["Version:"] = ""

                    @all_pacakge_version["#{pack.strip}"] = "#{BASE_URL}#{pack.strip}_#{vers.strip}.tar.gz"
                end
            end
            return @all_pacakge_version
        end

        def inspect
            "#<CranPackageIndex::Client>"
        end
    end
end