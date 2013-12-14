


   $(document).ready(function(){
       $(document).on('click', '#rating_container .rating_set' , function(){

           var id = $(this).attr('id');
           live_rating(id);
           return false;
       });
     $(document).on('click', '#comment_container .comment_set' , function(){

           var id = $(this).attr('id');
           live_comment(id);
           return false;
       });


   })  ;



function live_rating(hotel_id){

    $.ajax({
        url:'/hotels/'+hotel_id+'/ratings',
        data: {rating: {star: $('#rating_container form #rating_star').val()}},
        type: 'POST',
        error: function(err){
            alert("error");
        },
        success: function(data){
            $('#rating_container').html(data);
        }
    });
}
function live_comment(hotel_id){

    $.ajax({
        url:'/hotels/'+hotel_id+'/comments',
        data: {comment: {text: $('#comment_container form #comment_text').val()}},
        type: 'POST',
        error: function(err){
            alert("error");
        },
        success: function(data){
            $('#comment_container').html(data);
        }
    });
}
