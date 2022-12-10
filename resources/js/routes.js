let login = require('./components/auth/login.vue').default;
let register = require('./components/auth/register.vue').default;
let forgot = require('./components/auth/forgot.vue').default;
let logout = require('./components/auth/logout.vue').default;
let home = require('./components/home.vue').default;

let employee_store = require('./components/employees/create.vue').default;
let employees = require('./components/employees/index.vue').default;
let employee_edit = require('./components/employees/edit.vue').default;

let supplier_store = require('./components/suppliers/create.vue').default;
let suppliers = require('./components/suppliers/index.vue').default;
let supplier_edit = require('./components/suppliers/edit.vue').default;

let category_store = require('./components/categories/create.vue').default;
let categories = require('./components/categories/index.vue').default;
let category_edit = require('./components/categories/edit.vue').default;

let product_store = require('./components/products/create.vue').default;
let products = require('./components/products/index.vue').default;
let product_edit = require('./components/products/edit.vue').default;

let expense_store = require('./components/expenses/create.vue').default;
let expenses = require('./components/expenses/index.vue').default;
let expense_edit = require('./components/expenses/edit.vue').default;

let salary_pay = require('./components/salaries/create.vue').default;
let salary_view = require('./components/salaries/view.vue').default;
let salaries = require('./components/salaries/index.vue').default;
let salary_edit = require('./components/salaries/edit.vue').default;
let salary_store = require('./components/salaries/all_employees.vue').default;

let stock = require('./components/products/stock.vue').default;
let stock_edit = require('./components/products/stock_edit.vue').default;

let customer_store = require('./components/customers/create.vue').default;
let customers = require('./components/customers/index.vue').default;
let customer_edit = require('./components/customers/edit.vue').default; 

let pos = require('./components/pos/pointofsale.vue').default;

let extras = require('./components/extras/edit.vue').default;

let order_today = require('./components/orders/order.vue').default;
let orders = require('./components/orders/index.vue').default;
let order_search = require('./components/orders/search.vue').default;
let order_view = require('./components/orders/view.vue').default;

export const routes = [
  { path: '/', component: login, name: '/' },
  { path: '/register', component: register, name: 'register' },
  { path: '/forgot', component: forgot, name: 'forgot' },
  { path: '/logout', component: logout, name: 'logout' },
  { path: '/home', component: home, name: 'home' },

  // Employee routes
  { path: '/employees/store', component: employee_store, name: 'employee-store' },
  { path: '/employees', component: employees, name: 'employees' },
  { path: '/employees/edit/:id', component: employee_edit, name: 'employee-edit' },

  // Supplier routes
  { path: '/suppliers/store', component: supplier_store, name: 'supplier-store' },
  { path: '/suppliers', component: suppliers, name: 'suppliers' },
  { path: '/suppliers/edit/:id', component: supplier_edit, name: 'supplier-edit' },

  // Category Routes
  { path: '/categories/store', component: category_store, name: 'category-store' },
  { path: '/categories', component: categories, name: 'categories' },
  { path: '/categories/edit/:id', component: category_edit, name: 'category-edit' },

  // Product Routes
  { path: '/products/store', component: product_store, name: 'product-store' },
  { path: '/products', component: products, name: 'products' },
  { path: '/products/edit/:id', component: product_edit, name: 'product-edit' },

    // Expense Routes
    { path: '/expenses/store', component: expense_store, name: 'expense-store' },
    { path: '/expenses', component: expenses, name: 'expenses' },
    { path: '/expenses/edit/:id', component: expense_edit, name: 'expense-edit' },
    
    // Salary routes
    { path: '/salaries/store', component: salary_store, name: 'salary-store' },
    { path: '/salaries', component: salaries, name: 'salaries' },
    { path: '/salaries/edit/:id', component: salary_edit, name: 'salary-edit' },
    { path: '/salaries/pay/:id', component: salary_pay, name: 'salary-pay' },
    { path: '/salaries/view/:id', component: salary_view, name: 'salary-view' },

    // Stock route
    { path: '/stock', component: stock, name: 'stock' },
    { path: '/stock/edit/:id', component: stock_edit, name: 'stock-edit' },
    
    // Customer routes
    { path: '/customers/store', component: customer_store, name: 'customer-store' },
    { path: '/customers', component: customers, name: 'customers' },
    { path: '/customers/edit/:id', component: customer_edit, name: 'customer-edit' },

    { path: '/pos', component: pos, name: 'pos' },
      
    { path: '/extras', component: extras, name: 'extras' },
    
    { path: '/orders/today', component: order_today, name: 'order-today' },
    { path: '/orders', component: orders, name: 'orders' },
    { path: '/orders/view/:id', component: order_view, name: 'order-view' },
    { path: '/orders/search/', component: order_search, name: 'order-search' },
]