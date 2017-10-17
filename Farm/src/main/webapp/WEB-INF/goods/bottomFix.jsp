<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
html {  overflow: hidden;  }
html, body { width: 100%; height: 100%; margin: 0; padding: 0;}
#wrapper{  width: 100%; height: 100%; position: absolute; overflow-y:scroll;}

#content { 
    width: 100%; height: 1000px; 
    margin-left: -17px; /* 우측 스크롤바가 보여야 하므로 17px만큼 외쪽으로 땡겨주기 */
    padding-left: 17px; /* 좌측으로 들어간만큼 패딩값 지정 */
    }

#footer { 
    overflow: hidden;
    position: absolute;
    bottom: 0; 
    height: 50px; width:100%; text-align: center;
    margin-left:0px; margin-bottom:-1px;
    }

</style>

	
<div id="footer">
	<button id="bottom_home" class="btn grey darken-3 white-text"><i class="material-icons left">홈</i></button>
	<button id="bottom_order" class="btn yellow accent-2 black-text">구매하기</button>
</div>