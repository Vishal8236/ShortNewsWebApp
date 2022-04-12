/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */



function doLike(id)
{
    var likeop = document.getElementById(`likebtn${id}`);
    likeop.classList.toggle("is_animating")
    likeop.addEventListener("animationend", ()=>{
        likeop.classList.remove("is_animating")
    });
    
    let lcount = document.getElementById(`likec${id}`).innerHTML;    
     $.ajax({
        url: "/ShortNews/LikePost",
        data: {"news_id": id},
        cache: false,
        success: function(data) {
            $(`#likec${id}`).html(parseInt(lcount)+1);
        }
    })
}

function doBookmark(id)
{
    $.ajax({
        url: "/ShortNews/StoreBookmarkNews",
        data: {"news_id": id},
        cache: false,
        success: function(data) {
//            $(`#likec${id}`).html(parseInt(lcount)+1);
        }
    })
}


function removeBookmark(id)
{
    var div = document.getElementById(`${id}`)
    $.ajax({
        url: "/ShortNews/RemoveBookmark",
        data: {"news_id": id},
        cache: false,
        success: function(data) {
//            $(`#likec${id}`).html(parseInt(lcount)+1);
              div.remove();
        }
    })
}