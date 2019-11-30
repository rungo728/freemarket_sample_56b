$(document).on('turbolinks:load', function(){

  function appendFee(price){
    var feeHtml = '';
    feeHtml = `
                <p>
                  ¥${price}
                </p>
              `
    $('.value_middle-row__cost').append(feeHtml)
  }

  function appendProfit(price){
    var profitHtml = '';
    profitHtml = `
                <p>
                  ¥${price}
                </p>
              `
    $('.value_bottom-row__price').append(profitHtml)
  }


  $('#price-setting').on('keyup', function(){
    var inputPrice = $('#price-setting').val();

    if(inputPrice >= 300){
      $('.value_middle-row__cost').empty();
      $('.value_bottom-row__price').empty();
      
      var priceFee = Math.floor(inputPrice * 0.1)
      var profit = inputPrice - priceFee
      
      appendFee(priceFee)
      appendProfit(profit)
    }else{
      $('.value_middle-row__cost').empty();
      $('.value_middle-row__cost').append('-');
      $('.value_bottom-row__price').empty();
      $('.value_bottom-row__price').append('-');
    };
  })
});