<template>
  <div>
    <div class="row">
      <div class="col-3">
        <router-link to="/customers/store" class="btn btn-primary">Add Customer</router-link>
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
                    <h1 class="h4 text-gray-900 mb-4">All Customers</h1>
                    <hr />
                  </div>


                  <br />

                  <input type="text" v-model="searchTerm" class="form-control" style="width:300px" placeholder="Search" />

                  <br />

                  <div class="row">
                    <div class="col-lg-12 mb-4">
                      <!-- Simple Tables -->
                      <div class="card">
                        <div
                          class="
                            card-header
                            py-3
                            d-flex
                            flex-row
                            align-items-center
                            justify-content-between
                          "
                        >
                          <h6 class="m-0 font-weight-bold text-primary">
                            Customer List
                          </h6>
                        </div>
                        <div class="table-responsive">
                          <table class="table align-items-center table-flush">
                            <thead class="thead-light">
                              <tr>
                                <th>Name</th>
                                <th>Photo</th>
                                <th>Phone</th>
                                <th>Email</th>
                                <th>Address</th>
                                <th>Actions</th>
                              </tr>
                            </thead>
                            <tbody>
                              <tr
                                v-for="customer in filterSearch"
                                :key="customer.id"
                              >
                                <td>{{ customer.name }}</td>
                                <td>
                                  <img
                                    id="customer_photo"
                                    :src="customer.photo"
                                  />
                                </td>
                                <td>{{ customer.phone }}</td>
                                <td>{{ customer.email }}</td>
                                <td>{{ customer.address }}</td>
                                <td>
                                  <router-link :to="{name: 'customer-edit', params: {id: customer.id} }" class="btn btn-sm btn-primary">Edit</router-link>
                                  <a @click="deleteCustomer(customer.id)" class="btn btn-sm btn-danger"><font color="#ffffff">Delete</font></a>
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
  },
  data() {
    return {
      customers: [],
      searchTerm: ''
    }
  },
  computed: {
    filterSearch() {
      return this.customers.filter(customer => {
        return customer.phone.match(this.searchTerm) || customer.name.match(this.searchTerm)
      })
    }
  },
  methods: {
    allCustomers() {
      axios
        .get("inventory/api/customers")
        .then(({ data }) => (this.customers = data))
        .catch();
    },
    deleteCustomer(id) {
      const swalWithBootstrapButtons = Swal.mixin({
        customClass: {
          confirmButton: 'btn btn-success',
          cancelButton: 'btn btn-danger'
        },
        buttonsStyling: false
      })

      swalWithBootstrapButtons.fire({
        title: 'Are you sure?',
        text: "You won't be able to revert this!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: 'Yes, delete it!',
        cancelButtonText: 'No, cancel!',
        reverseButtons: true
      }).then((result) => {
        if (result.isConfirmed) {

          axios.delete('inventory/api/customers/'+id)
          .then( () => {
            this.customers = this.customers.filter(customer => {
              return customer.id != id
            })
          })
          .catch( () => {
            this.$router.push({name: 'customers'})
          })

          swalWithBootstrapButtons.fire(
            'Deleted!',
            'Your file has been deleted.',
            'success'
          )
        } else if (
          /* Read more about handling dismissals below */
          result.dismiss === Swal.DismissReason.cancel
        ) {
          swalWithBootstrapButtons.fire(
            'Cancelled',
            'Your file is safe :)',
            'error'
          )
        }
      })
    },
  },
  created() {
    this.allCustomers();
  },
};
</script>


<style type="text/css">
#customer_photo {
  width: 40px;
  height: 40px;
}
</style>