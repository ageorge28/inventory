<template>
  <div>
    <div class="row">
      <div class="col-3">
        <router-link to="/expenses/store" class="btn btn-primary">Add Expense</router-link>
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
                    <h1 class="h4 text-gray-900 mb-4">All Expenses</h1>
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
                            Expense List
                          </h6>
                        </div>
                        <div class="table-responsive">
                          <table class="table align-items-center table-flush">
                            <thead class="thead-light">
                              <tr>
                                  <th>Details</th>
                                  <th>Amount</th>
                                  <th>Date</th>                                                                    
                                  <th>Actions</th>
                              </tr>
                            </thead>
                            <tbody>
                              <tr v-for="expense in filterSearch" :key="expense.id">
                                <td>{{ expense.details }}</td>
                                <td>{{ expense.amount }}</td>
                                <td>{{ expense.date | formatDate }}</td>
                                <td>
                                  <router-link :to="{name: 'expense-edit', params: {id: expense.id} }" class="btn btn-sm btn-primary">Edit</router-link>
                                  <a @click="deleteExpense(expense.id)" class="btn btn-sm btn-danger"><font color="#ffffff">Delete</font></a>
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
    this.allExpenses();
  },
  data() {
    return {
      expenses: [],
      searchTerm: ''
    }
  },
  computed: {
    filterSearch() {
      return this.expenses.filter(expense => {
        return expense.details.match(this.searchTerm)
      })
    }
  },
  methods: {
    allExpenses() {
      axios.get("inventory/api/expenses")
      .then(({ data }) => (this.expenses = data))
      .catch();
    },
    deleteExpense(id) {
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

          axios.delete('inventory/api/expenses/'+id)
          .then( () => {
            this.expenses = this.expenses.filter(expense => {
              return expense.id != id
            })
          })
          .catch( () => {
            this.$router.push({name: 'expenses'})
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
};
</script>


<style type="text/css">

</style>