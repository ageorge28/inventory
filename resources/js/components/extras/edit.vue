<template>
  <div>
    <div class="row">
        <div class="col-3">
            <!-- <router-link to="/employees" class="btn btn-primary">All Employees</router-link> -->
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
                    <h1 class="h4 text-gray-900 mb-4">Edit Extras</h1>
                    <hr />
                  </div>

                  <form class="user" @submit.prevent="extraUpdate" enctype="multipart/form-data">

                    <div class="form-group">
                      <div class="form-row">
                        <div class="col-6">
                            <label for="name">VAT</label>
                            <input type="number" step=".01" class="form-control" id="vat" name="vat" v-model="form.vat" placeholder="Enter the VAT" />
                            <small class="text-danger" v-if="errors.vat">{{ errors.vat[0] }}</small>
                        </div>
                        <div class="col-6">
                            <label for="email">Company Email</label>
                            <input type="email" class="form-control" id="email" name="email" v-model="form.email" placeholder="Enter Your Email" />
                            <small class="text-danger" v-if="errors.email">{{ errors.email[0] }}</small>
                        </div>
                      </div>
                    </div>

                    <div class="form-group">
                      <div class="form-row">
                        <div class="col-6">
                            <label for="phone">Company Phone</label>
                            <input type="text" class="form-control" id="phone" name="phone" v-model="form.phone" placeholder="Enter Your Phone Number" />
                            <small class="text-danger" v-if="errors.phone">{{ errors.phone[0] }}</small>
                        </div>
                        <div class="col-6">
                            <label for="address">Company Address</label>
                            <input type="text" class="form-control" id="address" name="address" v-model="form.address" placeholder="Enter Your Address" />
                            <small class="text-danger" v-if="errors.address">{{ errors.address[0] }}</small>
                        </div>
                      </div>
                    </div>
                   
                    <div class="form-group">
                      <div class="form-row">
                        <div class="col-6">
                            <div class="custom-file">                      
                                <input type="file" class="custom-file-input" id="logo" name="logo" @change="onLogoSelected">
                                <label class="custom-file-label" for="logo">Choose Logo</label>
                                <small class="text-danger" v-if="errors.logo">{{ errors.logo[0] }}</small>                               
                            </div>
                        </div>
                        <div class="col-6">
                            <img :src="'/' + form.logo" style="height:40px; width:40px" />
                        </div>
                      </div>
                    </div>

                    <div class="form-group">
                      <div class="form-row">
                        <div class="col-6">
                            <div class="custom-file">                      
                                <input type="file" class="custom-file-input" id="favicon" name="favicon" @change="onFaviconSelected">
                                <label class="custom-file-label" for="favicon">Choose Favicon</label>
                                <small class="text-danger" v-if="errors.favicon">{{ errors.favicon[0] }}</small>                               
                            </div>
                        </div>
                        <div class="col-6">
                            <img :src="'/' + form.favicon" style="height:40px; width:40px" />
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
        vat: '',
        email: '',
        phone: '',
        address: '',
        logo: '',
        newlogo: '',
        favicon: '',
        newfavicon: ''
      },
      errors: {},
    };
  },
  created() {
      axios.get('inventory/api/extras')
      .then( ({data}) => (this.form = data) )
      .catch()
  },
  methods: {
    extraUpdate() {
        axios.post('inventory/api/extras/update', this.form)
        .then( () => {
            this.$router.push({ name: 'extras'})
            Notification.success()
        })
        .catch(error => this.errors = error.response.data.errors)
    },
    onLogoSelected(event) {
      let file = event.target.files[0];
      if(file.size > 1048770)
      {
        Notification.image_validation()
      }
      else
      {
        let reader = new FileReader();
        reader.onload = event => {
          this.form.newlogo = event.target.result
        };
        reader.readAsDataURL(file);
      }
    },
    onFaviconSelected(event) {
      let file = event.target.files[0];
      if(file.size > 1048770)
      {
        Notification.image_validation()
      }
      else
      {
        let reader = new FileReader();
        reader.onload = event => {
          this.form.newfavicon = event.target.result
        };
        reader.readAsDataURL(file);
      }
    },
  },
};
</script>


<style type="text/css">
</style>