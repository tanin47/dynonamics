class DynonamicsClient
  
  def self.submit_dyno_time(data)
    if ENV['DYNONAMICS_DYNO_URL']
      submit(ENV['DYNONAMICS_DYNO_URL'],data)
    end
  end
  
  def self.submit_worker_time(data)
    if ENV['DYNONAMICS_WORKER_URL']
      submit(ENV['DYNONAMICS_WORKER_URL'],data)
    end
  end
  
  private
    def self.submit(url,data) 
      
      puts "Dynonamics submit data to #{url} and data=#{data.inspect}" if ENV['DYNONAMICS_DEBUG']
      
      begin
      
        require 'net/http'
        require 'uri'

        uri = URI.parse(url)
        
        response = Net::HTTP.post_form(uri,data)

      rescue Exception=>e
        puts "Dynonamics error: #{e}\n" if ENV['DYNONAMICS_DEBUG']
      end
      
    end
  
end