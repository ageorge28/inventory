/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter);

// Import routes
import { routes } from './routes';

// Import User class
import User from './helpers/User'
window.User = User

// Import Notification class
import Notification from './helpers/Notification'
window.Notification = Notification

// Sweet Alert
import Swal from 'sweetalert2'
window.Swal = Swal;

const Toast = Swal.mixin({
    toast: true,
    position: 'top-end',
    showConfirmButton: false,
    timer: 3000,
    timerProgressBar: true,
    didOpen: (toast) => {
        toast.addEventListener('mouseenter', Swal.stopTimer)
        toast.addEventListener('mouseleave', Swal.resumeTimer)
    }
});

window.Toast = Toast

window.Reload = new Vue();

const router = new VueRouter({
    routes,
    mode: 'history',
    base: 'inventory',
})

const app = new Vue({
    el: '#app',
    router
});

import moment from 'moment';

Vue.filter('formatDate', function(value) {
    if (value) {
        return moment(String(value)).format('DD/MM/YYYY')
    }
});

