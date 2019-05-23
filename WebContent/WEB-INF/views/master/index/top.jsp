<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
h1{
   font-family: 'Cute Font', cursive;
   font-size: 60px;
   font-weight: 700;
}
h4{
   font-family: 'Cute Font', cursive;
   font-size: 40px;
   font-weight: 600;
}

</style>
<!DOCTYPE html>


<div id="myCarousel" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
          <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
          <li data-target="#myCarousel" data-slide-to="1"></li>
          <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img class="first-slide" src="${pageContext.servletContext.contextPath }/image/to.jpg" alt="First slide">
            <div class="container">
              <div class="carousel-caption text-left" style="color:black ">
                <p><a class="btn btn-lg btn-success" href="${pageContext.servletContext.contextPath }/together/mainboard.do?p=1" role="button">Click to 같이가시개</a></p>
              </div>
            </div>
          </div>
          <div class="carousel-item">
            <img class="second-slide" src="${pageContext.servletContext.contextPath }/image/parcel.jpg" alt="Second slide">
            <div class="container">
              <div class="carousel-caption text-left " style="color:maroon;">
                <p><a class="btn btn-lg btn-warning" href="${pageContext.servletContext.contextPath }/parcel.do" role="button">Click to 데려가시개</a></p>
              </div>
            </div>
          </div>
          <div class="carousel-item">
            <img class="third-slide" src="${pageContext.servletContext.contextPath }/image/find.jpg" alt="Third slide">
            <div class="container">
              <div class="carousel-caption text-left">
                <p><a class="btn btn-lg btn-info" href="${pageContext.servletContext.contextPath }/find/list.do" role="button">Click to 찾아주시개</a></p>
              </div>
            </div>
          </div>
        </div>
        <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      
      </div>