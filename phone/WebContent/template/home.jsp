<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <c:set var="root" value="${pageContext.request.contextPath }" />
   <script type="text/javascript" src="${root}/js/jquery.js"></script>
   <link rel="stylesheet" href="${root}/css/example.css">
   <link rel="stylesheet" href="${root}/css/font-awesome.min.css">
   <script src="${root}/js/jquery.slides.min.js"></script>
  
  <title>SlidesJS Standard Code Example</title>
  <meta name="description" content="SlidesJS is a simple slideshow plugin for jQuery. Packed with a useful set of features to help novice and advanced developers alike create elegant and user-friendly slideshows.">
  <meta name="author" content="Nathan Searles">

  <!-- SlidesJS Required (if responsive): Sets the page width to the device width. -->
  <meta name="viewport" content="width=device-width">
  <!-- End SlidesJS Required -->
  <style type="text/css">
    body {
      -webkit-font-smoothing: antialiased;
      font: normal 15px/1.5 "Helvetica Neue", Helvetica, Arial, sans-serif;
      color: #232525;
      padding-top:70px;
    }

    #slides {
      display: none
    }

    #slides .slidesjs-navigation {
      margin-top:3px;
    }

    #slides .slidesjs-previous {
      margin-right: 5px;
      float: left;
    }

    #slides .slidesjs-next {
      margin-right: 5px;
      float: left;
    }

    .slidesjs-pagination {
      margin: 6px 0 0;
      float: right;
      list-style: none;
    }

    .slidesjs-pagination li {
      float: left;
      margin: 0 1px;
    }

    .slidesjs-pagination li a {
      display: block;
      width: 13px;
      height: 0;
      padding-top: 13px;
      background-image: url(img/pagination.png);
      background-position: 0 0;
      float: left;
      overflow: hidden;
    }

    .slidesjs-pagination li a.active,
    .slidesjs-pagination li a:hover.active {
      background-position: 0 -13px
    }

    .slidesjs-pagination li a:hover {
      background-position: 0 -26px
    }

    #slides a:link,
    #slides a:visited {
      color: #333
    }

    #slides a:hover,
    #slides a:active {
      color: #9e2020
    }

    .navbar {
      overflow: hidden
    }
</style>
 <script type="text/javascript">
  $(function() {
      $('#slides').slidesjs({
        width: 940,    //--- 슬라이드 넓이 ㅋㅋ
        height: 528,   //--- 높이
        start: 2,        //--- 이미지 시작 번호 4장이 있다면 2번부터 시작
        pagination: {
           active: true    //---false로 하면 페이징이 안보이는듯
        },
        effect: {
           slide: {
              speed: 200       //---슬라이드 스피드겠지?
           },
           fade: {
               speed: 300      //---페이드 스피드... 이게 설명을 하고 있는건가..ㅎㅎ
           }
        },
        play: {         
          active: true,    //--- false로 하니 플에이버튼 안 보임.
          auto: true,     //--- 자동으로 플레이 할것인지 같음.
          interval: 4000,   //--- 이미지 변환 간격이겠지?
          swap: true
        }
      });
    }); 
  </script> 
</head>
<body>

  <!-- SlidesJS Required: Start Slides -->
  <!-- The container is used to define the width of the slideshow -->
  <div class="container">
    <div id="slides">
      <img src="${root}/img/example-slide-1.jpg" alt="Photo by: Missy S Link: http://www.flickr.com/photos/listenmissy/5087404401/">
      <img src="${root}/img/example-slide-2.jpg" alt="Photo by: Daniel Parks Link: http://www.flickr.com/photos/parksdh/5227623068/">
      <img src="${root}/img/example-slide-3.jpg" alt="Photo by: Mike Ranweiler Link: http://www.flickr.com/photos/27874907@N04/4833059991/">
      <img src="${root}/img/example-slide-4.jpg" alt="Photo by: Stuart SeegerLink: http://www.flickr.com/photos/stuseeger/97577796/">
      <a href="#" class="slidesjs-previous slidesjs-navigation"><i class="icon-chevron-left icon-large"></i></a>
      <a href="#" class="slidesjs-next slidesjs-navigation"><i class="icon-chevron-right icon-large"></i></a>
    </div>
  </div>
  <!-- End SlidesJS Required: Start Slides -->

  

  



 
</body>
</html>
