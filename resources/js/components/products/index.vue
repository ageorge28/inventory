<template>
  <div>
    <div class="row">
      <div class="col-3">
        <router-link to="/products/store" class="btn btn-primary">Add Product</router-link>
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
                    <h1 class="h4 text-gray-900 mb-4">All Products</h1>
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
                            Product List
                          </h6>
                        </div>
                        <div class="table-responsive">
                          <table class="table align-items-center table-flush">
                            <thead class="thead-light">
                              <tr>
                                <th>Name</th>
                                <th>Code</th>
                                <th>Image</th>
                                <th>Category</th>
                                <th>Supplier</th>
                                <th>Buying Price</th>
                                <th>Selling Price</th>
                                <th>Root</th>
                                <th>Actions</th>
                              </tr>
                            </thead>
                            <tbody>
                              <tr v-for="product in filterSearch" :key="product.id" >
                                <td>{{ product.name }}</td>                                
                                <td>{{ product.code }}</td>
                                <td>
                                  <img id="product_image" :src="product.image" />
                                </td>
                                <td>{{ product.category_name }}</td>
                                <td>{{ product.supplier_name }}</td>
                                <td>{{ product.buying_price }}</td>
                                <td>{{ product.selling_price }}</td>
                                <td>{{ product.root }}</td>
                                <td>
                                  <router-link :to="{name: 'product-edit', params: {id: product.id} }" class="btn btn-sm btn-primary">Edit</router-link>
                                  <a @click="deleteProduct(product.id)" class="btn btn-sm btn-danger"><font color="#ffffff">Delete</font></a>
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
      products: [],
      searchTerm: ''
    }
  },
  computed: {
    filterSearch() {
      return this.products.filter(product => {
        return product.name.match(this.searchTerm) || product.category_name.match(this.searchTerm) 
      })
    }
  },
  methods: {
    allProducts() {
      axios
        .get("inventory/api/products")
        .then(({ data }) => (this.products = data))
        .catch();
    },
    deleteProduct(id) {
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

          axios.delete('inventory/api/products/'+id)
          .then( () => {
            this.products = this.products.filter(product => {
              return product.id != id
            })
          })
          .catch( () => {
            this.$router.push({name: 'products'})
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
  created() {
    this.allProducts();
  },
};
</script>


<style type="text/css">
#product_image {
  width: 40px;
  height: 40px;
}
</style>