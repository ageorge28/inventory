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
                    <h1 class="h4 text-gray-900 mb-4">Add Category</h1>
                    <hr />
                  </div>

                  <form class="user" @submit.prevent="categoryInsert">

                    <div class="form-group">
                      <div class="form-row">
                        <div class="col-12">
                            <input type="text" class="form-control" id="name" name="name" v-model="form.name" placeholder="Enter Category Name" />
                            <small class="text-danger" v-if="errors.name">{{ errors.name[0] }}</small>
                        </div>
                      </div>
                    </div>

                    <div class="form-group">
                      <button type="submit" class="btn btn-primary btn-block">
                        Submit
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
        name:null,
      },
      errors: {},
    };
  },
  methods: {
    categoryInsert() {
      axios.post('/inventory/inventory/api/categories', this.form)
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