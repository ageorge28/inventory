class AppStorage 
{
    // Store access token in Application local storage
    storeToken(token) 
    {
        localStorage.setItem('token', token);
    }

    // Store logged in user in Application local storage
    storeUser(user) 
    {
        localStorage.setItem('user', user);
    }

    // Store access token and logged in user
    store(token, user)
    {
        this.storeToken(token)
        this.storeUser(user)
    }

    // Clear token and user values from Application local storage
    clear()
    {
        localStorage.removeItem('token')
        localStorage.removeItem('user')
    }

    // Retrieve access token value from Application Local Storage 
    getToken()
    {
        localStorage.getItem('token')
    }

    // Retrieve user from Application Local Storage
    getUser()
    {
        localStorage.getItem('user')
    }


}

export default AppStorage = new AppStorage();