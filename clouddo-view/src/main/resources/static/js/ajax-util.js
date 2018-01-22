//登录token
var token = localStorage.getItem("token");
if (token == 'null') {
    parent.location.href = 'clouddo/login';
}

//jquery全局配置
$.ajaxSetup({
    dataType: "json",
    cache: false,
    headers: {
        "token": token
    },
    // xhrFields: {
    //     withCredentials: true
    // },
    complete: function (xhr) {
        //token过期，则跳转到登录页面
        if (xhr.responseJSON.code == 401) {
            parent.location.href = 'clouddo/login';
        }
    }
});

function setCookie(name, value,Days) {
    var exp = new Date();
    exp.setTime(exp.getTime() + Days * 24 * 60 * 60 * 1000);
    document.cookie = name + "=" + escape(value) + ";expires=" + exp.toGMTString() + ";path=/";
}

//获取cookie
function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for (var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') c = c.substring(1);
        if (c.indexOf(name) != -1) return c.substring(name.length, c.length);
    }
    return "";
}

function delCookie(name) {
    setCookie(name, "",-1);
}
