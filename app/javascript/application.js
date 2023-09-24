// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"

import "alpinejs"
import "flowbite/dist/flowbite.turbo.js";

import "./plugins/focus-trap"
import "./plugins/init-alpine"

document.addEventListener("turbo:load", () => {
  console.log('Hello!')
});
