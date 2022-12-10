<template>
<div>
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="./">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">Dashboard</li>
            </ol>
          </div>

          <div class="row mb-3">
            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card h-100">
                <div class="card-body">
                  <div class="row align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-uppercase mb-1">Today's Sale Amount</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">${{ Number(todayssale).toLocaleString() }}</div>
                      <div class="mt-2 mb-0 text-muted text-xs">
                        <span class="text-success mr-2"><i class="fa fa-arrow-up"></i> 3.48%</span>
                        <span>Since last month</span>
                      </div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-calendar fa-2x text-primary"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- Earnings (Annual) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card h-100">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-uppercase mb-1">Today's Income</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">${{ Number(income).toLocaleString() }}</div>
                      <div class="mt-2 mb-0 text-muted text-xs">
                        <span class="text-success mr-2"><i class="fas fa-arrow-up"></i> 12%</span>
                        <span>Since last years</span>
                      </div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-shopping-cart fa-2x text-success"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- New User Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card h-100">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-uppercase mb-1">Today's Due</div>
                      <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${{ Number(due).toLocaleString() }}</div>
                      <div class="mt-2 mb-0 text-muted text-xs">
                        <span class="text-success mr-2"><i class="fas fa-arrow-up"></i> 20.4%</span>
                        <span>Since last month</span>
                      </div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-users fa-2x text-info"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- Pending Requests Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card h-100">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-uppercase mb-1">Today's Expense</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">${{ Number(expense).toLocaleString() }}</div>
                      <div class="mt-2 mb-0 text-muted text-xs">
                        <span class="text-danger mr-2"><i class="fas fa-arrow-down"></i> 1.10%</span>
                        <span>Since yesterday</span>
                      </div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-comments fa-2x text-warning"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>





          </div>
          <!--Row-->

                            <div class="row">
                    <div class="col-lg-12 mb-4">
                      <!-- Simple Tables -->
                      <div class="card">
                        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                          <h6 class="m-0 font-weight-bold text-primary">
                            Out of Stock Products
                          </h6>
                        </div>
                        <div class="table-responsive">
                          <table class="table align-items-center table-flush">
                            <thead class="thead-light">
                              <tr>
                                <th>Name</th>
                                <th>Code</th>
                                <th>Image</th>
                                <th>Category</th>
                                <th>Buying Price</th>
                                <th>Status</th>
                                <th>Quantity</th>
                              </tr>
                            </thead>
                            <tbody>
                              <tr v-for="product in products" :key="product.id" >
                                <td>{{ product.name }}</td>                                
                                <td>{{ product.code }}</td>
                                <td>
                                  <img id="product_image" :src="product.image" />
                                </td>
                                <td>{{ product.category }}</td>
                                <td>{{ product.buying_price }}</td>
                                <td v-if="product.quantity >= 1">
                                    <span class="badge badge-success">Available</span>
                                </td>
                                <td v-else>
                                    <span class="badge badge-danger">Out Of Stock</span>
                                </td>
                                <td>{{ product.quantity }}</td>
                              </tr>
                            </tbody>
                          </table>
                        </div>
                        <div class="card-footer"></div>
                      </div>
                    </div>
                  </div>

  
</div>
</template>

<script type="text/javascript">

export default {

  created() {
    if (!User.loggedIn())
    {
      this.$router.push({name: '/'})
    }
  },
  data() {
      return {
         todayssale: '',
         income: '',
         expense: '',
         due: '',
         products: ''
      }
  },
  mounted() {
    this.todaysSale();
    this.todaysIncome();
    this.todaysDue();
    this.todaysExpense();
    this.outOfStock();
  },
  methods: {
      todaysSale() {
        axios.get('inventory/api/todayssale')
        .then( ({data}) => (this.todayssale = data) )
        .catch()
      },
      todaysIncome() {
        axios.get('inventory/api/todaysincome')
        .then( ({data}) => (this.income = data) )
        .catch()
      },
      todaysDue() {
        axios.get('inventory/api/todaysdue')
        .then( ({data}) => (this.due = data) )
        .catch()
      },
      todaysExpense() {
        axios.get('inventory/api/todaysexpense')
        .then( ({data}) => (this.expense = data) )
        .catch()
      },
      outOfStock() {
        axios.get('inventory/api/todaysoutofstock')
        .then( ({data}) => (this.products = data) )
        .catch()
      }
  }
}


</script>

<style="text/css">

</style>