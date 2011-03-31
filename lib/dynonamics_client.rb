class DynonamicsClient
  
  def self.submit_dyno_time(data)
    submit(ENV['DYNONAMICS_DYNO_URL'],data)
  end
  
  def self.submit_worker_time(data)
    submit(ENV['DYNONAMICS_WORKER_URL'],data)
  end
  
  private
    def self.submit(url,data) 
      
      start_submit_time = Time.now.to_f
      
      begin
      
        require 'net/http'
        require 'uri'

        uri = URI.parse(url)
        
        response = Net::HTTP.post_form(uri,data) rescue "ERROR"
        
        print response.body + "\n\n"
      rescue
      end
      
      print "Submission time: " +(Time.now.to_f - start_submit_time).to_s + "\n\n"
    end
  
end