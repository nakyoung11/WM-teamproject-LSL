<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>나의 전시회관리</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.0.0/animate.min.css" />
</head>
<style>
#headerWrap {
   flex: 1
}
body {
   padding-top: 250px;
}
#container {
   display: flex;
   width: 1000px;
   margin-bottom: 400px;
   justify-content: center;
   align-content: center;
   font-family: 'Noto Sans KR', sans-serif;
   font-weight: 300;
   flex: 1;
   background-image:
}
#contents {
   display: flex;
   flex-flow: column;
   flex: 1;
   height: 100%;
}
/*----------------------- 추가 사항 ----------------- */
table{border-bottom: 1px solid #765D9E;}

.ex_title{   
	 flex: 1;
    width: 217px;
    height: 56px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}
.title_{
    flex: 1;
    height: 56px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    cursor: default;
    /* width: 100px; */
    height: 31px;}

#my_exihibit {

   width: 100%;
   margin: 0 auto;
}
#my_exihibit div:nth-child(1)>.material-icons {
   font-size: 30px;
   color: red;
}
#my_exihibit div:nth-child(1) table {
   width: 100%;
}
#my_exihibit div:nth-child(1) table tr td:nth-child(2) {
   width: 30%;
   text-align: center;
   font-size: 20px;
   padding: 7%;
   padding-bottom: 30%;
   padding-top: 10%;
   font-weight: bold;
   background-color: #F7F9EE;
   ;
}
#my_exihibit div:nth-child(1) table tr td:nth-child(3) {
   position: relative;
   padding: 0;
   margin: 0;
}
#my_exihibit div:nth-child(1) table tr td:nth-child(3) ul {
   position: absolute;
   top: 0;
   height: 100%;
   width: 100%;
   padding: 0;
   margin: 0;
   list-style-type: none;
}
#my_exihibit div:nth-child(1) table tr td:nth-child(3) ul li {
   display: flex;
   flex-flow: row nowrap;
   align-items: center;
   position: relative;
   font-weight: bold;
   font-size: 20px;
   padding: 1%;
   padding-left: 2%;
   animation: fadeInDown;
   animation-duration: 0.7s;
}
#my_exihibit div:nth-child(1) table tr td:nth-child(3) ul li:hover {
   background-color: #C4C4C4;
   transition-duration: 1s;
}
#my_exihibit div:nth-child(1) table tr td:nth-child(3) ul li #mod_exhibit
   {
   position: absolute;
   right: 120px;
   top: 20%;
   font-size: 20px;
   height: 100%;
   border: 0;
   outline: 0;
}
#my_exihibit div:nth-child(1) table tr td:nth-child(3) ul li #del_exhibit
   {
   position: absolute;
   right: 20px;
   top: 20%;
   font-size: 20px;
   height: 100%;
   border: 0;
   outline: 0;
}
.title {
   display: flex; flex-flow: row nowrap; padding: 10px;
}
/* 두번째 테이블 */
#my_exihibit div:nth-child(2) {
   margin-bottom: 5%;
}
#my_exihibit div:nth-child(2) table {
   width: 100%;
}
#my_exihibit div:nth-child(2) table tr td:nth-child(2) {
   width: 30%;
   text-align: center;
   font-size: 20px;
   padding: 10px;
   padding-bottom: 5%;
   padding-top: 5%;
   font-weight: bold;
   
   ;
}
#my_exihibit div:nth-child(2) table tr td:nth-child(3) {
   position: relative;
   padding: 25px;
   margin: 0;
}
#my_exihibit div:nth-child(2) table tr td:nth-child(3) ul {
   top: 0%;
   height: 100%;
   width: 100%;
   padding: 0;
   margin: 0;
   list-style-type: none;
}
#my_exihibit div:nth-child(2) table tr td:nth-child(3) ul li {
      display: flex;
    flex-flow: row nowrap;
    align-items: center;
    width: 96%;
    height: 100%;
    font-weight: bold;
    font-size: 20px;
    /* padding: 0.3% 2%; */
    /* margin-top: 2%; */
    animation: fadeInDown;
    animation-duration: 1s;
    width: 96%;
}
}
.title {
   font-size: 24px
}
.title>h4{align-self: flex-start; flex: 1}
.title>a{align-self: flex-end;}
.Reg_remove>a:hover{color:red;}
.like_cmt {
   display: flex;
   justify-content: center;
   align-items: center;
   margin-right: 30px;
}
.remove_reg{margin-top: 20px}
.remove_reg>a{font-size: 13px; background: #82629E; color:#FCF1E7;padding: 10px; border-radius: 30px} 
.like_cmt>span{margin: 5px}
#my_exihibit div:nth-child(2) table tr td:nth-child(3) ul li:hover {
   background-color: #C4C4C4;
   cursor: pointer;
   transition-duration: 1s;
}
#my_exihibit div:nth-child(2) table tr td:nth-child(3) ul li span:nth-child(1)
   {
   float: left;
   width: 80%;
   margin-top: 4%;
}
#my_exihibit div:nth-child(2) table tr td:nth-child(3) ul li #cnt_div {

   width: 100%
}
.work_title{
   width:260px;
   height:30px;     
   overflow:hidden;
    text-overflow:ellipsis;
    white-space:nowrap;}
    
.a {
text-align:center;
line-height:40px;
	width: 100px;
	height: 40px;
	background: #A08DD6;
	border-radius: 10px;
	color:#F73028;
}    
</style>

<body>
   <jsp:include page="../../header.jsp"></jsp:include>
   <div id="container">
      <div id="contents">
         <div id="my_exihibit">

            <div class="title">
               <h4>전시 및 작품 관리</h4>
               <div class="a"><a href="/exhibit_page0">전시회 열기</a></div>
            </div>
          
            <div id="title_div"></div>



         </div>
      </div>
   </div>
   <jsp:include page="../../footer.jsp"></jsp:include>

	<script>	
	/*작품 정보 생성자함수(자바의 클래스 개념) 선언*/
	/*출품신청 목록*/
    function ExhibitWorkInfo(title) {
        this.title = title;
    }
	/*전시 목록*/
    function ExhibitionWorkInfo(title, like_cnt, cmt_cnt) {
        this.title = title;
        this.like_cnt = like_cnt;
        this.cmt_cnt = cmt_cnt;
    }
   
    /*작품정보를 받아와 콘텐츠영역안에 테이블을 생성하여 보여주는 함수*/
     // 출품한 작품목록
        function displayExhibitWorkInfo() {
        	var i = 0;
        	var tempI_show;
        	var tempWorkCnt;
        	
        	<c:forEach items="${showList}" var="item">
        	tempI_show = ${item.i_show};
        	tempWorkCnt = ${item.workCnt}
        	console.log("asdasdasd: " + tempI_show);
        	
        	title = document.getElementById("title_div");
    		var table = document.createElement('table');
    		table.innerHTML = `<input type="hidden" id="workCnt_idx_\${i}" value="\${tempWorkCnt}">
    			<input type="hidden" id="i_show_idx_\${i}" value="\${tempI_show}">
    			<tr>
    			<td><a href="#" class="material-icons" style="font-size:30px; color:red" onclick="doShowRemove(\${tempI_show})">remove_circle_outline</a> </td>
				<td>${item.show_title}	
				<div class="remove_reg">
				
				<a href="#" onclick="doShowAdd(\${i})">작품 추가</a><div>
				</td>
			
				<td>
					<ul id="exhibit_list_\${i}">
					</ul>
				</td>
			</tr>
			`;
			title.append(table);
			
			var j = 0;
            var exhibitList = document.getElementById(`exhibit_list_\${i}`);
            exhibitList.innerHTML = "";
            <c:forEach items="${item.showDomainList}" var="item2">
            	
                var li = document.createElement('li');
                li.innerHTML = `
                <input type="hidden" id="i_show_idx_\${i}\${j}" value="\${tempI_show}">
                <input type="hidden" id="i_work_idx_\${i}\${j}" name="i_work_idx_\${i}\${j}" value="${item2.i_work}">
                <div class="ex_title">
                <span style="cursor: default" id="work_title_idx_\${i}\${j}" class="title_">\${j+1}.${item2.work_title}</span>
                </div>
                <div class="like_cmt">
                <span class="material-icons">favorite</span><span>${item2.like_cnt}</span>
                <span class="material-icons">insert_comment</span><span>${item2.cmt_cnt}</span>
                </div>
                <div class="Reg_remove">
                <a id="mod_exhibit" style="cursor: pointer" onclick="modExhibit('\${i}\${j}')">수정</a>
                <a id="del_exhibit" style="cursor: pointer" onclick="delExhibit('\${i}\${j}')">삭제</a></div>`;
                exhibitList.append(li);
                j++;
            	</c:forEach>
            	i++;
            </c:forEach>
        }
  
	/*출품신청 작품 수정/삭제 하는 함수*/
    function delExhibit(i){
    	var i_show = document.getElementById(`i_show_idx_\${i}`).value;
    	var title = document.getElementById(`work_title_idx_\${i}`).innerHTML;
        if(confirm(`제목: \${title}\n삭제하시겠습니까?`)){
        	var form = document.createElement('form'); // 폼객체 생성
        	var objs;
        	objs = document.createElement('input'); // 값이 들어있는 녀석의 형식
        	objs.setAttribute('type', 'text'); // 값이 들어있는 녀석의 type
        	objs.setAttribute('name', 'i_work'); // 객체이름
        	objs.setAttribute('value', document.getElementById(`i_work_idx_\${i}`).value); //객체값
        	form.appendChild(objs);
        	var objs2;
        	objs2 = document.createElement('input'); // 값이 들어있는 녀석의 형식
        	objs2.setAttribute('type', 'text'); // 값이 들어있는 녀석의 type
        	objs2.setAttribute('name', 'i_show'); // 객체이름
        	objs2.setAttribute('value', i_show); //객체값
        	form.appendChild(objs2);
        	form.setAttribute('method', 'post'); //get,post 가능
        	form.setAttribute('action', "/exhibit_page2"); //보내는 url
        	document.body.appendChild(form);
        	form.submit();
            
        }
    }
    function modExhibit(i){
        if(confirm('수정 페이지로 이동하시겠습니까?')){
        	var i_show = document.getElementById(`i_show_idx_\${i}`).value;
        	console.log("아이쇼 " + i_show);
        	var i_work = document.getElementById(`i_work_idx_\${i}`).value;
            location.href = "/exhibitRegPage?i_work=" + i_work + "&i_show=" + i_show;
        }
       
    }
    function movePage(idx) {
        alert('페이지 이동Index :' + idx);
    }
    
  //전시회 삭제 함수
    function doShowRemove(i_show) {
    	
    	var form = document.createElement('form'); // 폼객체 생성
    	var objs;
    	objs = document.createElement('input'); // 값이 들어있는 녀석의 형식
    	objs.setAttribute('type', 'text'); // 값이 들어있는 녀석의 type
    	objs.setAttribute('name', 'i_show'); // 객체이름
    	objs.setAttribute('value', `\${i_show}`); //객체값
    	form.appendChild(objs);
    	form.setAttribute('method', 'post'); //get,post 가능
    	form.setAttribute('action', "/exhibit_page2"); //보내는 url
    	document.body.appendChild(form);
    	form.submit();
    }
    
    //전시회 삭제 함수
    function doShowRemove(i_show) {
    	if(confirm("전시회는 삭제 후 복구 되지 않습니다.\n 정말 삭제 하시겠습니까?")){
    		var form = document.createElement('form'); // 폼객체 생성
        	var objs;
        	objs = document.createElement('input'); // 값이 들어있는 녀석의 형식
        	objs.setAttribute('type', 'text'); // 값이 들어있는 녀석의 type
        	objs.setAttribute('name', 'i_show'); // 객체이름
        	objs.setAttribute('value', `\${i_show}`); //객체값
        	form.appendChild(objs);
        	form.setAttribute('method', 'post'); //get,post 가능
        	form.setAttribute('action', "/exhibit_page2"); //보내는 url
        	document.body.appendChild(form);
        	form.submit();
    	}
    }
    //전시회 추가 함수
    function doShowAdd(i) {
    	var workCnt = document.getElementById('workCnt_idx_' + i).value;
    	var i_show = document.getElementById('i_show_idx_' + i).value;
    	
    	if(workCnt >= 25){
    		alert('25개 이상은 작품을 등록할 수 없습니다.');
    	}else{
    		location.href = "/exhibit_page1?i_show=" + i_show; 	
    	}
    }
    
    //엔터 적용 안되게
    document.addEventListener('keydown', function(event) {
    	  if (event.keyCode === 13) {
    	    event.preventDefault();
    	  };
    	}, true); 
    
    displayExhibitWorkInfo();
   
    </script>
</body>

</html>