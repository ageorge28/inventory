<template>
  <div>
    <div class="row">
        <div class="col-3">
            <router-link to="/salaries" class="btn btn-primary">Go Back</router-link>
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
                    <h1 class="h4 text-gray-900 mb-4">Edit Salary</h1>
                    <hr />
                  </div>

                  <form class="user" @submit.prevent="salaryUpdate">

                    <div class="form-group">
                      <div class="form-row">
                        <div class="col-6">
                          <label for="name"><b>Name</b></label>
                          <input type="text" readonly class="form-control" id="name" name="name" v-model="form.name" placeholder="Enter Your Full Name" />
                          <small class="text-danger" v-if="errors.name">{{ errors.name[0] }}</small>
                        </div>
                        <div class="col-6">
                            <label for="email"><b>Email</b></label>
                            <input type="email" readonly class="form-control" id="email" name="email" v-model="form.email" placeholder="Enter Your Email" />
                            <small class="text-danger" v-if="errors.email">{{ errors.email[0] }}</small>
                        </div>
                      </div>
                    </div>

                    <div class="form-group">
                      <div class="form-row">
                        <div class="col-6">
                          <label for="category_id"><b>Month</b></label>
                          <select class="form-control" id="month" name="month" v-model="form.month">
                            <option value="January">January</option>
                            <option value="February">February</option>
                            <option value="March">March</option>
                            <option value="April">April</option>
                            <option value="May">May</option>
                            <option value="June">June</option>
                            <option value="July">July</option>
                            <option value="August">August</option>
                            <option value="September">September</option>
                            <option value="October">October</option>
                            <option value="November">November</option>
                            <option value="December">December</option>
                          </select>
                          <small class="text-danger" v-if="errors.month">{{ errors.month }}</small>
                        </div>
                        <div class="col-6">
                            <label for="amount"><b>Salary</b></label>
                            <input type="number" class="form-control" id="amount" name="amount" step="0.01" v-model="form.amount" placeholder="Enter Your Salary" />
                            <small class="text-danger" v-if="errors.amount">{{ errors.amount[0] }}</small>
                        </div>
                      </div>
                    </div>

                    <input type="hidden" name="employee_id" id="employee_id" v-model="form.employee_id" />
                   
                    <div class="form-group">
                      <button type="submit" class="btn btn-primary btn-block">
                        Pay Now
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
        email: '',
        salary: '',
        month: '',
        employee_id: ''
      },
      errors: {},
    };
  },
  created() {
      let id = this.$route.params.id
      axios.get('/inventory/inventory/api/salaries/show/' + id)
      .then( ({data}) => (this.form = data) )
  },
  methods: {
    salaryUpdate() {
        let id = this.$route.params.id
        axios.put('/inventory/inventory/api/salaries/update/' + id, this.form)
        .then( () => {
            this.$router.push({ name: 'salaries'})
            Notification.success()
        })
        .catch(error => this.errors = error.response.data.errors)
    },
  },
};
</script>


<style type="text/css">
</style>