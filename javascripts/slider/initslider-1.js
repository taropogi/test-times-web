jQuery(document).ready(function(){
    var scripts = document.getElementsByTagName("script");
    var jsFolder = "";
    for (var i= 0; i< scripts.length; i++)
    {
        if( scripts[i].src && scripts[i].src.match(/initslider-1\.js/i))
            jsFolder = scripts[i].src.substr(0, scripts[i].src.lastIndexOf("/") + 1);
    }
    jQuery("#amazingslider-1").amazingslider({
        jsfolder:jsFolder,
        width:625,
        height:230,
        skinsfoldername:"",
        loadimageondemand:false,
        isresponsive:false,
        autoplayvideo:false,
        pauseonmouseover:false,
        addmargin:true,
        randomplay:false,
        playvideoonclickthumb:true,
        slideinterval:5000,
        enabletouchswipe:true,
        transitiononfirstslide:false,
        loop:0,
        autoplay:true,
        navplayvideoimage:"play-32-32-0.png",
        navpreviewheight:60,
        timerheight:2,
        shownumbering:false,
        skin:"Elegant",
        textautohide:true,
        addgooglefonts:true,
        navshowplaypause:false,
        navshowplayvideo:false,
        navshowplaypausestandalonemarginx:8,
        navshowplaypausestandalonemarginy:8,
        navbuttonradius:0,
        navthumbnavigationarrowimageheight:32,
        navpreviewarrowheight:8,
        showshadow:false,
        navfeaturedarrowimagewidth:16,
        navpreviewwidth:120,
        googlefonts:"Inder",
        textpositionmarginright:24,
        bordercolor:"#ffffff",
        navthumbnavigationarrowimagewidth:32,
        navthumbtitlehovercss:"text-decoration:underline;",
        arrowwidth:32,
        texteffecteasing:"easeOutCubic",
        texteffect:"fade,slide",
        navspacing:4,
        navarrowimage:"navarrows-28-28-0.png",
        ribbonimage:"ribbon_topleft-0.png",
        navwidth:28,
        showribbon:false,
        arrowtop:50,
        timeropacity:0.6,
        navthumbnavigationarrowimage:"carouselarrows-32-32-0.png",
        navshowplaypausestandalone:false,
        navpreviewbordercolor:"#ffffff",
        ribbonposition:"topleft",
        navthumbdescriptioncss:"display:block;position:relative;padding:2px 4px;text-align:left;font:normal 12px Arial,Helvetica,sans-serif;color:#333;",
        navborder:4,
        navthumbtitleheight:20,
        textpositionmargintop:24,
        navswitchonmouseover:false,
        playvideoimage:"playvideo-64-64-0.png",
        arrowimage:"arrows-32-32-0.png",
        textstyle:"dynamic",
        playvideoimageheight:64,
        navfonthighlightcolor:"#666666",
        showbackgroundimage:false,
        navpreviewborder:4,
        navopacity:0.8,
        shadowcolor:"#aaaaaa",
        navbuttonshowbgimage:true,
        navbuttonbgimage:"navbuttonbgimage-28-28-0.png",
        textbgcss:"display:block; position:absolute; top:0px; left:0px; width:100%; height:100%; background-color:#333333; opacity:0.6; filter:alpha(opacity=60);",
        playvideoimagewidth:64,
        bottomshadowimagewidth:110,
        showtimer:true,
        navradius:0,
        navshowpreview:true,
        navmarginy:16,
        navmarginx:16,
        navfeaturedarrowimage:"featuredarrow-16-8-0.png",
        navfeaturedarrowimageheight:8,
        navstyle:"numbering",
        textpositionmarginleft:24,
        descriptioncss:"display:block; position:relative; margin-top:4px; font:14px Inder,Arial,Tahoma,Helvetica,sans-serif; color:#fff;",
        navplaypauseimage:"navplaypause-28-28-0.png",
        backgroundimagetop:-10,
        arrowstyle:"none",
        timercolor:"#ffffff",
        numberingformat:"%NUM/%TOTAL ",
        navfontsize:12,
        navhighlightcolor:"",
        navimage:"bullet-24-24-0.png",
        navheight:28,
        navshowplaypausestandaloneautohide:false,
        navbuttoncolor:"",
        navshowarrow:false,
        navshowfeaturedarrow:false,
        titlecss:"display:block; position:relative; font: 16px Inder,Arial,Tahoma,Helvetica,sans-serif; color:#fff;",
        ribbonimagey:0,
        ribbonimagex:0,
        navshowplaypausestandaloneposition:"bottomright",
        shadowsize:5,
        arrowhideonmouseleave:1000,
        navshowplaypausestandalonewidth:28,
        navshowplaypausestandaloneheight:28,
        backgroundimagewidth:120,
        navcolor:"",
        navthumbtitlewidth:120,
        navpreviewposition:"bottom",
        arrowheight:32,
        arrowmargin:8,
        texteffectduration:1000,
        bottomshadowimage:"bottomshadow-110-95-3.png",
        border:0,
        timerposition:"bottom",
        navfontcolor:"#333333",
        navthumbnavigationstyle:"arrow",
        borderradius:0,
        navbuttonhighlightcolor:"",
        textpositionstatic:"bottom",
        navthumbstyle:"imageonly",
        textcss:"display:block; padding:12px; text-align:left;",
        navbordercolor:"#ffffff",
        navpreviewarrowimage:"previewarrow-16-8-1.png",
        showbottomshadow:true,
        navdirection:"horizontal",
        textpositionmarginstatic:0,
        backgroundimage:"",
        navposition:"bottomright",
        navpreviewarrowwidth:16,
        bottomshadowimagetop:95,
        textpositiondynamic:"bottomleft",
        navshowbuttons:true,
        navthumbtitlecss:"display:block;position:relative;padding:2px 4px;text-align:left;font:bold 14px Arial,Helvetica,sans-serif;color:#333;",
        textpositionmarginbottom:24,
        slide: {
            duration:1000,
            easing:"easeInOutExpo",
            checked:true
        },
        transition:"slide"
    });
});