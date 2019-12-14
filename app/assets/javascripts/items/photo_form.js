$(document).on('turbolinks:load', function(){

  // 画像のプレビューを表示する。
  var filefield = $('#item_photos_attributes_0_photo')
  var filefield1 = $('#item_photos_attributes_1_photo')
  var filefield2 = $('#item_photos_attributes_2_photo')
  var filefield3 = $('#item_photos_attributes_3_photo')
  var filefield4 = $('#item_photos_attributes_4_photo')
  var filefield5 = $('#item_photos_attributes_5_photo')

  // 画像を選択した時のプレビューを作る
  $(filefield).on('change', filefield, function(e){
    file = e.target.files[0]
    reader = new FileReader(),
    num = 0
    preview = $('#'+num);
    preview.empty();

    reader.onload = (function(file) {
      return function(e) {
        preview.empty();
        preview.append($('<img>').attr({
          src: e.target.result,
          height: "100%",
          class: "preview",
          title: file.name
        }));
      };
    })(file);
    reader.readAsDataURL(file);
  });

  $(filefield1).on('change', filefield1, function(e){
    file = e.target.files[0]
    reader = new FileReader(),
    num = 1
    preview = $('#'+num);
    preview.empty();

    reader.onload = (function(file) {
      return function(e) {
        preview.empty();
        preview.append($('<img>').attr({
          src: e.target.result,
          height: "100%",
          class: "preview",
          title: file.name
        }));
      };
    })(file);
    reader.readAsDataURL(file);
  });

  $(filefield2).on('change', filefield2, function(e){
    file = e.target.files[0]
    reader = new FileReader(),
    num = 2
    preview = $('#'+num);
    preview.empty();

    reader.onload = (function(file) {
      return function(e) {
        preview.empty();
        preview.append($('<img>').attr({
          src: e.target.result,
          height: "100%",
          class: "preview",
          title: file.name
        }));
      };
    })(file);
    reader.readAsDataURL(file);
  });

  $(filefield3).on('change', filefield3, function(e){
    file = e.target.files[0]
    reader = new FileReader(),
    num = 3
    preview = $('#'+num);
    preview.empty();

    reader.onload = (function(file) {
      return function(e) {
        preview.empty();
        preview.append($('<img>').attr({
          src: e.target.result,
          height: "100%",
          class: "preview",
          title: file.name
        }));
      };
    })(file);
    reader.readAsDataURL(file);
  });

  $(filefield4).on('change', filefield4, function(e){
    file = e.target.files[0]
    reader = new FileReader(),
    num = 4
    preview = $('#'+num);
    preview.empty();

    reader.onload = (function(file) {
      return function(e) {
        preview.empty();
        preview.append($('<img>').attr({
          src: e.target.result,
          height: "100%",
          class: "preview",
          title: file.name
        }));
      };
    })(file);
    reader.readAsDataURL(file);
  });

  $(filefield5).on('change', filefield5, function(e){
    file = e.target.files[0]
    reader = new FileReader(),
    num = 5
    preview = $('#'+num);
    preview.empty();

    reader.onload = (function(file) {
      return function(e) {
        preview.empty();
        preview.append($('<img>').attr({
          src: e.target.result,
          height: "100%",
          class: "preview",
          title: file.name
        }));
      };
    })(file);
    reader.readAsDataURL(file);
  });

});