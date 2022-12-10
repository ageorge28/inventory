<template>
  <div>
    <div class="row">
        <div class="col-3">
            <router-link to="/employees" class="btn btn-primary">All Employees</router-link>
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
                    <h1 class="h4 text-gray-900 mb-4">Edit Employee</h1>
                    <hr />
                  </div>

                  <form class="user" @submit.prevent="employeeUpdate" enctype="multipart/form-data">

                    <div class="form-group">
                      <div class="form-row">
                        <div class="col-6">
                            <input type="text" class="form-control" id="name" name="name" v-model="form.name" placeholder="Enter Your Full Name" />
                            <small class="text-danger" v-if="errors.name">{{ errors.name[0] }}</small>
                        </div>
                        <div class="col-6">
                            <input type="email" class="form-control" id="email" name="email" v-model="form.email" placeholder="Enter Your Email" />
                            <small class="text-danger" v-if="errors.email">{{ errors.email[0] }}</small>
                        </div>
                      </div>
                    </div>

                    <div class="form-group">
                      <div class="form-row">
                        <div class="col-6">
                            <input type="text" class="form-control" id="phone" name="phone" v-model="form.phone" placeholder="Enter Your Phone Number" />
                            <small class="text-danger" v-if="errors.phone">{{ errors.phone[0] }}</small>
                        </div>
                        <div class="col-6">
                            <input type="number" class="form-control" id="salary" name="salary" step="0.01" v-model="form.salary" placeholder="Enter Your Salary" />
                            <small class="text-danger" v-if="errors.salary">{{ errors.salary[0] }}</small>
                        </div>
                      </div>
                    </div>

                    <div class="form-group">
                      <div class="form-row">
                        <div class="col-6">
                            <input type="date" class="form-control" id="joining_date" name="joining_date" v-model="form.joining_date" placeholder="Enter Your Joining Date" />
                            <small class="text-danger" v-if="errors.joining_date">{{ errors.joining_date[0] }}</small>
                        </div>
                        <div class="col-6">
                            <input type="text" class="form-control" id="nid" name="nid" v-model="form.nid" placeholder="Enter Your NID" />
                            <small class="text-danger" v-if="errors.nid">{{ errors.nid[0] }}</small>
                        </div>
                      </div>
                    </div>

                    <div class="form-group">
                      <div class="form-row">
                        <div class="col-12">
                            <input type="text" class="form-control" id="address" name="address" v-model="form.address" placeholder="Enter Your Address" />
                            <small class="text-danger" v-if="errors.address">{{ errors.address[0] }}</small>
                        </div>
                      </div>
                    </div>
                    
                    <div class="form-group">
                      <div class="form-row">
                        <div class="col-6">
                            <div class="custom-file">
                                <input type="file" class="custom-file-input" id="photo" name="photo" @change="onFileSelected">
                                <label class="custom-file-label" for="photo">Choose file</label>
                                <small class="text-danger" v-if="errors.photo">{{ errors.photo[0] }}</small>                               
                            </div>
                        </div>
                        <div class="col-6">
                            <img :src="'/inventory/' + form.photo" style="height:40px; width:40px" />
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
        name: '',
        email: '',
        phone: '',
        salary: '',
        joining_date: '',
        nid: '',
        photo: '',
        newphoto: ''
      },
      errors: {},
    };
  },
  created() {
      let id = this.$route.params.id;
      console.log(axios.get("/inventory/inventory/api/employees/" + id));
      axios
      .get("/inventory/inventory/api/employees/" + id)
      .then( ({data}) => (this.form = data) )
      .catch(error => this.errors = error.response.data.errors)
      // .catch(console.log(error))
  },
  methods: {
    employeeUpdate() {
        let id = this.$route.params.id
        axios.patch('/inventory/inventory/api/employees/' + id, this.form)
        .then( () => {
            this.$router.push({ name: 'employees'})
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
          this.form.newphoto = event.target.result
        };
        reader.readAsDataURL(file);
      }
    },
  },
};
</script>


<style type="text/css">
</style>