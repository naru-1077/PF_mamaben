// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery3
//= require tagsinput
//= require popper
//= require bootstrap-sprockets

//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require cocoon
//= require_tree .

$(document).on('turbolinks:load', function () {
$(".openbtn").click(function () {//ボタンがクリックされたら
	$(this).toggleClass('active');//ボタン自身に activeクラスを付与し
    $("#g-nav").toggleClass('panelactive');//ナビゲーションにpanelactiveクラスを付与
});
});

$(document).on('turbolinks:load', function () {
$("#g-nav a").click(function () {//ナビゲーションのリンクがクリックされたら
    $(".openbtn").removeClass('active');//ボタンの activeクラスを除去し
    $("#g-nav").removeClass('panelactive');//ナビゲーションのpanelactiveクラスも除去
});
})

// レシピ完成画像プレビュー
$(document).on('turbolinks:load', function () {
$('#post_image').on('change', function (e) {
var reader = new FileReader();
reader.onload = function (e) {
    $("#preview").attr('src', e.target.result);
}
reader.readAsDataURL(e.target.files[0]);
});
});

// レシピ作り方画像プレビュー
$(document).on('turbolinks:load', function () {
    $(document).on('change','.image-btn',function(e) {
var reader = new FileReader();
var target =  $(this).parent().children('img')
reader.onload = function (e) {
    target.attr('src', e.target.result);
}
reader.readAsDataURL(e.target.files[0]);
});
});

// (ページトップのスクロール)
//スクロールした際の動きを関数でまとめる
$(document).on('turbolinks:load', function () {

function PageTopAnime() {
	var scroll = $(window).scrollTop();
	if (scroll >= 100){//上から100pxスクロールしたら
		$('#page-top').removeClass('DownMove');//#page-topについているDownMoveというクラス名を除く
		$('#page-top').addClass('UpMove');//#page-topについているUpMoveというクラス名を付与
	}else{
		if($('#page-top').hasClass('UpMove')){//すでに#page-topにUpMoveというクラス名がついていたら
			$('#page-top').removeClass('UpMove');//UpMoveというクラス名を除き
			$('#page-top').addClass('DownMove');//DownMoveというクラス名を#page-topに付与
		}
	}
}


// 画面をスクロールをしたら動かしたい場合の記述
$(window).scroll(function () {
	PageTopAnime();/* スクロールした際の動きの関数を呼ぶ*/
});

// ページが読み込まれたらすぐに動かしたい場合の記述
$(window).on('load', function () {
	PageTopAnime();/* スクロールした際の動きの関数を呼ぶ*/
});


// #page-topをクリックした際の設定
$('#page-top').click(function () {
	var scroll = $(window).scrollTop(); //スクロール値を取得
	if(scroll > 0){
		$(this).addClass('floatAnime');//クリックしたらfloatAnimeというクラス名が付与
        $('body,html').animate({
            scrollTop: 0
        }, 2000,function(){//スクロールの速さ。数字が大きくなるほど遅くなる
            $('#page-top').removeClass('floatAnime');//上までスクロールしたらfloatAnimeというクラス名を除く
        });
	}
    return false;//リンク自体の無効化
});
});

// (ページトップのslick)
$(document).on('turbolinks:load', function(){
  $('.slick').slick({
    autoplay:true,  //自動再生
    dots:true,      //ドットの描写
    accessibility: true,  // アクセシビリティ。左右ボタンで画像の切り替えをできるかどうか
    autoplaySpeed: 3000,  // 自動再生で切り替えをする時間
    speed: 1000,  // 自動再生や左右の矢印でスライドするスピード
    pauseOnHover: true,  // 自動再生時にスライドのエリアにマウスオンで一時停止するかどうか
    pauseOnDotsHover: true,  // 自動再生時にドットにマウスオンで一時停止するかどうか
    arrows: true,  // 左右の次へ、前へボタンを表示するかどうか
    infinite: true,  // 無限スクロールにするかどうか。最後の画像の次は最初の画像が表示される。
  });
});

$(document).on('turbolinks:load', function(){
    $('input').keydown(function(e) {
        if (e.which === 13) {
            $(this).blur();
            $(this).focus();
            return false;
        }
    });
});