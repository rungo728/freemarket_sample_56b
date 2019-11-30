$(document).on('turbolinks:load', function(){

  function appendCharge(){
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
                  <select class='add-charge select-default' name='item[shipping_method]' id='good_size_id' selected='selected'>
                    <option value='---' data-brand='---'>---</option>
                    <option value='未定'>未定</option>
                    <option value='らくらくメルカリ便'>らくらくメルカリ便</option>
                    <option value='ゆうメール'>ゆうメール</option>
                    <option value='レターパック'>レターパック</option>
                    <option value='普通郵便(定形、定形外)'>普通郵便(定形、定形外)/option>
                    <option value='クロネコヤマト'>クロネコヤマト</option>
                    <option value='ゆうパック'>ゆうパック</option>
                    <option value='クリックポスト'>クリックポスト</option>
                    <option value='ゆうパケット'>ゆうパケット</option>
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
                  <select class='add-charge select-default' name='item[shipping_method]' id='good_size_id' selected='selected'>
                    <option value='---' data-brand='---'>---</option>
                    <option value='未定'>未定</option>
                    <option value='クロネコヤマト'>クロネコヤマト</option>
                    <option value='ゆうパック'>ゆうパック</option>
                    <option value='ゆうメール'>ゆうメール</option>
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

});