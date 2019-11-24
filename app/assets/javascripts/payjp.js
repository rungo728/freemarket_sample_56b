// カード情報登録
document.addEventListener(
  "DOMContentLoaded", e => {
    // token_submitというidがnullではなかった場合
    if (document.getElementById("token_submit") != null) {
      // payjp.jsの初期化（公開鍵を設定）
      Payjp.setPublicKey("pk_test_0fbb48c51af057fdd3391f9c");

      //IDがtoken_submitのボタンが押下された場合
      let btn = document.getElementById("token_submit");
      btn.addEventListener("click", e => {
        e.preventDefault();

        //入力されたデータを取得しカード情報を生成する
        let card = {
          number: document.getElementById("card_number").value,
          cvc: document.getElementById("cvc").value,
          exp_month: document.getElementById("exp_month").value,
          exp_year: document.getElementById("exp_year").value
        };

        console.log(card);
        // トークンを生成する
        Payjp.createToken(card, (status, response) => {
          if (status === 200) {
            // HTTPステータスが200の場合（成功の場合）
            // 入力されたカード情報を自サーバにpostしないように削除する
            $("#card_number").removeAttr("name");
            $("#cvc").removeAttr("name");
            $("#exp_month").removeAttr("name");
            $("#exp_year").removeAttr("name");

            // IDがcard_tokenの子要素の末尾にを追加する
            $("#card_token").append(
              $('<input type="hidden" name="payjp-token">').val(response.id)
            );

            //取得したトークンをcontroler側に送信する
            document.inputForm.submit();
            alert("登録が完了しました"); //確認用
          } else {
            alert("カード情報が正しくありません。"); //確認用
          }
        });
      });
    }
  },
  false
);