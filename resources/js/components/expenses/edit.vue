<template>
  <div>
    <div class="row">
        <div class="col-3">
            <router-link to="/expenses" class="btn btn-primary">All Expenses</router-link>
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
                    <h1 class="h4 text-gray-900 mb-4">Edit Expense</h1>
                    <hr />
                  </div>

                  <form class="user" @submit.prevent="expenseUpdate">

                    <div class="form-group">
                      <div class="form-row">
                        <div class="col-12">
                          <label for="details"><b>Expense Details</b></label>
                          <textarea class="form-control" id="details" rows="3" name="details" v-model="form.details" placeholder="Enter Expense Details"></textarea>
                          <small class="text-danger" v-if="errors.details">{{ errors.details[0] }}</small>
                        </div>
                      </div>
                    </div>

                    <div class="form-group">
                      <div class="form-row">
                        <div class="col-12">
                            <label for="amount"><b>Expense Amount</b></label>
                            <input type="number" step=".01" class="form-control" id="amount" name="amount" v-model="form.amount" placeholder="Enter Amount" />
                            <small class="text-danger" v-if="errors.amount">{{ errors.amount[0] }}</small>
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
        details: '',
        amount: ''
      },
      errors: {},
    };
  },
  created() {
      let id = this.$route.params.id
      axios.get('/inventory/inventory/api/expenses/' + id)
      .then( ({data}) => (this.form = data) )
      .catch(error => this.errors = error.response.data.errors)
  },
  methods: {
    expenseUpdate() {
        let id = this.$route.params.id
        axios.put('/inventory/inventory/api/expenses/' + id, this.form)
        .then( () => {
            this.$router.push({ name: 'expenses'})
            Notification.success()
        })
        .catch(error => this.errors = error.response.data.errors)
    },
  },
};
</script>


<style type="text/css">
</style>