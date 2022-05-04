require 'aws-sdk'

class SubspaceUpdater
  def initialize(request)
    @request = request
  end

  def update
    conn = Aws::Route53::Client.new

    opts = {
      hosted_zone_id: ENV['ZONE_ID'],
      change_batch: {
        changes: [
          {
            action: "UPSERT",
            resource_record_set: {
              name: ENV['RECORD_NAME'],
              type: "A",
              ttl: 60,
              resource_records: [
                { value: @request.ip }
              ]
            }
          }
        ]
      }
    }
    begin
      resp = conn.change_resource_record_sets(opts)
    rescue Aws::Errors::ServiceError => e
      STDERR.puts e
    end
  end
end

