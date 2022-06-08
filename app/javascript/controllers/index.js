// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import HelloController from "./hello_controller.js"
application.register("hello", HelloController)

import MapController from "./map_controller.js"
application.register("map", MapController)

import DashboardController from "./dashboard_controller.js"
application.register("dashboard", DashboardController)

import AnimateController from "./animate_controller.js"
application.register("animate", AnimateController)
