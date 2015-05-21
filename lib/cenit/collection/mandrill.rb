require "cenit/collection/mandrill/version"

module Cenit
  module Collection
    require "cenit/collection/mandrill/build"
    require "cenit/client"

    # bundle exec irb -I lib -r 'cenit/collection/mandrill'
    # config = {:push_url => "https://www.cenithub.com/api/v1/push", :connection_token => "My Conn Token", :connection_key => "My Conn Key"}
    # config = {:push_url => "https://www.cenithub.com/api/v1/push", :user_token => "My User Token", :user_key => "My User Key"}
    # Cenit::Collection::Mandrill.push_collection config
    # Cenit::Collection::Mandrill.shared_collection

    @mandrill = Cenit::Collection::Mandrill::Build.new

    # Include Collection Gem dependency
    # require "cenit/collection/[My Dependency Collection]/build"
    # Collection dependency
    # @mandrill.register_dep(Cenit::Collection::[My Dependency Collection]::Build.new)

    def self.push_collection (config)
      Cenit::Client.push(@mandrill.shared_collection.to_json, config)
    end

    def self.show_collection
      @mandrill.shared_collection
    end

    def self.pull_collection (parameters,config)
      @mandrill.shared_collection
    end

    def self.push_sample(model, config)
      Cenit::Client.push(@mandrill.sample_data(model).to_json, config)
    end
  end
end