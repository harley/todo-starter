const sortedContainers = sortable(".js-sortable-items", {
  forcePlaceholderSize: true
});

sortedContainers.forEach(function(element) {
  element.addEventListener("sortupdate", function(e) {
    console.log("We will learn how to save this dynamically");
    $("button.save").removeClass("hidden");

    
    

    /*

    This event is triggered when the user stopped sorting and the DOM position has changed.

    e.detail.item contains the current dragged element.
    e.detail.index contains the new index of the dragged element (considering only list items)
    e.detail.oldindex contains the old index of the dragged element (considering only list items)
    e.detail.elementIndex contains the new index of the dragged element (considering all items within sortable)
    e.detail.oldElementIndex contains the old index of the dragged element (considering all items within sortable)
    e.detail.startparent contains the element that the dragged item comes from
    e.detail.endparent contains the element that the dragged item was added to (new parent)
    e.detail.newEndList contains all elements in the list the dragged item was dragged to
    e.detail.newStartList contains all elements in the list the dragged item was dragged from
    e.detail.oldStartList contains all elements in the list the dragged item was dragged from BEFORE it was dragged from it
    */
  });
});

 $(".add-list").click(()=>{
    $(".toHide").addClass("hidden");
    $(".newForm").removeClass("hidden");
  })

$(".cancel").click(()=>{
  $(".toHide").toggleClass("hidden");
  $(".newForm").toggleClass("hidden");
})




