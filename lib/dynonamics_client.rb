class DynonamicsClient
  
  
  def self.url
    if ENV['DYNONAMICS_STAGING']
      return ENV['DYNONAMICS_STAGING_DYNO_URL']
    else
      return ENV['DYNONAMICS_DYNO_URL']
    end
  end
  
  def self.submit_dyno_time(data)
    
    
    if url
      submit(url,data)
    end
  end
  
  def self.submit_worker_time(data)
    if url
      submit(url,data)
    end
  end
  
  private
    def self.submit(url,data) 
      
      puts "Dynonamics submit data to #{url} and data=#{data.inspect}" if ENV['DYNONAMICS_DEBUG']
      
      begin
      
        require 'net/http'
        require 'uri'
    
        Net::HTTP.version_1_2
        
        nvp = []
        data.each { |k,v|
          k ||= ""
          v ||= ""
          
          nvp.push("#{CGI.escape(k.to_s)}=#{CGI.escape(v.to_s)}")
        }
        nvp = nvp.join('&')
    
        parsed_url = URI.parse(url)
    
        http = Net::HTTP.new(parsed_url.host,parsed_url.port)
        http.read_timeout = 10
        response = http.post(parsed_url.path,nvp)
        
        return "#{response.inspect}"
        
      rescue Exception=>e
        return "#{e} #{e.backtrace.join("\n")}"
      end
      
    end
  
end