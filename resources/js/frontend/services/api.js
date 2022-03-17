import axios from "axios";
import toast from "../../modules/toast";

export const apiClient = axios.create({
    baseURL: "/api",
    withCredentials: true // required to handle the CSRF token
});



export const getError = (error) => {
    let errorMessages = [];
    let data = error.data || error.response.data || null;
    if(data){
        if(data.errors){
            for(let key in data.errors){
                if(data.errors.hasOwnProperty(key)){
                    errorMessages.push(data.errors[key]);
                }
            }
        }else{
            errorMessages.push(data.message)
        }
    }
    return errorMessages.length ? errorMessages.join('<br>') : error;
};

export const catchError = (error, showMessage = false) => {
    if(!axios.isCancel(error)){
        if(error.response.data.errors){
            return error.response;
        }else{
            let message = getError(error);
            if(showMessage){
                toast.error(message);
            }
        }
    }
    return null;
}

export const axiosGet = async function (url, config = null){
    const itemData = await axios.get(url, config)
        .catch((err)=>{
            return catchError(err);
        });

    if(itemData){
        return itemData.data;
    }
    return null;
}

export const axiosPost = async function (url, data = null, config = null){
    const itemData = await axios.post(url, data, config)
        .catch((err)=>{
            return catchError(err);
        });

    if(itemData){
        return itemData.data;
    }
    return null;
}


export const axiosPut = async function (url, data = null, config = null){
    const itemData = await axios.put(url, data, config)
        .catch((err)=>{
            return catchError(err);
        });
    if(itemData){
        return itemData.data;
    }
    return null;
}

export const axiosPatch = async function (url, data = null, config = null){
    const itemData = await axios.patch(url, data, config)
        .catch((err)=>{
            return catchError(err);
        });
    if(itemData){
        return itemData.data;
    }
    return null;
}

export const axiosDelete = async function (url, config = null){
    const itemData = await axios.delete(url, config)
        .catch((err)=>{
            return catchError(err);
        });
    if(itemData){
        return itemData.data;
    }
    return null;
}

/**
 * Add a request interceptor
 * @param AxiosRequestConfig config
*/
apiClient.interceptors.request.use(
    function(config) {
        const token = window.localStorage.getItem("token");
        if (token != null) {
            config.headers.Authorization = `Bearer ${token}`;
        }
        return config;
    },
    function(error) {
        return Promise.reject(error.response);
    }
);

