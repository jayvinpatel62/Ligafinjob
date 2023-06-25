$(document).ready(function () {
    $("#navMenus>li:not(.children)>a").click(function(){
        $("#navMenus>li:not(.children).active").removeClass("active");
        $("#navMenus>li.children ul.sub-menu>li.active").removeClass("active");
        $("#navMenus>li.children.active").removeClass("active");
        $(this).parent().addClass("active");
    });
    $("#navMenus ul.sub-menu>li").click(function(){
        $("#navMenus ul.sub-menu>li.active").removeClass("active");
        $("#navMenus>li.children.active").removeClass("active"); 
        $("#navMenus>li:not(.children).active").removeClass("active"); 
        $(this).addClass("active"); 
        $(this).parent().parent().addClass("active"); 
    });
    
    
   
});