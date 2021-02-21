# Microfrontends example powered by [Webpack Module Federation](https://webpack.js.org/concepts/module-federation/)
Implementation of a microfrontend application taken from [micro-frontend.org](https://micro-frontends.org/).
Application consists of AppFrame, Product App, Checkout App and Inspire App.
- [AppFrame](https://github.com/SergeyPoluektov/mf-app-frame) (Svelte + Navaid) consists of a sidebar with navigation menu. The AppFrame consumes Product App and Checkout App and render one of these apps accordingly to an URL.
- [Inspire App](https://github.com/SergeyPoluektov/mf-inspire) (Vue) exposes a list of related products. The Inspire App listens to `product:selected` custom event and change the list of related products accordingly.
- [Checkout App](https://github.com/SergeyPoluektov/mf-checkout) (React + Redux + React-Router) exposes a checkout page, buy button and basket link. The checkout page renders items added to basket as a list with total price. The Buy button listens to `product:selected` custom event and shows price of the selected item. The Basket link renders a link to the checkout page and shows amount of items added to basket.
- [Product App](https://github.com/SergeyPoluektov/mf-product) (Svelte + Navaid) renders a list of available products and info about selected product. The Product App consumes a Buy Button and Basket link from the Checkout App, and list of related products from Inspire App. The Product App render consumed components accordingly to its own layout.

## How to run
### Requirements
- [Node 12+](https://nodejs.org/)
- [Docker Compose 17.06.0+](https://docs.docker.com/compose/)
- [GNU Make 4.0+](https://www.gnu.org/software/make/)

### Run
Clone this repository with `--recurse-submodules` to automatically initialize and update each submodule in the repository:
```sh
git clone --recurse-submodules git@github.com:SergeyPoluektov/mf-examples.git
```
Go into the directory where you cloned the repository:
```sh
cd mf-examples
```
Run make to build all apps:
```sh
make
```
Run all apps by starting containers with docker-compose:
```sh
docker-compose up
```

Now you can go to `http://localhost:8080` to open the AppFrame (combined application). Other applications are listen on:
- `http://localhost:8081` - Inspire App
- `http://localhost:8082` - Checkout App
- `http://localhost:8083` - Product App
