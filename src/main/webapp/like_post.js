/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


console.log("hellosds ")
function doLike(id)
{
    console.log(id);
    var likeop = document.getElementById(`likebtn${id}`);
    likeop.classList.toggle("is_animating")
    likeop.addEventListener("animationend", ()=>{
        likeop.classList.remove("is_animating")
    });
    
    let lcount = document.getElementById(`likec${id}`).innerHTML;    
     $.ajax({
        url: "./LikePost",
        data: {"news_id": id},
        cache: false,
        success: function(data) {
            $(`#likec${id}`).html(parseInt(lcount)+1);
            var showalt = document.getElementById('show-alert');
            showalt.classList.remove("d-none");
            showalt.classList.remove("bg-warning");
            showalt.classList.add("bg-success");
            showalt.innerText = "You like this post!"
        }
    })
}

function doBookmark(id)
{
    console.log(id);
    $.ajax({
        url: "./StoreBookmarkNews",
        data: {"news_id": id},
        cache: false,
    }).done(function(res){
        if(res == "success")
        {
            var showalt = document.getElementById('show-alert');
            showalt.classList.remove("d-none");
            showalt.classList.remove("bg-warning");
            showalt.classList.add("bg-success");
            showalt.innerText = "This post is successfully bookmarked!"
        }
        else {
            var showalt = document.getElementById('show-alert');
            showalt.classList.remove("d-none");
        }
    });
}


function removeBookmark(id)
{
    var div = document.getElementById(`${id}`)
    $.ajax({
        url: "./RemoveBookmark",
        data: {"news_id": id},
        cache: false,
        success: function(data) {
//            $(`#likec${id}`).html(parseInt(lcount)+1);
              div.remove();
        }
    })
}


function showLink(id)
{
    var url = "http://localhost:8080/ShortNewsNew/news_page.jsp?news_id="+id;
    var showalt = document.getElementById('show-alert');
    showalt.classList.remove("d-none");
    showalt.classList.remove("bg-warning");
    showalt.classList.add("bg-primary");
    showalt.classList.add("text-white");
    showalt.innerText = "Link Copied Successfully";
//    showalt.select();
    
    var sampleTextarea = document.createElement("textarea");
    document.body.appendChild(sampleTextarea);
    sampleTextarea.value = url; //save main text in it
    sampleTextarea.select(); //select textarea contenrs
    document.execCommand("copy");
    document.body.removeChild(sampleTextarea);
}

