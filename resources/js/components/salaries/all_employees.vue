<template>
  <div>
    <div class="row">
      <div class="col-3">
        <router-link to="/salaries" class="btn btn-primary">All Salaries</router-link>
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
                    <h1 class="h4 text-gray-900 mb-4">All Employees</h1>
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
                            Employee List
                          </h6>
                        </div>
                        <div class="table-responsive">
                          <table class="table align-items-center table-flush">
                            <thead class="thead-light">
                              <tr>
                                <th>Name</th>
                                <th>Photo</th>
                                <th>Phone</th>
                                <th>Salary</th>
                                <th>Actions</th>
                              </tr>
                            </thead>
                            <tbody>
                              <tr
                                v-for="employee in filterSearch"
                                :key="employee.id"
                              >
                                <td>{{ employee.name }}</td>
                                <td>
                                  <img
                                    id="employee_photo"
                                    :src="'/inventory/' + employee.photo"
                                  />
                                </td>
                                <td>{{ employee.phone }}</td>
                                <td>{{ employee.salary }}</td>
                                <td>
                                  <router-link :to="{name: 'salary-pay', params: {id: employee.id} }" class="btn btn-sm btn-primary">Pay Salary</router-link>
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
      employees: [],
      searchTerm: ''
    }
  },
  computed: {
    filterSearch() {
      return this.employees.filter(employee => {
        return employee.phone.match(this.searchTerm) || employee.name.match(this.searchTerm)
      })
    }
  },
  methods: {
    allEmployees() {
      axios
        .get("/inventory/inventory/api/employees")
        .then(({ data }) => (this.employees = data))
        .catch();
    },

  },
  created() {
    this.allEmployees();
  },
};
</script>


<style type="text/css">
#employee_photo {
  width: 40px;
  height: 40px;
}
</style>