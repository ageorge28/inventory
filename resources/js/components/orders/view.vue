<template>
  <div>
    <div class="row">
      <div class="col-3">
        <router-link to="/orders" class="btn btn-primary">All Orders</router-link
        >
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
                    <h1 class="h4 text-gray-900 mb-4">Order Details</h1>
                    <hr />
                  </div>

                  <div class="row">
                    <div class="col-lg-6 mb-4">
                      <!-- Simple Tables -->
                      <div class="card">
                        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                          <h6 class="m-0 font-weight-bold text-primary">
                            Customer Details
                          </h6>
                        </div>
                        <div class="table-responsive">
                            <ul class="list-group">
                                <li class="list-group-item"><b>Name:</b> {{ order.name }}</li>
                                <li class="list-group-item"><b>Phone:</b> {{ order.phone }}</li>
                                <li class="list-group-item"><b>Address:</b> {{ order.address }}</li>
                                <li class="list-group-item"><b>Date:</b> {{ order.date | formatDate }}</li>
                                <li class="list-group-item"><b>Pay Through:</b> {{ order.payby }}</li>
                            </ul>
                        </div>
                      </div>
                    </div>

                    <div class="col-lg-6 mb-4">
                      <!-- Simple Tables -->
                      <div class="card">
                        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                          <h6 class="m-0 font-weight-bold text-primary">
                            Order Details
                          </h6>
                        </div>
                        <div class="table-responsive">
                            <ul class="list-group">
                                <li class="list-group-item"><b>Quantity:</b> {{ order.quantity }}</li>
                                <li class="list-group-item"><b>Subtotal:</b> ${{ order.subtotal }}</li>
                                <li class="list-group-item"><b>VAT:</b> {{ order.vat }}%</li>
                                <li class="list-group-item"><b>Total:</b> ${{ order.total }}</li>
                                <li class="list-group-item"><b>Pay Amount:</b> ${{ order.pay }}</li>
                                <li class="list-group-item"><b>Due Amount:</b> ${{ order.due }}</li>
                            </ul>
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
                                <th>Product Name</th>
                                <th>Product Code</th>
                                <th>Image</th>
                                <th>Quantity</th>
                                <th>Price</th>
                                <th>Total</th>
                              </tr>
                            </thead>
                            <tbody>
                              <tr v-for="detail in details" :key="detail.id">
                                <td>{{ detail.name }}</td>
                                <td>{{ detail.code }}</td>
                                <td>
                                    <img :src="'/inventory/' + detail.image" style="width:40px;height:40px" />
                                </td>
                                <td>{{ detail.quantity }}</td>
                                <td>${{ detail.price }}</td>
                                <td>${{ detail.subtotal }}</td>
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

    let id = this.$route.params.id;

    axios.get("/inventory/inventory/api/orders/show/" + id)
    .then(({ data }) => (this.order = data));

    axios.get("/inventory/inventory/api/orders/details/" + id)
    .then(({ data }) => (this.details = data));


  },
  data() {
    return {
      errors: {},
      order: {},
      details: {},
    };
  },
  methods: {},
};
</script>


<style type="text/css">
</style>