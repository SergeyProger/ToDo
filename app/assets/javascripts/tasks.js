// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


jQuery(function(){

    //удаление задачи
    $(".deleteAction").click(function(){
        var current_task_tr = $(this).parents('tr')[0];
        if(confirm ("Are you serious?")){
            $.ajax({
                url: '/tasks/' + $(current_task_tr).attr('data-task_id'),
                type: 'post',
                data: {_method: 'DELETE'},
                success: function (result) {
                    $(current_task_tr).fadeOut(200);
                    console.log(result);
                }
            });
        }

    });
    //метод выполнено
    $(".complitedAction").click(function(){
        var current_task_tr = $(this).parents('tr')[0];
        $.ajax({
            url: '/tasks/' + $(current_task_tr).attr('#data-task_id')+'/complete/',
            type: 'post',
            data: {_method: 'PUT'},
             success: function (result) {
               $(current_task_tr).fadeOut(200);
               console.log(result);
             }
        });

    });


    //управление отображением окна
    function windowOpen(name) {
        var windowArray = new Array(".standart", ".complited_task", ".next-day-seven", ".project_task");
        var counterWindow;
        for (counterWindow = 0; counterWindow <= windowArray.length; counterWindow++) {
            $(windowArray[counterWindow]).css("display", "none");
            if (windowArray[counterWindow] == name) {
                $(windowArray[counterWindow]).css("display", "inline");
            }
        }
    }

    //функция переключает между текущими задачами и выполнеными
    $(".jmi").click(function(){
        if ( $(".complited_task").css('display') == 'none' ){
            windowOpen(".complited_task");
        }
        else{
            windowOpen(".standart");
        }
    });
    //функция переключает между текущими задачами и 7 дней вперёд
    $(".next-seven-day").click(function(){
        if ( $(".next-day-seven").css('display') == 'none' ){
            windowOpen(".next-day-seven");
            $(".next-seven-day").text("Current task");
        }
        else{
            windowOpen(".standart");
            $(".next-seven-day").text(" Next 7 days");
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
    //при клике на проект
    $(".title").click(function(){
        if ( $(".project_task").css('display') == 'none' ) {
            windowOpen(".project_task");
        }
        else{
            windowOpen(".standart");
        }
    });
});