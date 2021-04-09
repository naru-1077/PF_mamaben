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
//= require popper
//= require bootstrap-sprockets

//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

$(document).ready(function () {
$(".openbtn").click(function () {//ボタンがクリックされたら
	$(this).toggleClass('active');//ボタン自身に activeクラスを付与し
    $("#g-nav").toggleClass('panelactive');//ナビゲーションにpanelactiveクラスを付与
});
});

$(document).ready(function () {
$("#g-nav a").click(function () {//ナビゲーションのリンクがクリックされたら
    $(".openbtn").removeClass('active');//ボタンの activeクラスを除去し
    $("#g-nav").removeClass('panelactive');//ナビゲーションのpanelactiveクラスも除去
});
});

// レシピ完成画像プレビュー
$(document).ready(function () {
$('#post_image').on('change', function (e) {
var reader = new FileReader();
reader.onload = function (e) {
    $("#preview").attr('src', e.target.result);
}
reader.readAsDataURL(e.target.files[0]);
});
});

// レシピ作り方画像プレビュー1
$(document).ready(function () {
$('#post_recipes_attributes_0_recipe_image').on('change', function (e) {
var reader = new FileReader();
reader.onload = function (e) {
    $("#preview_recipe1").attr('src', e.target.result);
}
reader.readAsDataURL(e.target.files[0]);
});
});

// レシピ作り方画像プレビュー2
$(document).ready(function () {
$('#post_recipes_attributes_1_recipe_image').on('change', function (e) {
var reader = new FileReader();
reader.onload = function (e) {
    $("#preview_recipe2").attr('src', e.target.result);
}
reader.readAsDataURL(e.target.files[0]);
});
});

// レシピ作り方画像プレビュー3
$(document).ready(function () {
$('#post_recipes_attributes_2_recipe_image').on('change', function (e) {
var reader = new FileReader();
reader.onload = function (e) {
    $("#preview_recipe3").attr('src', e.target.result);
}
reader.readAsDataURL(e.target.files[0]);
});
});

// レシピ作り方画像プレビュー4
$(document).ready(function () {
$('#post_recipes_attributes_3_recipe_image').on('change', function (e) {
var reader = new FileReader();
reader.onload = function (e) {
    $("#preview_recipe4").attr('src', e.target.result);
}
reader.readAsDataURL(e.target.files[0]);
});
});

// レシピ作り方画像プレビュー5
$(document).ready(function () {
$('#post_recipes_attributes_4_recipe_image').on('change', function (e) {
var reader = new FileReader();
reader.onload = function (e) {
    $("#preview_recipe5").attr('src', e.target.result);
}
reader.readAsDataURL(e.target.files[0]);
});
});

// レシピ作り方画像プレビュー6
$(document).ready(function () {
$('#post_recipes_attributes_5_recipe_image').on('change', function (e) {
var reader = new FileReader();
reader.onload = function (e) {
    $("#preview_recipe6").attr('src', e.target.result);
}
reader.readAsDataURL(e.target.files[0]);
});
});