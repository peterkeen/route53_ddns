require 'aws-sdk'
require 'pp'

class SubspaceUpdater
  def initialize(request)
    @request = request
  end

  def update
    conn = Aws::Route53::Client.new
    raise @request.ip

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
      pp resp
    rescue Aws::Errors::ServiceError => e
      pp e.message
    end
  end
end

