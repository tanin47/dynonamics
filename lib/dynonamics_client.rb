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
    
      begin
      
        require 'net/http'
        require 'uri'

        uri = URI.parse(url)
        
        response = Net::HTTP.post_form(uri,data)

      rescue Exception=>e
        print "Dynonamics error: #{e.to_s_with_trace}"
      end
      
    end
  
end