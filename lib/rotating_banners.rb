require 'spree_core'
require 'rotating_banners_hooks'

module RotatingBanners
  class Engine < Rails::Engine

    config.autoload_paths += %W(#{config.root}/lib)

    def self.activate
      # Spree::BaseController.class_eval do
      ProductsController.class_eval do
        helper RotatingBannersHelper
      end
    end

    config.to_prepare &method(:activate).to_proc
  end
end
