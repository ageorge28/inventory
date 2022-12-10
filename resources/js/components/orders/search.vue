<template>
  <div>
    <div class="row">
        <div class="col-3">
            <router-link to="/orders/today" class="btn btn-primary">Todays Orders</router-link>
        </div>
    </div>

    <div class="row justify-content-center">
      <div class="col-xl-12 col-lg-12 col-md-12">
        <div class="card shadow-sm my-5">
          <div class="card-body p-0">
            <div class="row">
              <div class="col-lg-12">
                <div class="login-form">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">Search Order</h1>
                    <hr />
                  </div>

                  <form class="user" @submit.prevent="searchByDate">

                    <div class="form-group">
                      <div class="form-row">
                        <div class="col-12">
                            <label for="date"><b>Search By Date:</b></label>
                            <input type="date" class="form-control" id="date" name="date" required v-model="date" />
                        </div>
                      </div>
                    </div>

                    <div class="form-group">
                      <button type="submit" class="btn btn-primary btn-block">
                        Search
                      </button>
                    </div>
                    <hr />
                  </form>

                  <div class="text-center"></div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>


                      <div class="row">
                    <div class="col-lg-12 mb-4">
                      <!-- Simple Tables -->
                      <div class="card">
                        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                          <h6 class="m-0 font-weight-bold text-primary">
                            Details of the Order
                          </h6>
                        </div>
                        <div class="table-responsive">
                          <table class="table align-items-center table-flush">
                            <thead class="thead-light">
                              <tr>
                                <th>Customer</th>
                                <th>Quantity</th>
                                <th>Subtotal</th>
                                <th>VAT</th>
                                <th>Total</th>
                                <th>Pay</th>
                                <th>Due</th>
                                <th>Action</th>
                              </tr>
                            </thead>
                            <tbody>
                              <tr v-for="order in orders" :key="order.id">
                                <td>{{ order.name }}</td>
                                <td>{{ order.quantity }}</td>
                                <td>{{ order.subtotal }}</td>
                                <td>${{ order.vat }}</td>
                                <td>${{ order.total }}</td>
                                <td>${{ order.pay }}</td>
                                <td>${{ order.due }}</td>
                                <td>
                                  <router-link :to="{name: 'order-view', params: {id: order.id} }" class="btn btn-sm btn-primary">View</router-link>
                                </td>

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
    if (!User.loggedIn()) {
      this.$router.push({ name: "/" });
    }
  },
  data() {
    return {
      date: '',
      orders: {}
    };
  },
  methods: {
    searchByDate() {
      var data = {date: this.date} ;
      axios.post('/inventory/inventory/api/orders/search', data)
      .then( ({data}) => (this.orders = data) )
      .catch(error => this.errors = error.response.data.errors)
    },
  },
};
</script>


<style type="text/css">
</style>