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
//= require jquery
//= require rails-ujs
//= require twitter/bootstrap


jQuery(function(){


    //функция переключает между текущими задачами и выполнеными
    $(".jmi").click(function(){
        if ( $(".standart").css('display') == 'none' ){
            $(".complited_task").css("display", "none");
            $(".standart").css("display", "inline");
        }
        else{
          $(".complited_task").css("display", "inline");
          $(".done").css("display", "none");
          $(".standart").css("display", "none");
       }
    });
    //функция переключает между текущими задачами и 7 дней вперёд
    $(".next-seven-day").click(function(){
        if ( $(".standart").css('display') == 'none' ){
            $(".next-day-seven").css("display", "none");
            $(".standart").css("display", "inline");
            $(".next-seven-day").text(" Next 7 days")
        }
        else{
            $(".next-day-seven").css("display", "inline");
            $(".standart").css("display", "none");
            $(".next-seven-day").text("Current task")
        }
    });
    //при клике на проект
    $(".title").click(function(){
        if ( $(".standart").css('display') == 'none' ){
            $(".project_task").css("display", "none");
            $(".standart").css("display", "inline");
        }
        else{
            $(".project_task").css("display", "inline");
            $(".standart").css("display", "none");
        }
    });
    //форма создания проекта
    $(".click-btn").click(function() {
        if ($(".pro-form").css('display') == 'none') {
            $(".pro-form").css("display", "inline");
            $(".click-btn").text("Close");
        }
        else{
            $(".pro-form").css("display", "none");
            $(".click-btn").text("Add project");
        }
    });
    //форма создания задачи
    $(".click-btn-task").click(function() {
        if ($(".ta-form").css('display') == 'none') {
            $(".ta-form").css("display", "inline");
            $(".click-btn-task").text("Close");
        }
        else{
            $(".ta-form").css("display", "none");
            $(".click-btn-task").text("Add task");
        }
    });
});
