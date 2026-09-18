window.baseURL = "http://d4aaa7a9.natappfree.cc"
axios.defaults.baseURL = baseURL
const api = axios.create({baseURL:""})

api.interceptors.request.use(config=>{
    const access = localStorage.getItem("access_token")
    if(access) config.headers.Authorization = `Bearer ${access}`
    return config
})

api.interceptors.response.use(
    res=>res,
    async function(err){
        if (!err || !err.response) {
            return Promise.reject(err)
        }
        const orig = err.config

        if(orig.url === "/refresh/"){
            goLogin()
            return Promise.reject(err)
        }

        if(err.response.status === 401){
            orig._retry = true
            const refresh = localStorage.getItem("refresh_token")
            if(!refresh){
                goLogin()
                return Promise.reject(err)
            }
            try{
                const r = await axios.post("/refresh/",{refresh_token:refresh})
                localStorage.setItem("access_token", r.data.access_token)
                orig.headers.Authorization = `Bearer ${r.data.access_token}`
                return api(orig)
            }catch(e){
                goLogin()
                return Promise.reject(e)
            }
        }
        return Promise.reject(err)
    }
)

function goLogin(){
    let rr=confirm("你还没有登录,请先登录")
    if(!rr){
        return
    }
    localStorage.clear()
    location.href="/login_pwd/"
}