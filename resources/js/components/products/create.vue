<template>
  <div>
    <div class="row">
        <div class="col-3">
            <router-link to="/products" class="btn btn-primary">All Products</router-link>
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
                    <h1 class="h4 text-gray-900 mb-4">Add Product</h1>
                    <hr />
                  </div>

                  <form class="user" @submit.prevent="productInsert" enctype="multipart/form-data">

                    <div class="form-group">
                      <div class="form-row">
                        <div class="col-6">
                            <label for="name">Product Name</label>
                            <input type="text" class="form-control" id="name" name="name" v-model="form.name" placeholder="Enter The Product Name" />
                            <small class="text-danger" v-if="errors.name">{{ errors.name[0] }}</small>
                        </div>
                        <div class="col-6">
                            <label for="code">Product Code</label>
                            <input type="text" class="form-control" id="code" name="code" v-model="form.code" placeholder="Enter The Product Code" />
                            <small class="text-danger" v-if="errors.code">{{ errors.code[0] }}</small>
                        </div>
                      </div>
                    </div>

                    <div class="form-group">
                      <div class="form-row">
                        <div class="col-6">
                          <label for="category_id">Category</label>
                          <select class="form-control" id="category_id" name="category_id" v-model="form.category_id">
                            <option v-for="category in categories" :key="category.id" :value="category.id">{{ category.name }}</option>
                          </select>
                          <small class="text-danger" v-if="errors.category_id">{{ errors.category_id[0] }}</small>
                        </div>                        
                        <div class="col-6">
                          <label for="supplier_id">Supplier</label>
                          <select class="form-control" id="supplier_id" name="supplier_id" v-model="form.supplier_id">
                            <option v-for="supplier in suppliers" :key="supplier.id" :value="supplier.id">{{ supplier.name }}</option>
                          </select>
                          <small class="text-danger" v-if="errors.supplier_id">{{ errors.supplier_id[0] }}</small>
                        </div>
                      </div>
                    </div>

                    <div class="form-group">
                      <div class="form-row">
                        <div class="col-6">
                            <label for="root">Product Root</label>
                            <input type="text" class="form-control" id="root" name="root" v-model="form.root" placeholder="Enter Product Root" />
                            <small class="text-danger" v-if="errors.root">{{ errors.root[0] }}</small>
                        </div>
                        <div class="col-6">
                            <label for="quantity">Quantity</label>
                            <input type="number" class="form-control" id="quantity" name="quantity" v-model="form.quantity" placeholder="Enter Product Quantity" />
                            <small class="text-danger" v-if="errors.quantity">{{ errors.quantity[0] }}</small>
                        </div>
                      </div>
                    </div>

                    <div class="form-group">
                      <div class="form-row">
                        <div class="col-6">
                            <label for="buying_price">Buying Price</label>
                            <input type="number" step=".01" class="form-control" id="buying_price" name="buying_price" v-model="form.buying_price" placeholder="Enter Buying Price" />
                            <small class="text-danger" v-if="errors.buying_price">{{ errors.buying_price[0] }}</small>
                        </div>
                        <div class="col-6">
                            <label for="selling_price">Selling Price</label>
                            <input type="number" step=".01" class="form-control" id="selling_price" name="selling_price" v-model="form.selling_price" placeholder="Enter Selling Price" />
                            <small class="text-danger" v-if="errors.selling_price">{{ errors.selling_price[0] }}</small>
                        </div>
                      </div>
                    </div>

                    <div class="form-group">
                      <div class="form-row">
                        <div class="col-6">
                            <label for="buying_date">Buying Date</label>
                            <input type="date" class="form-control" id="buying_date" name="buying_date" v-model="form.buying_date" placeholder="Enter Buying Date" />
                            <small class="text-danger" v-if="errors.buying_date">{{ errors.buying_date[0] }}</small>
                        </div>
                      </div>
                    </div>
                  
                    <div class="form-group">
                      <div class="form-row">
                        <div class="col-6">
                            <label for="image">Product Image</label>
                            <div class="custom-file">
                                <input type="file" class="custom-file-input" id="image" name="image" @change="onFileSelected">
                                <label class="custom-file-label" for="image">Choose file</label>
                                <small class="text-danger" v-if="errors.image">{{ errors.image[0] }}</small>                               
                            </div>
                        </div>
                        <div class="col-6">
                            <br />
                            <img :src="form.image" style="height:40px; width:40px" />
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

    axios.get('/inventory/inventory/api/categories')
    .then( ({data}) => (this.categories = data) )

    axios.get('/inventory/inventory/api/suppliers')
    .then( ({data}) => (this.suppliers = data) )

  },
  data() {
    return {
      form: {
        name:null,
        code: null,
        category_id: null,
        supplier_id: null,
        root: null,
        buying_price: null,
        selling_price: null,
        quantity: null,
        buying_date: null,
        image: null
      },
      errors: {},
      categories: {},
      suppliers: {}
    };
  },
  methods: {
    productInsert() {
      axios.post('/inventory/inventory/api/products', this.form)
      .then( () => {
        this.$router.push({ name: 'products'})
        Notification.success()
      })
      .catch(error => this.errors = error.response.data.errors)
    },
    onFileSelected(event) {
      let file = event.target.files[0];
      if(file.size > 1048770)
      {
        Notification.image_validation()
      }
      else
      {
        let reader = new FileReader();
        reader.onload = event => {
          this.form.image = event.target.result
          console.log(event.target.result)
        };
        reader.readAsDataURL(file);
      }
    },
  },
};
</script>


<style type="text/css">
</style>