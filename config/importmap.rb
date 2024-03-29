# frozen_string_literal: true

# Pin npm packages by running ./bin/importmap

pin 'application', preload: true
pin '@hotwired/turbo-rails', to: 'turbo.min.js', preload: true
pin '@hotwired/stimulus', to: 'stimulus.min.js', preload: true
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js', preload: true
pin_all_from 'app/javascript/controllers', under: 'controllers'
pin 'stimulus-reveal-controller', to: 'https://ga.jspm.io/npm:stimulus-reveal-controller@4.0.0/dist/stimulus-reveal-controller.es.js'
pin 'popper', to: 'popper.js', preload: true
pin 'bootstrap', to: 'bootstrap.min.js', preload: true
pin 'chartkick', to: 'chartkick.js'
pin 'Chart.bundle', to: 'Chart.bundle.js'
pin "slim-select", to: "https://ga.jspm.io/npm:slim-select@2.6.0/dist/slimselect.es.js"
