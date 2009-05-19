# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  include AuthenticatedSystem

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  def call_rake(task, options = {})
    options[:rails_env] ||= RAILS_ENV
    args = options.map do |n,v|
      if n.to_s.upcase == "RESULTATS"
        "#{n.to_s.upcase}='[#{v.join(", ")}]'"
      else
       "#{n.to_s.upcase}='#{v}'"
      end
    end
    
    system "/usr/bin/rake #{task} #{args.join(' ')} --trace 2>&1 >> #{RAILS_ROOT}/log/rake.log &"
    # system "usr/local/bin/rake #{task} #{args.join(' ')} --trace 2>&1 >> #{RAILS_ROOT}/log/rake.log &"
  end
end
