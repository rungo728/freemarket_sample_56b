$(document).on('turbolinks:load', function(){

  function appendCharge(){
    var chargeHtml = '';
    chargeHtml = `
                <div class='exhibit-option_second-row__title #size__edit1'>
                  <label for = 'item_shipping_method'>
                    配送の方法
                  </label>
                  <span>
                    必須
                  </span>
                </div>
                <div class = 'exhibit-option_second-row__field'>
                  <select class='add-charge select-default' name='item[shipping_method]' id='item-shipping-method'>
                    <option id='selectmethod0' value='---' data-brand='---'>---</option>
                    <option id='selectmethod1' value='未定'>未定</option>
                    <option id='selectmethod2' value='らくらくメルカリ便'>らくらくメルカリ便</option>
                    <option id='selectmethod3' value='ゆうメール'>ゆうメール</option>
                    <option id='selectmethod4' value='レターパック'>レターパック</option>
                    <option id='selectmethod5' value='普通郵便(定形、定形外)'>普通郵便(定形、定形外)/option>
                    <option id='selectmethod6' value='クロネコヤマト'>クロネコヤマト</option>
                    <option id='selectmethod7' value='ゆうパック'>ゆうパック</option>
                    <option id='selectmethod8' value='クリックポスト'>クリックポスト</option>
                    <option id='selectmethod9' value='ゆうパケット'>ゆうパケット</option>
                  </select>
                </div>`;
    $('.shipping-charge-add-content').append(chargeHtml);
  };

  function appendChargenothing(){
    var chargeHtml = '';
    chargeHtml = `
                <div class='exhibit-option_second-row__title #size__edit1'>
                  <label for = 'item_size'>
                    配送の方法
                  </label>
                  <span>
                    必須
                  </span>
                </div>
                <div class = 'exhibit-option_second-row__field'>
                  <select class='add-charge select-default' name='item[shipping_method]' id='item-shipping-method' selected='selected'>
                    <option value='---' data-brand='---'>---</option>
                    <option id='selectmethod10' value='未定'>未定</option>
                    <option id='selectmethod11' value='クロネコヤマト'>クロネコヤマト</option>
                    <option id='selectmethod12' value='ゆうパック'>ゆうパック</option>
                    <option id='selectmethod13' value='ゆうメール'>ゆうメール</option>
                  </select>
                </div>`;
    $('.shipping-charge-add-content').append(chargeHtml);
  };

  
  $('#shipping-charge-select').on('change', function(){
    
    var chargeValue = $("[id=shipping-charge-select]").val(); 

    $('.shipping-charge-add-content').empty();

    if(chargeValue == "送料込み(出品者負担)"){
      appendCharge()
    }else if(chargeValue == "着払い(購入者負担)"){
      appendChargenothing()
    };
  })

  // 編集画面で配送方法を選択された状態で表示する
  $(document).each(function(){
    var chargeValue = $("[id=shipping-charge-select]").val(); 

    if(chargeValue == "送料込み(出品者負担)"){
      appendCharge()
      
    }else if(chargeValue == "着払い(購入者負担)"){
      appendChargenothing()
    };
  });


  $('#item-shipping-method').each(function(){
    // 商品の配送方法の値を取得
    var ship = $(".shipping_method-value").val();
    // 選択岐の値を取得
    var selectmethod1 = $("[id=selectmethod1]").val();
    var selectmethod2 = $("[id=selectmethod2]").val();
    var selectmethod3 = $("[id=selectmethod3]").val();
    var selectmethod4 = $("[id=selectmethod4]").val();
    var selectmethod5 = $("[id=selectmethod5]").val();
    var selectmethod6 = $("[id=selectmethod6]").val();
    var selectmethod7 = $("[id=selectmethod7]").val();
    var selectmethod8 = $("[id=selectmethod8]").val();
    var selectmethod9 = $("[id=selectmethod9]").val();
    var selectmethod10 = $("[id=selectmethod10]").val();
    var selectmethod11 = $("[id=selectmethod11]").val();
    var selectmethod12 = $("[id=selectmethod12]").val();
    var selectmethod13 = $("[id=selectmethod13]").val();

    // 選択済みにするための分岐
    if(ship == selectmethod1){
      $('#selectmethod1').attr('selected', 'seleted');
    }else if(ship == selectmethod2){
      $('#selectmethod2').attr('selected', 'seleted');
    }else if(ship == selectmethod3){
      $('#selectmethod3').attr('selected', 'seleted');
    }else if(ship == selectmethod4){
      $('#selectmethod4').attr('selected', 'seleted');
    }else if(ship == selectmethod5){
      $('#selectmethod5').attr('selected', 'seleted');
    }else if(ship == selectmethod6){
      $('#selectmethod6').attr('selected', 'seleted');
    }else if(ship == selectmethod7){
      $('#selectmethod7').attr('selected', 'seleted');
    }else if(ship == selectmethod8){
      $('#selectmethod8').attr('selected', 'seleted');
    }else if(ship == selectmethod9){
      $('#selectmethod9').attr('selected', 'seleted');
    }else if(ship == selectmethod10){
      $('#selectmethod10').attr('selected', 'seleted');
    }else if(ship == selectmethod11){
      $('#selectmethod11').attr('selected', 'seleted');
    }else if(ship == selectmethod12){
      $('#selectmethod12').attr('selected', 'seleted');
    }else if(ship == selectmethod13){
      $('#selectmethod13').attr('selected', 'seleted');
    };
  })
});