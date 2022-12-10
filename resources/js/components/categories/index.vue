<template>
  <div>
    <div class="row">
      <div class="col-3">
        <router-link to="/categories/store" class="btn btn-primary">Add Category</router-link>
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
                    <h1 class="h4 text-gray-900 mb-4">All Categories</h1>
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
                            Category List
                          </h6>
                        </div>
                        <div class="table-responsive">
                          <table class="table align-items-center table-flush">
                            <thead class="thead-light">
                              <tr>
                                <th>Name</th>
                                <th>Actions</th>
                              </tr>
                            </thead>
                            <tbody>
                              <tr v-for="category in filterSearch" :key="category.id">
                                <td>{{ category.name }}</td>
                                <td>
                                  <router-link :to="{name: 'category-edit', params: {id: category.id} }" class="btn btn-sm btn-primary">Edit</router-link>
                                  <a @click="deleteCategory(category.id)" class="btn btn-sm btn-danger"><font color="#ffffff">Delete</font></a>
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
    this.allCategories();
  },
  data() {
    return {
      categories: [],
      searchTerm: ''
    }
  },
  computed: {
    filterSearch() {
      return this.categories.filter(category => {
        return category.name.match(this.searchTerm)
      })
    }
  },
  methods: {
    allCategories() {
      axios.get("inventory/api/categories")
      .then(({ data }) => (this.categories = data))
      .catch();
    },
    deleteCategory(id) {
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

          axios.delete('inventory/api/categories/'+id)
          .then( () => {
            this.categories = this.categories.filter(category => {
              return category.id != id
            })
          })
          .catch( () => {
            this.$router.push({name: 'categories'})
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