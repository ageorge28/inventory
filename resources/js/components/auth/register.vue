<template>
    <div>
            <div class="row justify-content-center">
      <div class="col-xl-10 col-lg-12 col-md-9">
        <div class="card shadow-sm my-5">
          <div class="card-body p-0">
            <div class="row">
              <div class="col-lg-12">
                <div class="login-form">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">Register</h1>
                  </div>


                  <form class="user" @submit.prevent="signup">
                    <div class="form-group">
                      <input type="text" class="form-control" id="name" name="name" v-model="form.name" placeholder="Enter Your Full Name">
                    </div>
                    <div class="form-group">
                      <input type="email" class="form-control" id="email" name="email" v-model="form.email" aria-describedby="emailHelp"
                        placeholder="Enter Email Address">
                    </div>
                    <div class="form-group">
                      <input type="password" class="form-control" id="password" name="password" v-model="form.password" placeholder="Password">
                    </div>
                    <div class="form-group">
                      <input type="password" class="form-control" id="password_confirmation" name="password_confirmation" v-model="form.password_confirmation"
                        placeholder="Confirm Password">
                    </div>
                    <div class="form-group">
                      <button type="submit" class="btn btn-primary btn-block">Register</button>
                    </div>
                    <hr>
                  </form>

                  <div class="text-center">
                    <router-link class="font-weight-bold small" to="/">Already have an account?</router-link>
                  </div>
                  <div class="text-center">
                  </div>
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
    if (User.loggedIn())
    {
      this.$router.push({name: 'home'})
    }
  },
  data() {
      return {
          form: {
              email: null,
              password: null,
              name: null,
              confirm_password: null
          },
          errors: { }
      }
  },
  methods: {
      signup() {
          axios.post('inventory/api/auth/signup', this.form)
          .then(response => {
            User.responseAfterLogin(response)
            Toast.fire({
              icon: 'success',
              title: 'Signed up successfully'
            })
            this.$router.push({name: 'home'})
          })
          .catch(error => this.errors = error.response.data.errors)
      }
  }
}
</script>


<style type="text/css">

</style>