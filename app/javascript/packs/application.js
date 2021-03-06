// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
ActiveStorage.start()

import "bootstrap";
import "underscore";
import Gmaps from "./gmaps_google";
import '../stylesheets/application'
//import '../packs/question'
import './selectize';
window.jQuery = $;
window.$ = $;


console.log("Hello from app/javascript/packs/application.js")

//using webpack to compile all of our assets 
