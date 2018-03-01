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
            url: '/tasks/' + $(current_task_tr).attr('data-task_id')+'/complete/',
            type: 'post',
            data: {_method: 'PUT'},
             success: function (result) {
               $(current_task_tr).fadeOut(200);
               console.log(result);
             }
        });

    });


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