module Cenit
  module Collection
    require File.expand_path(File.join(*%w[ mandrill build ]), File.dirname(__FILE__))
    require "cenit/client"

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
      Cenit::Client.push(@mandrill.sample_model(model).to_json, config)
    end

    def self.import(data)
      @mandrill.import_data(data)
    end
  end
end