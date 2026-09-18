window.baseURL = "http://d4aaa7a9.natappfree.cc" //natapp外网

// =====删掉全局axios请求拦截！！这是罪魁祸首=====
// axios.interceptors.request.use 这段全部删除！不要全局挂载token

axios.defaults.baseURL = baseURL
const api = axios.create({baseURL:""})

// api实例的请求拦截（只给api.get/api.post自动加token，原生axios不受影响）
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

        // 如果是刷新接口本身报401，直接跳转登录，不再处理
        if(orig.url === "/refresh/"){
            goLogin()
            return Promise.reject(err)
        }

        //普通接口401，执行刷新逻辑
        if(err.response.status === 401){
            orig._retry = true
            const refresh = localStorage.getItem("refresh_token")
            if(!refresh){
                goLogin()
                return Promise.reject(err)
            }
            try{
                //原生axios，不受api拦截器影响，并且没有全局拦截器，不会带上access
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