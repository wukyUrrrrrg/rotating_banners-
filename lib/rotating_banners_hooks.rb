class RotatingBannersHooks < Spree::ThemeSupport::HookListener
  insert_after :product_taxons,  'shared/rotating_banners'
  # custom hooks go here
end
