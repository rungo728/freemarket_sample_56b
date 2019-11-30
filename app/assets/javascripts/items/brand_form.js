$(document).on('turbolinks:load', function(){

  function appendBrand(){
    var brandHtml = '';
    brandHtml = `
                <div class='exhibit-detail_second-row__title'>
                  <label for = 'item_brand'>
                    ブランド
                  </label>
                  <span class='arbitarary'>
                    任意
                  </span>
                </div>
                <div class = 'exhibit-detail_second-row__detail'>
                  <input class='input-default', name='item[brand]', value='', placeholder='例) シャネル'>
                </div>`;
    $('.detail-add-content2').append(brandHtml);
  };

  $(".exhibit-detail_second-row").on('change', '#grandchild_category', function(){
    
    $('detail-add-content2').empty()
    //親カテゴリのidを取得
    var pcat = document.getElementById("parent-form").value;
    //子カテゴリのidを取得
    var cat = $('#child_category option:selected').data('category');
    //孫カテゴリのidを取得
    var gcat = $('#grandchild_category option:selected').data('category');

    console.log(pcat)
    if (
      pcat == 1
      || pcat == 200
      || pcat == 346
      || pcat == 481
      || pcat == 798
      || pcat == 934
      || cat == 678
      || cat == 898){
        appendBrand()
    };
  })
})