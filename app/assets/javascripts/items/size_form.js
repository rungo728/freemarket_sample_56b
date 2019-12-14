$(document).on('turbolinks:load', function(){

  //服のサイズ
  function appendClothesSize(){
    var sizeHtml = '';
    sizeHtml = `
                <div class='exhibit-detail_second-row__title #size__edit1'>
                  <label for = 'item_size'>
                    サイズ
                  </label>
                  <span>
                    必須
                  </span>
                </div>
                <div class = 'exhibit-detail_second-row__detail'>
                  <select class='add-size select-default' name='item[size]' id='good_size_id' selected='selected'>
                    <option id='selectsize1' value='---' data-brand='---'>---</option>
                    <option id='selectsize2' value='XXS以下'>XXS以下</option>
                    <option id='selectsize3' value='XS(SS)'>XS(SS)</option>
                    <option id='selectsize4' value='S'>S</option>
                    <option id='selectsize5' value='M'>M</option>
                    <option id='selectsize6' value='L'>L</option>
                    <option id='selectsize7' value='XL(LL)'>XL(LL)</option>
                    <option id='selectsize8' value='2XL(3L)'>2XL(3L)</option>
                    <option id='selectsize9' value='3XL(4L)'>3XL(4L)</option>
                    <option id='selectsize10' value='4XL(5L)以上'>4XL(5L)以上</option>
                    <option id='selectsize11' value='FREE SIZE'>FREE SIZE</option>
                  </select>
                </div>`;
    $('.detail-add-content').append(sizeHtml);
  };

  //メンズ靴のサイズ
  function appendMensShoesSize(){
    var sizeHtml = '';
    sizeHtml = `
                <div class='exhibit-detail_second-row__title #size__edit1'>
                  <label for = 'item_size'>
                    サイズ
                  </label>
                  <span>
                    必須
                  </span>
                </div>
                <div class = 'exhibit-detail_second-row__detail'>
                  <select class='add-size select-default' name='item[size]' id='good_size_id' selected='selected'>
                    <option value='---' data-brand='---'>---</option>
                    <option id='selectsize1' value='23.5cm以下'>23.5cm以下</option>
                    <option id='selectsize2' value='24cm'>24cm</option>
                    <option id='selectsize3' value='24.5cm'>24.5cm</option>
                    <option id='selectsize4' value='25cm'>25cm</option>
                    <option id='selectsize5' value='25.5cm'>25.5cm</option>
                    <option id='selectsize6' value='26cm'>26cm</option>
                    <option id='selectsize7' value='26.5cm'>26.5cm</option>
                    <option id='selectsize8' value='27cm'>27cm</option>
                    <option id='selectsize9' value='27.5cm'>27.5cm</option>
                    <option id='selectsize10' value='28cm'>28cm</option>
                    <option id='selectsize11' value='28.5cm'>28.5cm</option>
                    <option id='selectsize12' value='29cm'>29cm</option>
                    <option id='selectsize13' value='29.5cm'>29.5cm</option>
                    <option id='selectsize14' value='30cm'>30cm</option>
                    <option id='selectsize15' value='30.5cm'>30.5cm</option>
                    <option id='selectsize16' value='31cm以上'>31cm以上</option>
                  </select>
                </div>`;
    $('.detail-add-content').append(sizeHtml);
  };

  //レディース靴のサイズ
  function appendLadiesShoesSize(){
    var sizeHtml = '';
    sizeHtml = `
                <div class='exhibit-detail_second-row__title #size__edit1'>
                  <label for = 'item_size'>
                    サイズ
                  </label>
                  <span>
                    必須
                  </span>
                </div>
                <div class = 'exhibit-detail_second-row__detail'>
                  <select class='add-size select-default' name='item[size]' id='good_size_id' selected='selected'>
                    <option value='---' data-brand='---'>---</option>
                    <option id='selectsize1' value='20cm以下'>20cm以下</option>
                    <option id='selectsize2' value='20.5cm'>20.5cm</option>
                    <option id='selectsize3' value='21cm'>21cm</option>
                    <option id='selectsize4' value='21.5cm'>21.5cm</option>
                    <option id='selectsize5' value='22cm'>22cm</option>
                    <option id='selectsize6' value='22.5cm'>22.5cm</option>
                    <option id='selectsize7' value='23cm'>23cm</option>
                    <option id='selectsize8' value='23.5cm'>23.5cm</option>
                    <option id='selectsize9' value='24cm'>24cm</option>
                    <option id='selectsize10' value='24.5cm'>24.5cm</option>
                    <option id='selectsize11' value='25cm'>25cm</option>
                    <option id='selectsize12' value='25.5cm'>25.5cm</option>
                    <option id='selectsize13' value='26cm'>26cm</option>
                    <option id='selectsize14' value='26.5cm'>26.5cm</option>
                    <option id='selectsize15' value='27cm'>27cm</option>
                    <option id='selectsize16' value='27.5cm以上'>27.5cm以上</option>
                  </select>
                </div>`;
    $('.detail-add-content').append(sizeHtml);
  };

  //キッズ服のサイズ
  function appendKidsClothesSize(){
    var sizeHtml = '';
    sizeHtml = `
                <div class='exhibit-detail_second-row__title #size__edit1'>
                  <label for = 'item_size'>
                    サイズ
                  </label>
                  <span>
                    必須
                  </span>
                </div>
                <div class = 'exhibit-detail_second-row__detail'>
                  <select class='add-size select-default' name='item[size]' id='good_size_id' selected='selected'>
                    <option value='---' data-brand='---'>---</option>
                    <option id='selectsize1' value='100cm'>100cm</option>
                    <option id='selectsize2' value='110cm'>110cm</option>
                    <option id='selectsize3' value='120cm'>120cm</option>
                    <option id='selectsize4' value='130cm'>130cm</option>
                    <option id='selectsize5' value='140cm'>140cm</option>
                    <option id='selectsize6' value='150cm'>150cm</option>
                    <option id='selectsize7' value='160cm'>160cm</option>
                  </select>
                </div>`;
    $('.detail-add-content').append(sizeHtml);
  };

  //ベビー服のサイズ
  function appendBabyClothesSize(size){
    var sizeHtml = '';
    sizeHtml = `
                <div class='exhibit-detail_second-row__title #size__edit1'>
                  <label for = 'item_size'>
                    サイズ
                  </label>
                  <span>
                    必須
                  </span>
                </div>
                <div class = 'exhibit-detail_second-row__detail'>
                  <select class='add-size select-default' name='item[size]' id='good_size_id' selected='${size}'>
                    <option value='---' data-brand='---'>---</option>
                    <option id='selectsize1' value='60cm'>60cm</option>
                    <option id='selectsize2' value='70cm'>70cm</option>
                    <option id='selectsize3' value='80cm'>80cm</option>
                    <option id='selectsize4' value='90cm'>90cm</option>
                    <option id='selectsize5' value='95m'>95cm</option>
                  </select>
                </div>`;
    $('.detail-add-content').append(sizeHtml);
  };

  //キッズ靴のサイズ
  function appendKidsShoesSize(){
    var sizeHtml = '';
    sizeHtml = `
                <div class='exhibit-detail_second-row__title #size__edit1'>
                  <label for = 'item_size'>
                    サイズ
                  </label>
                  <span>
                    必須
                  </span>
                </div>
                <div class = 'exhibit-detail_second-row__detail'>
                  <select class='add-size select-default' name='item[size]' id='good_size_id' selected='selected'>
                    <option value='---' data-brand='---'>---</option>
                    <option id='selectsize1' value='10.5cm以下'>10.5cm以下</option>
                    <option id='selectsize2' value='11cm・11.5cm'>11cm・11.5cm</option>
                    <option id='selectsize3' value='12cm・12.5cm'>12cm・12.5cm</option>
                    <option id='selectsize4' value='13cm・13.5cm'>13cm・13.5cm</option>
                    <option id='selectsize5' value='14cm・14.5cm'>14cm・14.5cm</option>
                    <option id='selectsize6' value='15cm・15.5cm'>15cm・15.5cm</option>
                    <option id='selectsize7' value='16cm・16.5cm'>16cm・16.5cm</option>
                    <option id='selectsize8' value='17cm以上'>17cm以上</option>
                  </select>
                </div>`;
    $('.detail-add-content').append(sizeHtml);
  };

  //テレビのサイズ
  function appendTvSize(){
    var sizeHtml = '';
    sizeHtml = `
                <div class='exhibit-detail_second-row__title #size__edit1'>
                  <label for = 'item_size'>
                    サイズ
                  </label>
                  <span>
                    必須
                  </span>
                </div>
                <div class = 'exhibit-detail_second-row__detail'>
                  <select class='add-size select-default' name='item[size]' id='good_size_id' selected='selected'>
                    <option value='---' data-brand='---'>---</option>
                    <option id='selectsize1' value='〜20インチ'>〜20インチ</option>
                    <option id='selectsize2' value='20〜26インチ'>20〜26インチ</option>
                    <option id='selectsize3' value='26〜32インチ'>26〜32インチ</option>
                    <option id='selectsize4' value='32〜37インチ'>32〜37インチ</option>
                    <option id='selectsize5' value='37〜40インチ'>37〜40インチ</option>
                    <option id='selectsize6' value='40〜42インチ'>40〜42インチ</option>
                    <option id='selectsize7' value='42〜46インチ'>42〜46インチ</option>
                    <option id='selectsize8' value='46〜52インチ'>46〜52インチ</option>
                    <option id='selectsize9' value='60インチ〜'>60インチ〜</option>
                  </select>
                </div>`;
    $('.detail-add-content').append(sizeHtml);
  };

  //カメラレンズのサイズ
  function appendCameraLensSize(){
    var sizeHtml = '';
    sizeHtml = `
                <div class='exhibit-detail_second-row__title #size__edit1'>
                  <label for = 'item_size'>
                    サイズ
                  </label>
                  <span>
                    必須
                  </span>
                </div>
                <div class = 'exhibit-detail_second-row__detail'>
                  <select class='add-size select-default' name='item[size]' id='good_size_id' selected='selected'>
                    <option value='---' data-brand='---'>---</option>
                    <option id='selectsize1' value='ニコンFマウント'>ニコンFマウント</option>
                    <option id='selectsize2' value='キャノンEFマウント'>キャノンEFマウント</option>
                    <option id='selectsize3' value='ペンタックスKマウント'>ペンタックスKマウント</option>
                    <option id='selectsize4' value='ペンタックスQマウント'>ペンタックスQマウント</option>
                    <option id='selectsize5' value='フォーサーズマウント'>フォーサーズマウント</option>
                    <option id='selectsize6' value='マイクロフォーサーズマウント'>マイクロフォーサーズマウント</option>
                    <option id='selectsize7' value='αAマウント'>αAマウント/option>
                    <option id='selectsize8' value='αEマウント'>αEマウント</option>
                    <option id='selectsize9' value='ニコン1マウント'>ニコン1マウント</option>
                    <option id='selectsize10' value='キャノンEF-Mマウント'>キャノンEF-Mマウント</option>
                    <option id='selectsize11' value='Xマウント'>Xマウント</option>
                    <option id='selectsize12' value='シグマSAマウント'>シグマSAマウント</option>
                  </select>
                </div>`;
    $('.detail-add-content').append(sizeHtml);
  };

  $(".exhibit-detail_second-row").on('change', '#grandchild_category', function(){
    
    //子カテゴリのidを取得
    var cat = $('#child_category option:selected').data('category');
    //孫カテゴリのidを取得
    var gcat = $('#grandchild_category option:selected').data('category');

    var cat = $("[id=child_category]").val();

    //服全般のサイズ
    if (
      cat == 2
      || cat == 21
      || cat == 43
      || cat == 56
      || cat == 62 
      || cat == 78 
      || cat == 81
      || cat == 87
      || cat == 169
      || cat == 178
      || cat == 186
      || cat == 196
      || cat == 201
      || cat == 214
      || cat == 238
      || cat == 270
      || cat == 276
      || cat == 330
      || cat == 335
      || cat == 340 ){
      appendClothesSize()
    //メンズ靴のサイズ
    }else if(cat == 248){
      appendMensShoesSize()
    //レディース靴のサイズ
    }else if(cat == 67){
      appendLadiesShoesSize()
    //キッズ服
    }else if(
      cat == 377
      || cat == 396
      || cat == 411){
      appendKidsClothesSize()
    //ベビー服
    }else if(
      cat == 347
      || cat == 359
      || cat == 368){
      appendBabyClothesSize()
    //キッズ靴
    }else if(cat == 420){
      appendKidsShoesSize()
    //テレビ
    }else if(gcat == 932){
      appendTvSize()
    //カメラレンズ
    }else if(
      gcat == 926
      || gcat == 927){
      appendCameraLensSize()
    };
  })

  // 編集時
  $(document).each(function(){
    //子カテゴリのidを取得
    var cat = $('#child_category option:selected').data('category');
    //孫カテゴリのidを取得
    var gcat = $('#grandchild_category option:selected').data('category');

    var cat = $("[id=child_category]").val();

    //服全般のサイズ
    if (
      cat == 2
      || cat == 21
      || cat == 43
      || cat == 56
      || cat == 62 
      || cat == 78 
      || cat == 81
      || cat == 87
      || cat == 169
      || cat == 178
      || cat == 186
      || cat == 196
      || cat == 201
      || cat == 214
      || cat == 238
      || cat == 270
      || cat == 276
      || cat == 330
      || cat == 335
      || cat == 340 ){
      appendClothesSize()
    //メンズ靴のサイズ
    }else if(cat == 248){
      appendMensShoesSize()
    //レディース靴のサイズ
    }else if(cat == 67){
      appendLadiesShoesSize()
    //キッズ服
    }else if(
      cat == 377
      || cat == 396
      || cat == 411){
      appendKidsClothesSize()
    //ベビー服
    }else if(
      cat == 347
      || cat == 359
      || cat == 368){
      appendBabyClothesSize()
    //キッズ靴
    }else if(cat == 420){
      appendKidsShoesSize()
    //テレビ
    }else if(gcat == 932){
      appendTvSize()
    //カメラレンズ
    }else if(
      gcat == 926
      || gcat == 927){
      appendCameraLensSize()
    };
  })

  $(document).each(function(){

    var size = $('.size-value').val();

    var selectsize1 = $("[id=selectsize1]").val();
    var selectsize2 = $("[id=selectsize2]").val();
    var selectsize3 = $("[id=selectsize3]").val();
    var selectsize4 = $("[id=selectsize4]").val();
    var selectsize5 = $("[id=selectsize5]").val();
    var selectsize6 = $("[id=selectsize6]").val();
    var selectsize7 = $("[id=selectsize7]").val();
    var selectsize8 = $("[id=selectsize8]").val();
    var selectsize9 = $("[id=selectsize9]").val();
    var selectsize10 = $("[id=selectsize10]").val();
    var selectsize11 = $("[id=selectsize11]").val();
    var selectsize12 = $("[id=selectsize12]").val();
    var selectsize13 = $("[id=selectsize13]").val();
    var selectsize14 = $("[id=selectsize14]").val();
    var selectsize15 = $("[id=selectsize15]").val();
    var selectsize16 = $("[id=selectsize16]").val();

 
    if(size == selectsize1){
      $("#selectsize1").attr('selected', 'seleted');
    }else if(size == selectsize2){
      $("#selectsize2").attr('selected', 'seleted');
    }else if(size == selectsize3){
      $("#selectsize3").attr('selected', 'seleted');
    }else if(size == selectsize4){
      $("#selectsize4").attr('selected', 'seleted');
    }else if(size == selectsize5){
      $("#selectsize5").attr('selected', 'seleted');
    }else if(size == selectsize6){
      $("#selectsize6").attr('selected', 'seleted');
    }else if(size == selectsize7){
      $("#selectsize7").attr('selected', 'seleted');
    }else if(size == selectsize8){
      $("#selectsize8").attr('selected', 'seleted');
    }else if(size == selectsize9){
      $("#selectsize9").attr('selected', 'seleted');
    }else if(size == selectsize10){
      $("#selectsize10").attr('selected', 'seleted');
    }else if(size == selectsize11){
      $("#selectsize11").attr('selected', 'seleted');
    }else if(size == selectsize12){
      $("#selectsize12").attr('selected', 'seleted');
    }else if(size == selectsize13){
      $("#selectsize13").attr('selected', 'seleted');
    }else if(size == selectsize14){
      $("#selectsize14").attr('selected', 'seleted');
    }else if(size == selectsize15){
      $("#selectsize15").attr('selected', 'seleted');
    }else if(size == selectsize16){
      $("#selectsize16").attr('selected', 'seleted');
    };
  })
})