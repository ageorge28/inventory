<template>
  <div>
    <div class="row">

    </div>

    <div class="row justify-content-center">
      <div class="col-xl-12 col-lg-12 col-md-12">
        <div class="card shadow-sm my-5">
          <div class="card-body p-0">
            <div class="row">
              <div class="col-lg-12">
                <div class="login-form">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">Todays' Orders</h1>
                    <hr />
                  </div>


                  <br />

                  <input type="text" v-model="searchTerm" class="form-control" style="width:300px" placeholder="Search" />

                  <br />

                  <div class="row">
                    <div class="col-lg-12 mb-4">
                      <!-- Simple Tables -->
                      <div class="card">
                        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                          <h6 class="m-0 font-weight-bold text-primary">
                            Today's Orders
                          </h6>
                        </div>
                        <div class="table-responsive">
                          <table class="table align-items-center table-flush">
                            <thead class="thead-light">
                              <tr>
                                  <th>Customer</th>
                                  <th>Total Amount</th>
                                  <th>Quantity</th>                                                                    
                                  <th>Pay</th>                                                                    
                                  <th>Due</th>                                                                    
                                  <th>Pay By</th>                                                                    
                                  <th>Actions</th>
                              </tr>
                            </thead>
                            <tbody>
                              <tr v-for="order in filterSearch" :key="order.id">
                                <td>{{ order.customer }}</td>
                                <td>{{ order.total }}</td>
                                <td>{{ order.quantity }}</td>
                                <td>{{ order.pay }}</td>
                                <td>{{ order.due }}</td>
                                <td>{{ order.payby }}</td>
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

                  <div class="text-center"></div>
                </div>
              </div>
            </div>
          </div>
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
    this.todaysOrders();
  },
  data() {
    return {
      orders: [],
      searchTerm: ''
    }
  },
  computed: {
    filterSearch() {
      return this.orders.filter(order => {
        return order.customer.match(this.searchTerm)
      })
    }
  },
  methods: {
    todaysOrders() {
      axios.get("/inventory/inventory/api/orders/today")
      .then(({ data }) => (this.orders = data))
      .catch();
    },

  },
};
</script>


<style type="text/css">

</style>