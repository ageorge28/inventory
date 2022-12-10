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
                    <h1 class="h4 text-gray-900 mb-4">Salary For The Month</h1>
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
                            Employee Salary Details
                          </h6>
                        </div>
                        <div class="table-responsive">
                          <table class="table align-items-center table-flush">
                            <thead class="thead-light">
                              <tr>
                                <th>Name</th>
                                <th>Month</th>
                                <th>Amount</th>
                                <th>Date</th>
                                <th>Actions</th>
                              </tr>
                            </thead>
                            <tbody>
                              <tr v-for="salary in filterSearch" :key="salary.id">
                                <td>{{ salary.name }}</td>
                                <td>{{ salary.month }}</td>
                                <td>{{ salary.amount }}</td>
                                <td>{{ salary.date }}</td>
                                <td>
                                  <router-link :to="{name: 'salary-edit', params: {id: salary.id} }" class="btn btn-sm btn-primary">Edit Salary</router-link>
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
      salaries: [],
      searchTerm: ''
    }
  },
  computed: {
    filterSearch() {
      return this.salaries.filter(salary => {
        return salary.name.match(this.searchTerm)
      })
    }
  },
  methods: {
    viewSalaries() {
       let id = this.$route.params.id
        axios.get('/inventory/inventory/api/salaries/view/' + id)
        .then( ({data}) => (this.salaries = data) )
        .catch(error => this.errors = error.response.data.errors)
    }
  },
  created() {
    this.viewSalaries();
  },
};
</script>


<style type="text/css">
#employee_photo {
  width: 40px;
  height: 40px;
}
</style>