<template>
  <div>
    <div class="row">
        <div class="col-3">
            <router-link to="/categories" class="btn btn-primary">All Categories</router-link>
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
                    <h1 class="h4 text-gray-900 mb-4">Edit Category</h1>
                    <hr />
                  </div>

                  <form class="user" @submit.prevent="categoryUpdate">

                    <div class="form-group">
                      <div class="form-row">
                        <div class="col-12">
                            <input type="text" class="form-control" id="name" name="name" v-model="form.name" placeholder="Enter Your Category Name" />
                            <small class="text-danger" v-if="errors.name">{{ errors.name[0] }}</small>
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
  },
  data() {
    return {
      form: {
        name: '',
      },
      errors: {},
    };
  },
  created() {
      let id = this.$route.params.id
      axios.get('/inventory/inventory/api/categories/' + id)
      .then( ({data}) => (this.form = data) )
      .catch(console.log(error))
  },
  methods: {
    categoryUpdate() {
        let id = this.$route.params.id
        axios.put('/inventory/inventory/api/categories/' + id, this.form)
        .then( () => {
            this.$router.push({ name: 'categories'})
            Notification.success()
        })
        .catch(error => this.errors = error.response.data.errors)
    },
  },
};
</script>


<style type="text/css">
</style>