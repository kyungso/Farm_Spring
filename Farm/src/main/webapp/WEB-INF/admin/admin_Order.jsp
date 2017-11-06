<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.0/Chart.bundle.js"></script>

<!-- <link rel="stylesheet" href="//cdn.jsdelivr.net/chartist.js/latest/chartist.min.css">
<script src="//cdn.jsdelivr.net/chartist.js/latest/chartist.min.js"></script> -->


<%-- <canvas id="myChart" width="100" height="100"></canvas>
<script>
var ctx = $("#myChart");
var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],
        datasets: [{
            label: '# of Votes',
            data: [12, 19, 3, 5, 2, 3],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255,99,132,1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero:true
                }
            }]
        }
    }
});

</script> --%>

<div style="width: 50%">
<canvas id="chartjs-0" class="chartjs" width="271" height="135" ></canvas>
</div>
<script>
 new Chart(document.getElementById("chartjs-0"),
	{
	 "type":"line",
	 "data":{
		 "labels":["January","Febuary","March","April","May","June","July","August","September","October","November","December"],
		 "datasets":[{
			 "label":"쌀/잡곡",
			 "data":[65,59,80,81,56,55,40],
			 "fill":false,
			 "borderColor":"rgb(75,192,192)",
			 "lineTension":0.1
		 },{
			 "label":"과일",
			 "data":[${list.get(0)},${list.get(1)},${list.get(2)},${list.get(3)},${list.get(3)},${list.get(3)},${list.get(3)},0,0,0,0,0],
			 "fill":false,
			 "borderColor":"rgb(255,0,0)",
			 "lineTension":0.1
		 },{
			 "label":"축산물",
			 "data":[30,20,60,70,80,10,20],
			 "fill":false,
			 "borderColor":"rgb(0,253,0)",
			 "lineTension":0.1
		 },{
			 "label":"가공식품",
			 "data":[80,70,60,50,40,30,20],
			 "fill":false,
			 "borderColor":"rgb(254,253,0)",
			 "lineTension":0.1
		 }]
 	  },
	 "options":{}});
</script>

