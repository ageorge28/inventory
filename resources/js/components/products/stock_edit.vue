<template>
  <div>
    <div class="row">
        <div class="col-3">
            <router-link to="/stock" class="btn btn-primary">Go Back</router-link>
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
                    <h1 class="h4 text-gray-900 mb-4">Edit Product Stock</h1>
                    <hr />
                  </div>

                  <form class="user" @submit.prevent="stockUpdate">

                    <div class="form-group">
                      <div class="form-row">
                        <div class="col-md-12">
                            <label for="quantity">Product Stock</label>
                            <input type="number" class="form-control" id="quantity" name="quantity" v-model="form.quantity" placeholder="Enter Product Quantity" />
                            <small class="text-danger" v-if="errors.quantity">{{ errors.quantity[0] }}</small>
                        </div>
                      </div>
                    </div>

                    <div class="form-group">
                      <button type="submit" class="btn btn-primary btn-block">
                        Update
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
  </div>
</template>

<script type="text/javascript">
export default {
  created() {
    if (!User.loggedIn()) {
      this.$router.push({ name: "/" });
    }

    let id = this.$route.params.id
    axios.get('/inventory/inventory/api/products/' + id)
    .then( ({data}) => (this.form = data) )
  },
  data() {
    return {
      form: {
        quantity: '',
      },
      errors: {},
    };
  },
  methods: {
    stockUpdate() {
        let id = this.$route.params.id
        axios.put('/inventory/inventory/api/products/stock/update/' + id, this.form)
        .then( () => {
            this.$router.push({ name: 'stock'})
            Notification.success()
        })
        .catch(error => this.errors = error.response.data.errors)
    },
  },

};
</script>


<style type="text/css">
</style>