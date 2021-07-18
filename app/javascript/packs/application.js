// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require('admin-lte');
global.toastr = require("toastr")

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage";
import "channels";

import 'bootstrap';
import '../stylesheets/application.scss';
import "@fortawesome/fontawesome-free/js/all";

document.addEventListener("turbolinks:load", () => {
    $('[data-toggle="tooltip"]').tooltip()
});

Rails.start()
Turbolinks.start()
ActiveStorage.start()

window.jQuery = $;
window.$ = $;

import 'select2'
import 'select2/dist/css/select2.css'

window.addEventListener('DOMContentLoaded', () => {
    $('.select2').select2();
})

