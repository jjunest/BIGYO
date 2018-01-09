<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href='resources/css/fullcalendar.min.css' rel='stylesheet' />
 <link href='resources/css/fullcalendar.print.min.css' rel='stylesheet' media='print' /> 
 
<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 900px;
    margin: 0 auto;
  }

</style>


</head>
<body>
  <div id='calendar'></div>
   <script src="resources/plugins/jquery/jquery.min.js"></script>
	<script src="resources/plugins/jquery-ui/jquery-ui.min.js"></script>
	<script src="resources/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/plugins/smoothscroll/SmoothScroll.min.js"></script>
	<script src="resources/plugins/waypoints/waypoints.min.js"></script>
	<script src="resources/plugins/counter-up/jquery.counterup.min.js"></script>
	<script src="resources/plugins/datepicker/bootstrap-datepicker.min.js"></script>
	<script src="resources/plugins/selectbox/jquery.selectbox-0.1.3.min.js"></script>
	<script src="resources/plugins/owl-carousel/owl.carousel.min.js"></script>
	<script src="resources/plugins/isotope/isotope.min.js"></script>
	<script src="resources/plugins/fancybox/jquery.fancybox.pack.js"></script>
	<script src="resources/plugins/isotope/isotope-triger.min.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBEDfNcQRmKQEyulDN8nGWjLYPm8s4YB58"></script>
	<script src="resources/plugins/map/js/rich-marker.js"></script>
	<script src="resources/plugins/map/js/infobox_packed.js"></script>
	<script src="resources/js/single-map.js"></script>
	<script src="resources/js/map.js"></script>
	<script src="resources/js/custom.js"></script>
	<script src='resources/js/moment.min.js'></script> 
<script src='resources/js/fullcalendar.min.js'></script>
<script>

  $(document).ready(function() {

    $('#calendar').fullCalendar({
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month,basicWeek,basicDay'
      },
      defaultDate: '2017-12-12',
      navLinks: true, // can click day/week names to navigate views
      editable: true,
      eventLimit: true, // allow "more" link when too many events
      events: [
        {
          title: 'All Day Event',
          start: '2017-12-01'
        },
        {
          title: 'Long Event',
          start: '2017-12-07',
          end: '2017-12-10'
        },
        {
          id: 999,
          title: 'Repeating Event',
          start: '2017-12-09T16:00:00'
        },
        {
          id: 999,
          title: 'Repeating Event',
          start: '2017-12-16T16:00:00'
        },
        {
          title: 'Conference',
          start: '2017-12-11',
          end: '2017-12-13'
        },
        {
          title: 'Meeting',
          start: '2017-12-12T10:30:00',
          end: '2017-12-12T12:30:00'
        },
        {
          title: 'Lunch',
          start: '2017-12-12T12:00:00'
        },
        {
          title: 'Meeting',
          start: '2017-12-12T14:30:00'
        },
        {
          title: 'Happy Hour',
          start: '2017-12-12T17:30:00'
        },
        {
          title: 'Dinner',
          start: '2017-12-12T20:00:00'
        },
        {
          title: 'Birthday Party',
          start: '2017-12-13T07:00:00'
        },
        {
          title: 'Click for Google',
          url: 'http://google.com/',
          start: '2017-12-28'
        }
      ]
    });

  });

</script>
</body>
</html>