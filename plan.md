- 4 apps (product, checkout, inspire, app-frame)
- product shows all products, product selector
  and consumes checkout (button, basket) and inspire (list)
- checkout exposes button and basket and has checkout page
  with info about product, price and proceed btn (?) and cosumes
  inspire (list).
  Checkout page has no products in basket and fulfilled states
- inspire shows upsales product as a list (no interaction)
- app-frame has sidebar with links to product and checkout pages

EXTRA:
- app-frame doesn't have hardcoded menu items, but downloads config
  from central place (microfrontend app registry). each microfrontend
  app pushes its config to the app registry on build
