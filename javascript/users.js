const searchBar = document.querySelector(".search input"),
    searchIcon = document.querySelector(".search button"),
    usersList = document.querySelector(".users-list");

searchIcon.onclick = () =>
{
    searchBar.classList.toggle("show");
    searchIcon.classList.toggle("active");
    searchBar.focus();
    if (searchBar.classList.contains("active"))
    {
        searchBar.value = "";
        searchBar.classList.remove("active");
    }
}

searchBar.onkeyup = () =>
{
    let searchTerm = searchBar.value;
    if (searchTerm != "")
    {
        searchBar.classList.add("active");
    }
    else
    {
        searchBar.classList.remove("active");
    }
    let xhr = new XMLHttpRequest();
    xhr.open("POST","php/search.php",true);
    xhr.onload = () =>
    {
        if (xhr.readyState === XMLHttpRequest.DONE)
        {
            if (xhr.status === 200)
            {
                let data = xhr.response;

                usersList.innerHTML = data;
            }
        }
    }
    xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    xhr.send("searchTerm=" + searchTerm);
}

setInterval(() =>
{
    let xhr = new XMLHttpRequest();
    xhr.open("GET","php/users.php",true);
    xhr.onload = () =>
    {
        if (xhr.readyState === XMLHttpRequest.DONE)
        {
            if (xhr.status === 200)
            {
                let data = xhr.response;
                if (!searchBar.classList.contains("active"))
                {
                    usersList.innerHTML = data;
                }
            }
        }
    }

    xhr.send();
},500);



function Send_Notif()
{
    const Notif = new Notification("پیام جدید",
        {
            body:"شما درای پیام جدید می باشید",
            icon:"https://www.asefg.ir/assets/images/logo-as.png"
        });
    Notif.onclick = (e) =>{
        window.location.href = "https://asefg.ir/chatapp/users.php";
    };


}

function Show_Notif()
{
    if (Notification.permission == "granted")
    {
        Send_Notif();
    }
    else if (Notification.permission !== "denied")
    {
        Notification.requestPermission().then(permission =>
        {
            if(permission === "granted")
            {
                Send_Notif();
            }
        });
    }
}