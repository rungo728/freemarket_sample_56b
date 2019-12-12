$(document).on('turbolinks:load', function(){

  function appendOption(category){
    var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }

  //子カテゴリのhtml
  function appendChildrenBox(insertHTML){
    var childSelectHtml = '';
    childSelectHtml = `
                       <select class='category-child select-default add-category' name='item[child]' id='child_category'>
                         <option value='---' data-category='---'>---</option>
                          ${insertHTML}
                       </select>
                      `;
    $('.category-add').append(childSelectHtml);
  }

  //孫カテゴリのhtml
  function appendGrandchildBox(insertHTML){
    var grandchildSelectHtml = '';
    grandchildSelectHtml = `
                            <select class='category-grandchild select-default add-category' name='item[category_id]' id='grandchild_category'>
                             <option value='---' data-category='---'>---</option>
                              ${insertHTML}
                            </select>
                           `;
    $('.category-add').append(grandchildSelectHtml);
  }


  //親カテゴリを選択した時
  $("#parent-form").on("change", function(){
    var parentValue = document.getElementById("parent-form").value;
    $('.category-child').remove();
    $('.category-grandchild').remove();
    $('.detail-add-content').empty();
    $('.detail-add-content2').empty();

    $.ajax({
      url: '/items/items/get_category_children',
      type: "GET",
      data: {parent_id: parentValue},
      dataType: 'json'
    })

    .done(function(children){

      $('.category-child').remove();
      $('.category-grandchild').remove();
      $('.detail-add-content').empty();
      $('.detail-add-content2').empty();

      var insertHTML = '';
      children.forEach(function(child){
        insertHTML += appendOption(child);
      });
      appendChildrenBox(insertHTML);
    })
  });

  //子カテゴリを選択した時
  $(".exhibit-detail_second-row").on("change", "#child_category", function(){
    var childValue = document.getElementById("child_category").value;
    $('.category-grandchild').remove();
    $('.detail-add-content2').empty();

    if (childValue != "---"){
      $.ajax({
        url: '/items/items/get_category_grandchildren',
        type: 'GET',
        data: { child_id: childValue },
        dataType: 'json'
      })

      .done(function(grandchildren){

        $('.category-grandchild').remove();
        $('.detail-add-content').empty();

        var insertHTML = '';
        grandchildren.forEach(function(grandchild){
          insertHTML += appendOption(grandchild);
        });
        appendGrandchildBox(insertHTML);
      })
    }else{
      $('.category-grandchild').remove();
      $('.detail-add-content').empty();
    }
  });
})