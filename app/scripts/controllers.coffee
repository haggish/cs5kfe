'use strict'

### Controllers ###

angular.module('app.controllers', [])

.controller('AppCtrl', [
    '$scope'
    '$location'
    '$resource'
    '$rootScope'

    ($scope, $location, $resource, $rootScope) ->

      # Uses the url to determine if the selected
      # menu item should have the class active.
      $scope.$location = $location
      $scope.$watch('$location.path()', (path) ->
        $scope.activeNavId = path || '/'
      )

      # getClass compares the current url with the id.
      # If the current url starts with the id it returns 'active'
      # otherwise it will return '' an empty string. E.g.
      #
      #   # current url = '/products/1'
      #   getClass('/products') # returns 'active'
      #   getClass('/orders') # returns ''
      #
      $scope.getClass = (id) ->
        if $scope.activeNavId.substring(0, id.length) == id
          return 'active'
        else
          return ''
  ])

.controller('Container', [
    '$scope'

    ($scope) ->
      $scope.tabs = ['CODES', 'INFO']

      $scope.selectedTab = 'CODES'

      $scope.select = (tab) ->
        $scope.selectedTab = tab
  ])

.controller('Controller', [
    '$scope'

    ($scope) ->
      $scope.codesets = [
        id: 'CS01'
        name: 'Code set number one'
        description: 'Some kind of code set'
        codes: [
          id: 'CODE01'
          name: 'Code number one'
          description: 'Some kind of code'
          values: [
            value: 'x'
          ,
            value: 'y'
          ]
        ,
          id: 'CODE02'
          name: 'Code number two'
          description: 'Some other kind of code'
          values: [
            value: 'z'
          ]
        ]
      ,
        id: 'CS02'
        name: 'Code set number two'
        description: 'Some other kind of code set'
        codes: [
          id: 'CODE03'
          name: 'Code number three'
          description: 'Yet another kind of code'
        ]
      ]

      $scope.newCodeset =
        id: 'New code set ID'
        name: 'New code set name'
        description: 'New code set description'
        codes: []

      $scope.newCode =
        id: 'New code ID'
        name: 'New code name'
        description: 'New code description'
        values: []

      $scope.selectCodeset = (scs) ->
        $scope.selectedCodeset = scs
        $scope.selectedCode = undefined

      $scope.selectCode = (sc) ->
        $scope.selectedCode = sc

      $scope.addCodeset = () ->
        $scope.selectedCodeset = angular.copy($scope.newCodeset)
        $scope.codesets.unshift $scope.selectedCodeset
        $scope.selectedCode = undefined
        $scope.newCodeset.id = 'New code set ID'

      $scope.addCode = () ->
        $scope.selectedCode = angular.copy($scope.newCode)
        $scope.selectedCodeset.codes.unshift $scope.selectedCode
        $scope.newCode.id = 'New code ID'

      $scope.removeCodeset = (cs) ->
        # clearing the children to update the UI - removed is always selected
        $scope.selectedCode?.values?.length = 0
        $scope.selectedCodeset?.codes?.length = 0
        remove(cs, $scope.codesets)

      $scope.removeCode = (c) ->
        # clearing the children to update the UI - removed is always selected
        $scope.selectedCode?.values?.length = 0
        remove(c, $scope.selectedCodeset.codes)

      remove = (x, arr) ->
        idxOfX = arr.indexOf(x)
        arr.splice(idxOfX, 1)

  ])

.controller('MyCtrl1', [
    '$scope'

    ($scope) ->
      $scope.onePlusOne = 2
  ])

.controller('MyCtrl2', [
    '$scope'

    ($scope) ->
      $scope
  ])

.controller('TodoCtrl', [
    '$scope'

    ($scope) ->
      $scope.todos = [
        text: "learn angular"
        done: true
      ,
        text: "build an angular app"
        done: false
      ]

      $scope.addTodo = ->
        $scope.todos.push
          text: $scope.todoText
          done: false

        $scope.todoText = ""

      $scope.remaining = ->
        count = 0
        angular.forEach $scope.todos, (todo) ->
          count += (if todo.done then 0 else 1)

        count

      $scope.archive = ->
        oldTodos = $scope.todos
        $scope.todos = []
        angular.forEach oldTodos, (todo) ->
          $scope.todos.push todo  unless todo.done

  ])

