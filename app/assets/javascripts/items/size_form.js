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
                    <option value='---' data-brand='---'>---</option>
                    <option value='XXS以下'>XXS以下</option>
                    <option value='XS(SS)'>XS(SS)</option>
                    <option value='S'>S</option>
                    <option value='M'>M</option>
                    <option value='L'>L</option>
                    <option value='XL(LL)'>XL(LL)</option>
                    <option value='2XL(3L)'>2XL(3L)</option>
                    <option value='3XL(4L)'>3XL(4L)</option>
                    <option value='4XL(5L)以上'>4XL(5L)以上</option>
                    <option value='FREE SIZE'>FREE SIZE</option>
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
                    <option value='23.5cm以下'>23.5cm以下</option>
                    <option value='24cm'>24cm</option>
                    <option value='24.5cm'>24.5cm</option>
                    <option value='25cm'>25cm</option>
                    <option value='25.5cm'>25.5cm</option>
                    <option value='26cm'>26cm</option>
                    <option value='26.5cm'>26.5cm</option>
                    <option value='27cm'>27cm</option>
                    <option value='27.5cm'>27.5cm</option>
                    <option value='28cm'>28cm</option>
                    <option value='28.5cm'>28.5cm</option>
                    <option value='29cm'>29cm</option>
                    <option value='29.5cm'>29.5cm</option>
                    <option value='30cm'>30cm</option>
                    <option value='30.5cm'>30.5cm</option>
                    <option value='31cm以上'>31cm以上</option>
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
                    <option value='20cm以下'>20cm以下</option>
                    <option value='20.5cm'>20.5cm</option>
                    <option value='21cm'>21cm</option>
                    <option value='21.5cm'>21.5cm</option>
                    <option value='22cm'>22cm</option>
                    <option value='22.5cm'>22.5cm</option>
                    <option value='23cm'>23cm</option>
                    <option value='23.5cm'>23.5cm</option>
                    <option value='24cm'>24cm</option>
                    <option value='24.5cm'>24.5cm</option>
                    <option value='25cm'>25cm</option>
                    <option value='25.5cm'>25.5cm</option>
                    <option value='26cm'>26cm</option>
                    <option value='26.5cm'>26.5cm</option>
                    <option value='27cm'>27cm</option>
                    <option value='27.5cm以上'>27.5cm以上</option>
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
                    <option value='100cm'>100cm</option>
                    <option value='110cm'>110cm</option>
                    <option value='120cm'>120cm</option>
                    <option value='130cm'>130cm</option>
                    <option value='140cm'>140cm</option>
                    <option value='150cm'>150cm</option>
                    <option value='160cm'>160cm</option>
                  </select>
                </div>`;
    $('.detail-add-content').append(sizeHtml);
  };

  //ベビー服のサイズ
  function appendBabyClothesSize(){
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
                    <option value='60cm'>60cm</option>
                    <option value='70cm'>70cm</option>
                    <option value='80cm'>80cm</option>
                    <option value='90cm'>90cm</option>
                    <option value='95m'>95cm</option>
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
                    <option value='10.5cm以下'>10.5cm以下</option>
                    <option value='11cm・11.5cm'>11cm・11.5cm</option>
                    <option value='12cm・12.5cm'>12cm・12.5cm</option>
                    <option value='13cm・13.5cm'>13cm・13.5cm</option>
                    <option value='14cm・14.5cm'>14cm・14.5cm</option>
                    <option value='15cm・15.5cm'>15cm・15.5cm</option>
                    <option value='16cm・16.5cm'>16cm・16.5cm</option>
                    <option value='17cm以上'>17cm以上</option>
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
                    <option value='〜20インチ'>〜20インチ</option>
                    <option value='20〜26インチ'>20〜26インチ</option>
                    <option value='26〜32インチ'>26〜32インチ</option>
                    <option value='32〜37インチ'>32〜37インチ</option>
                    <option value='37〜40インチ'>37〜40インチ</option>
                    <option value='40〜42インチ'>40〜42インチ</option>
                    <option value='42〜46インチ'>42〜46インチ</option>
                    <option value='46〜52インチ'>46〜52インチ</option>
                    <option value='60インチ〜'>60インチ〜</option>
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
                    <option value='ニコンFマウント'>ニコンFマウント</option>
                    <option value='キャノンEFマウント'>キャノンEFマウント</option>
                    <option value='ペンタックスKマウント'>ペンタックスKマウント</option>
                    <option value='ペンタックスQマウント'>ペンタックスQマウント</option>
                    <option value='フォーサーズマウント'>フォーサーズマウント</option>
                    <option value='マイクロフォーサーズマウント'>マイクロフォーサーズマウント</option>
                    <option value='αAマウント'>αAマウント/option>
                    <option value='αEマウント'>αEマウント</option>
                    <option value='ニコン1マウント'>ニコン1マウント</option>
                    <option value='キャノンEF-Mマウント'>キャノンEF-Mマウント</option>
                    <option value='Xマウント'>Xマウント</option>
                    <option value='シグマSAマウント'>シグマSAマウント</option>
                  </select>
                </div>`;
    $('.detail-add-content').append(sizeHtml);
  };

  $(".exhibit-detail_second-row").on('change', '#grandchild_category', function(){
    
    //子カテゴリのidを取得
    var cat = $('#child_category option:selected').data('category');
    //孫カテゴリのidを取得
    var gcat = $('#grandchild_category option:selected').data('category');

    //服全般のサイズ
    if (
      //本番とカテゴリidがずれているので修正する
      cat == 4
      || cat == 23 
      || cat == 45
      || cat == 58
      || cat == 64 
      || cat == 80 
      || cat == 83
      || cat == 89
      || cat == 171
      || cat == 180
      || cat == 188
      || cat == 198
      || cat == 203
      || cat == 216
      || cat == 240
      || cat == 272
      || cat == 278
      || cat == 332
      || cat == 337
      || cat == 342 ){
      appendClothesSize()
    //メンズ靴のサイズ
    }else if(cat == 250){
      appendMensShoesSize()
    //レディース靴のサイズ
    }else if(cat == 69){
      appendLadiesShoesSize()
    //キッズ服
    }else if(
      cat == 379
      || cat == 398
      || cat == 413){
      appendKidsClothesSize()
    //ベビー服
    }else if(
      cat == 349
      || cat == 361
      || cat == 370){
      appendBabyClothesSize()
    //キッズ靴
    }else if(cat == 422){
      appendKidsShoesSize()
    //テレビ
    }else if(gcat == 934){
      appendTvSize()
    //カメラレンズ
    }else if(
      gcat == 928
      || gcat == 929){
      appendCameraLensSize()
    };
  })
})