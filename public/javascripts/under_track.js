
 function close_alert(){
 	// Automatically close alerts if there was any present.
    if ($('.alert').length > 0) {
      setTimeout(function() { $('.alert').alert('close'); }, 5000);
    }
 }

function select_function(){

	$(".select_function").on("change",function(evt) {

 	  console.log("slect")
     //console.log($(this).parent().attr("href"))
     console.log($(this).val())

     url="/settings/select_function_area2/"+$(this).val();


    $.ajax({
    url: url,
   
    success:function(dates){
    $("#function_area2").html(dates);//要刷新的div
    },

    timeout:10000,

  }).done(function() {
    console.log("select_function done!")
  });



    //   evt.preventDefault();

 })
} 


function submit_manger_status(){



// this is the id of the form
$(".manage_submit").submit(function(e) {

    var url = $(this).attr("action")

    $.ajax({
           type: "POST",
           url: url,
           data: $(this).serialize(), // serializes the form's elements.
           success: function(data)
           {
               console.log("done")
           }
         });

    //e.preventDefault(); // avoid to execute the actual submit of the form.
});

}



function delete_issue(){


  $(".delete_issue").on('click',function(e){
  var url = $(this).attr("action")

     $.ajax({
           type: "POST",
           url: url,
           data: $(this).serialize(), // serializes the form's elements.
           success: function(data)
           {
              window.location.reload(true);
               console.log("done")
           }
         });

   e.preventDefault(); // avoid to execute the actual submit of the form.

  });
}


 $( document ).ready(function() {
  close_alert();

   $(function () {
      $('[data-toggle="popover"]').popover()
    })

    $('select').select2();
    
select_function();

submit_manger_status();

delete_issue();

  if ($("#is_issue_form").length){
   var simplemde = new SimpleMDE();
  }

console.log("I am ready")

});

