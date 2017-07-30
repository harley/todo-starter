
//$(".add-list-inputs").hide();
//$(".add-list-span").click(function(e){
 // $(".add-list-inputs").show();
 // $(".add-list-span").hide();
  //$(".input:text").focus();
 // $(".add-list-inputs").focus();
//}
//);
//$(".cancel").click(function(e){
 // $(".add-list-inputs").hide();
 // $(".add-list-span").show();
//});
//$(".add-list-inputs").focusout(function(){
 // $(".add-list-inputs").hide();
 // $(".add-list-span").show();
//});

$(".js-add-list").click(function(event) {
  console.log("event1:",event);
  $(this).parents("form").removeClass("is-idle");
});
$(".js-add-item").click(function(event) {
  console.log("event1:",event);
  $(this).parents("form").removeClass("is-idle");
});

$(".js-cancel-form").click(function(event) {
  $(this).parents("form").addClass("is-idle");
  console.log("event2:",event);
});

$("body").click(function(event) {
  // clicking the background hides the existing form
  if (event.target == event.currentTarget) {
  //  if (event.target !=$()) {
    $(".list-form:not(.is-idle)").addClass("is-idle");
  }
   console.log("event3:",event.target,":",event.currentTarget);
});


/////////////////////////////////////////////////////////////////////////
//                                                                     //
//                           list sortable                             //                           
//                                                                     //
//                                                                     //
/////////////////////////////////////////////////////////////////////////
$(function() {
  const sortedContainers = sortable(".js-sortable-list", {
    placeholderClass: "list-box-placeholder",
    forcePlaceholderSize: true
  });

  sortedContainers.forEach(function(element, index) {
    element.addEventListener("sortupdate", function(e) {
      Array.from($("form.update-all")).forEach(function(elem, index) {
        form = $(elem);
        // update list id based on the new ordering
        form.find(".list-id").val(index);
        form.addClass("js-remote").submit().removeClass("js-remote");
      });
    });
  });
});

/////////////////////////////////////////////////////////////////////////
//                                                                     //
//                             Item sortable                           //
//                                                                     //
//                                                                     //
/////////////////////////////////////////////////////////////////////////
$(function() {
  var sortedContainers = sortable(".js-sortable-item", {
    connectWith: "js-connected-item",
    forcePlaceholderSize: true,
    hoverClass: "js-drag-hovered"
  });

  sortedContainers.forEach(function(element) {
    element.addEventListener("sortupdate", function(e) {
       console.log("sortupdate: ", e.target, "startpar:", e.detail.startparent);
       console.log("sortupdate: ", e.target, "endpar:", e.detail.endparent);

//save a form that contain startparent and endparent       
      if (e.target !== e.detail.startparent && e.target !== e.detail.endparent) {
        return;
      }



      var form = $(e.target).parents("form");
      form.find(".save").removeClass("hidden");
      form.addClass("js-remote").submit().removeClass("js-remote");
     /*  
    console.log("We will learn how to save this dynamically!!!");
    console.log("e.detail.item",element.detail.item);
    console.log("e.detail.index",element.detail.index );
    console.log("e.detail.oldindex",element.detail.index );
    console.log("e.detail.elementIndex",element.detail.index );
    console.log("e.detail.oldElementIndex",element.detail.index );
    console.log("e.detail.startparent",element.detail.index);
    console.log("e.detail.endparent",element.detail.index );
    console.log("e.detail.newEndList",element.detail.index );
    console.log("e.detail.newStartList",element.detail.index );
    console.log("e.detail.oldStartList",element.detail.index);
   // $("button.save").removeClass("hidden");
*/
       //the easiest way   
   //   $("form.update-all").submit();
    });
  });
  
});


/*const sortedContainers = sortable(".js-sortable-item", {
  connectWith: "js-connected-item",
  forcePlaceholderSize: true,
  hoverClass: "js-drag-hovered"
});


sortedContainers.forEach(function(element) {
  element.addEventListener("sortupdate", function(e) {
   
  });
});
   */
/////////////////////////////////////////////////////////////////////////
//                                                                     //
//                         js for edition                              //
//                                                                     //
//                                                                     //
/////////////////////////////////////////////////////////////////////////
//    
$(".js-edit-inline .reader").click(function(event) {
  $(this).parents(".js-edit-inline").addClass("editing").find("input:text").focus().select();
});
$(".js-edit-inline .cancel").click(function(event) {
  console.log("canceling");
  $(this).parents(".editing").removeClass("editing");
});

/////////////////////////////////////////////////////////////////////////
//                                                                     //
//                 Set up the remote from using Ajax                   //
//                                                                     //
//                                                                     //
/////////////////////////////////////////////////////////////////////////

$("form").on("submit", function(element) {
  var form = $(this);
  if (!form.hasClass("js-remote")) {
    return;
  }

  console.log("ajax is ready:", form);
  element.preventDefault();
  $.ajax({
    type: form.attr("method"),
    url: form.attr("action"),
    data: form.serialize(),
    success: function(data) {
      form.find(".save").addClass("hidden");
      console.log("Submit ok");
    },
    error: function(data) {
      console.log("An error occurred.", data);
    }
  });
});
/////////////////////////////////////////////////////////////////////////
//                                                                     //
//                 Delete an item in a list                            //
//                                                                     //
//                                                                     //
/////////////////////////////////////////////////////////////////////////
//use button to delete
$(".js-sortable-item .js-delete-item").click(function(e){
  var form = $(e.target).parents("form");
  console.log("father of this item:", form);
  $(this).parent().remove();
  
  form.find(".save").removeClass("hidden");
  form.addClass("js-remote").submit().removeClass("js-remote");
});
///////// move out to delete
/* $(function(){
        
        $(".js-sortable-item .js-item").sortable({
            over: function () {
                removeItem = false;
            },
            out: function () {
                removeItem = true;
            },
            beforeStop: function (event, ui) {
                if(removeItem == true){
                    ui.item.remove();   
                }
            }
        });
    });*/