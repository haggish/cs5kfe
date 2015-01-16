'use strict'

# Declare app level module which depends on filters, and services
App = angular.module('CS5k', [
  'ngCookies'
  'ngResource'
  'ngRoute'
  'ui.bootstrap'
  'app.controllers'
  'app.directives'
  'app.filters'
  'app.services'
  'partials'
])

App.config([
  '$routeProvider'
  '$locationProvider'

  ($routeProvider, $locationProvider, config) ->
    $routeProvider

    .when('/CODES',
      {templateUrl: '/partials/partial1.html', controller: 'Controller'})
    .when('/INFO', {templateUrl: '/partials/partial2.html'})

    # Catch all
    .otherwise({redirectTo: '/CODES'})

    # Without server side support html5 must be disabled.
    $locationProvider.html5Mode(false)
])
