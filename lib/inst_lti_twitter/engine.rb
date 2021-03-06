module InstLtiTwitter
  class Engine < ::Rails::Engine
    isolate_namespace InstLtiTwitter

    initializer "lti_provider.load_app_instance_data" do |app|
      InstLtiTwitter.setup do |config|
        config.app_root = app.root
      end
    end

    initializer "lti_provider.lti_config" do |app|
      InstLtiTwitter::InstLtiTwitterConfig.setup!
    end

    config.generators do |g|
      g.test_framework :rspec
      g.assets false
      g.helper false
    end
  end
end
