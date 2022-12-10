<template>
  <div>
    <!-- Container Fluid-->
    <div class="container-fluid" id="container-wrapper">
      <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">POS Dashboard</h1>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="./">Home</a></li>
          <li class="breadcrumb-item active" aria-current="page">POS</li>
        </ol>
      </div>

      <div class="row">
        <!-- Area Chart -->
        <div class="col-xl-5 col-lg-5">
          <div class="card mb-4">
            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                <h6 class="m-0 font-weight-bold text-primary">Expense Insert</h6>
                <a class="btn btn-sm btn-info" href="" style="color:white">Add Customer</a>
            </div>

                <div class="table-responsive" style="font-size:12px">
                  <table class="table align-items-center table-flush">
                    <thead class="thead-light">
                      <tr>
                        <th>Name</th>
                        <th>Quantity</th>
                        <th>Unit</th>
                        <th>Total</th>
                        <th>Action</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr v-for="cart in carts" :key="cart.id">
                        <td>{{ cart.product_name }}</td>
                        <td>
                          <input id="quantity" name="quantity" type="number" readonly style="width:25px" :value="cart.product_quantity" />
                          <button @click.prevent="increment(cart.id)" class="btn btn-success">+</button>  
                          <button @click.prevent="decrement(cart.id)" v-if="cart.product_quantity >= 2" class="btn btn-danger">-</button>  
                          <button @click.prevent="decrement(cart.id)" v-else class="btn btn-danger" disabled>-</button>  
                        </td>
                        <td>{{ cart.product_price }}</td>
                        <td>{{ cart.subtotal }}</td>
                        <td><a @click="removeFromCart(cart.id)" class="btn btn-sm btn-primary" style="color:white">X</a></td>
                      </tr>
                    </tbody>
                  </table>
                </div>
                <div class="card-footer">
                    <ul class="list-group">
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            Total Quantity: 
                            <strong>{{ totalQuantity }}</strong>
                        </li>
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            Sub Total: 
                            <strong>{{ totalSubTotal }} $</strong>
                        </li>
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            VAT: 
                            <strong>{{ vats.vat }} %</strong>
                        </li>
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            Total Amount: 
                            <strong>{{ absoluteTotal }} $</strong>
                        </li>
                    </ul>

                    <br /><br />

                    <form @submit.prevent="orderDone">

                        <label>Customer Name</label>
                        <select class="form-control" v-model="customer_id">
                            <option :value="customer.id" v-for="customer in customers" :key="customer.id">{{ customer.name }}</option>
                        </select>

                        <label>Pay</label>
                        <input type="text" class="form-control" required v-model="pay" />

                        <label>Due</label>
                        <input type="text" class="form-control" required v-model="due" />

                        <label>Pay By</label>
                        <select class="form-control" v-model="payby">
                            <option value="Cash">Cash</option>
                            <option value="Cheque">Cheque</option>
                            <option value="Gift Card">Gift Card</option>
                        </select>

                        <br />

                        <button type="submit" class="btn btn-success">Submit</button>

                    </form>

                </div>
          </div>
        </div>
        <!-- Pie Chart -->
        <div class="col-xl-7 col-lg-7">
          <div class="card mb-4">
            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
              <h6 class="m-0 font-weight-bold text-primary">Products Sold</h6>
            </div>

            <!-- Category-wise Product -->
            <ul class="nav nav-tabs" id="myTab" role="tablist">
              <li class="nav-item" role="presentation">
                <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true" >
                  All Products
                </button>
              </li>
              <li class="nav-item" role="presentation" v-for="category in categories" :key="category.id">
                <button class="nav-link" :id="category.slug + '-tab'" data-bs-toggle="tab" :data-bs-target="'#' + category.slug" type="button" role="tab" :aria-controls="category.slug" aria-selected="false" @click="getCategoryProducts(category.id)">
                  {{ category.name }}
                </button>
              </li>
            </ul>
            <div class="tab-content" id="myTabContent">

              <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                <div class="card-body">
                    <input type="text" v-model="searchTerm" class="form-control" style="width: 560px" placeholder="Search" />
                    <br />
                    <div class="row">
                        <div class="col-lg-3 col-md-3 col-sm-6 col-6" v-for="product in filterSearch" :key="product.id">
                        <button class="btn btn-sm" @click.prevent="addToCart(product.id)">
                            <div class="card" style="width: 8.5rem; margin-bottom: 5px">
                            <img :src="product.image" id="product_image" class="card-img-top" />
                            <div class="card-body">
                                <h6 class="card-title">{{ product.name }}</h6>
                                <span v-if="product.quantity >= 1" class="badge badge-success" >Available {{ product.quantity }}</span>
                                <span v-else class="badge badge-danger">Out Of Stock</span>
                            </div>
                            </div>
                        </button>
                        </div>
                    </div>
                </div>
              </div>

              <div class="tab-pane fade" :id="category.slug" role="tabpanel" :aria-labelledby="category.slug + '-tab'" v-for="category in categories" :key="category.id">
                <div class="card-body">
                <input type="text" v-model="searchTerm" class="form-control" style="width: 560px" placeholder="Search" />
                <br />
                <div class="row">
                    <div class="col-lg-3 col-md-3 col-sm-6 col-6" v-for="product in categoryProductsFilter" :key="product.id">
                      <button class="btn btn-sm" @click.prevent="addToCart(product.id)">
                        <div class="card" style="width: 8.5rem; margin-bottom: 5px">
                        <img :src="product.image" id="product_image" class="card-img-top" />
                        <div class="card-body">
                            <h6 class="card-title">{{ product.name }}</h6>
                            <span v-if="product.quantity >= 1" class="badge badge-success" >Available {{ product.quantity }}</span>
                            <span v-else class="badge badge-danger">Out Of Stock</span>
                        </div>
                        </div>
                      </button>
                    </div>
                </div>
                </div>
              </div>

            </div>


          </div>
        </div>
        <!-- Invoice Example -->
      </div>
      <!--Row-->
    </div>
    <!---Container Fluid-->
  </div>
</template>

<script type="text/javascript">
export default {
  created() {
    if (!User.loggedIn()) {
      this.$router.push({ name: "/" });
    }
    this.allProducts();
    this.allCategories();
    this.allCustomers();
    this.cartProducts();
    this.vat();
    Reload.$on('afterAdd', () => {
      this.cartProducts()
    })
  },
  data() {
    return {
      products: [],
      categories: [],
      categoryProducts: [],
      searchTerm: "",
      customers: '',
      errors: '',
      carts: '',
      vats: '',
      customer_id: '',
      pay: '',
      due: '',
      payby: ''
    };
  },
  computed: {
    categoryProductsFilter() {
      return this.categoryProducts.filter((categoryProduct) => {
        return (
          categoryProduct.name.match(this.searchTerm)
        );
      });
    },
    filterSearch() {
      return this.products.filter((product) => {
        return (
          product.name.match(this.searchTerm) ||
          product.category_name.match(this.searchTerm)
        );
      });
    },
    totalQuantity() {
      let sum = 0;
      for(let i=0; i < this.carts.length; i++) 
      {
        sum += (parseFloat(this.carts[i].product_quantity))
      }
      return sum;
    },
    totalSubTotal() {
      let sum = 0;
      for(let i=0; i < this.carts.length; i++) 
      {
        sum += (parseFloat(this.carts[i].product_price)) * (parseFloat(this.carts[i].product_quantity))
      }
      return sum;
    },
    absoluteTotal() {
      let sum = 0;
      let total = 0;
      for(let i=0; i < this.carts.length; i++) 
      {
        sum += (parseFloat(this.carts[i].product_price)) * (parseFloat(this.carts[i].product_quantity))
      }
      total = sum + (sum * this.vats.vat / 100);
      return total;
    },
  },
  methods: {
    allProducts() {
      axios.get("inventory/api/products")
      .then(({ data }) => (this.products = data))
      .catch();
    },
    allCategories() {
      axios.get("inventory/api/categories")
      .then(({ data }) => (this.categories = data))
      .catch();
    },
    allCustomers() {
      axios.get("inventory/api/customers")
      .then(({ data }) => (this.customers = data))
      .catch(console.log('error'));
    },
    getCategoryProducts(id) {
      axios.get("inventory/api/products/category/" + id)
      .then(({ data }) => (this.categoryProducts = data))
      .catch();
    },
    addToCart(id) {
      axios.post("inventory/api/addToCart/" + id)
      .then(({ data }) => {
        if(data.quantity > 0)
        {
          Reload.$emit('afterAdd')
          Notification.cart_success()
        }
        else
        {
          Notification.cart_out_of_stock()
        }
      })
      .catch();
    },
    removeFromCart(id) {
      axios.post("inventory/api/removeFromCart/" + id)
      .then(() => {
        Reload.$emit('afterAdd')
        Notification.cart_delete()
      })
      .catch();
    },
    cartProducts() {
      axios.get("inventory/api/cart/products")
      .then(({ data }) => (this.carts = data))
      .catch();
    },
    increment(id) {
      axios.post("inventory/api/incrementCart/" + id)
      .then(() => {
        Reload.$emit('afterAdd')
        Notification.cart_success()
      })
      .catch();      
    },
    decrement(id) {
      axios.post("inventory/api/decrementCart/" + id)
      .then(() => {
        Reload.$emit('afterAdd')
        Notification.cart_delete()
      })
      .catch();      
    },
    vat() {
      axios.get('inventory/api/extras/show')
      .then(({ data }) => (this.vats = data))
      .catch();
    },
    orderDone()
    {
      let total = this.totalSubTotal + (this.totalSubTotal * this.vats.vat / 100);
      var data = { 
        quantity: this.totalQuantity,
        subtotal: this.totalSubTotal,
        customer_id: this.customer_id,
        payby: this.payby,
        pay: this.pay,
        vat: this.vats.vat,
        total: total,
        due: this.due
      };
      axios.post("inventory/api/orderDone", data)
      .then(() => {
        Notification.success()
        this.$router.push({name: 'home'})
      })
    }
  },
};
</script>


<style type="text/css" scoped>
#product_image {
  width: 135px;
  height: 100px;
}

input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}

/* Firefox */
input[type=number] {
  -moz-appearance: textfield;
}
</style>