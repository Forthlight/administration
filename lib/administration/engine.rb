module Administration
  class Engine < ::Rails::Engine
    isolate_namespace Administration

    # Generators
    config.generators do |g|
       g.test_framework :rspec, :fixture => true, :views => false
       g.fixture_replacement :fabrication
    end
  end
end
