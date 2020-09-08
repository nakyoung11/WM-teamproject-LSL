<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="true"%>
<%@ page import= "java.util.*" %>
<%@ page import= "com.lsl.wm.vo.WorkVO" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>등록 페이지1</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.0.0/animate.min.css"
  />
</head>
<style>
body{ background: #F9F9F9}
#container{
    position: relative;
    width: 1382px;
    height: 1356px;
    left: calc(50% - 1382px/2);
    top: calc(50% - 1356px/2 + 42px);
    
}
#header {
    position: fixed;
    width: 1440px;
    height: 215px;
    left: calc(50% - 1440px/2);
    top: 0px;
    background: #F9F9F9;
    z-index: 9999;
}
#contents {
       
    position: absolute;
    width: 907px;
    height: 620px;
    right: 99px;
    top: calc(53% - 633px/2 + 41px);
            
}
#footer {
    position: absolute;
    width: 1382px;
    height: 78px;
    left: 0px;
    top: 870px;
}

#logo {
    position: relative;
    width: 30%;   
}
#login {
    position: absolute;
    width: 88.15px;
    height: 47px;
    left: 1221px;
    top: 43px;

  }
.menu{
    position: absolute;
    width: 837px;
    height: 51px;
    left: 433px;
    top: 110px;
 

}

.menu ul {  
    list-style: none;
 
}


.menu li {    
    float: left;
    margin-left: 5%;
    font-size: 1.5em;
    font-weight: bold;
    margin-top: 5%;
    margin-bottom: 2%;
    cursor: pointer;
}
.menu li:first-child{
    margin-left: 13%;
}

hr {

    width: 912px;
    height: 0px;
    left: 397px;
    top: 199px;
    
    border: 2px solid rgba(39, 47, 89, 0.29);
    box-shadow: 0px 3px 5px rgba(0, 0, 0, 0.1);


}
    /*----------------------- 추가 사항 ----------------- */
    #exhibit_list {
        width: 100%;
        margin: 5% auto;
    }

    #exhibit_list table {
        border-collapse: separate;
        width: 100%;
        height: 280px;
        margin-bottom: 5%;
    }
    #exhibit_list table:nth-last-child(1) {
        animation: fadeInDown;
        animation-duration: 1s;
    }

    #exhibit_list table tr:nth-child(1) td:nth-child(1) {
        width: 7%;
    }

    #exhibit_list table td:nth-child(1) button {
        border-style: none;
        background-color: rgb(241, 113, 113);
        color: white;
        font-weight: bold;
        text-align: center;
        font-size: 2em;
        padding-bottom: 10%;
        border-radius: 50%;
        cursor: pointer;
    }
    #exhibit_list table td:nth-child(1) button:hover {
        background-color: rgb(214, 18, 18);
        transition-duration: 0.7s;
    }

    #exhibit_list table td:nth-child(2) {
        position: relative;
        width: 25%;
    }

    #exhibit_list table td:nth-child(2) div {
        position: absolute;
        top: 0;
        width: 90%;
        height: 100%;
        background-image: url(/image/main.png);
        background-size: 100% 100%;
        cursor: pointer;
        display: table;
    }
    #exhibit_list table td:nth-child(2) div:hover {
        opacity: 0.8;
        transition-duration: 0.5s;
    }

    #exhibit_list table td:nth-child(2) div span {
        text-align: center;
        display: table-cell;
        vertical-align: middle;
        font-size: 1.5em;
        font-weight: bold;
        color: black;
        opacity: 0%;
    }
    #exhibit_list table td:nth-child(2) div span:hover {
        text-align: center;
        display: table-cell;
        vertical-align: middle;
        font-size: 1.5em;
        font-weight: bold;
        color: black;
        opacity: 100%;
    }

    #exhibit_list table td:nth-child(3) {
        width: 12%;
        height: 5%;
        text-align: center;
        font-size: 1.2em;
        background-color: #DCD3C0;
        border: 0;
        margin: 0;
        font-weight: bolder;
    }

    #exhibit_list table td:nth-child(4) {
        position: relative;
        border: 0;
        width: 100%;
        background-color: rgba(235, 230, 230, 0.5);
    }

    #exhibit_list table td:nth-child(4) input {
        position: absolute;
        top: 0;
        left: 5%;
        border: 0;
        font-size: 1.5em;
        font-weight: bold;
        width: 90%;
        height: 100%;
        background-color: rgba(235, 230, 230, 0.5);
    }

    #exhibit_list table tr:nth-child(2) td:nth-child(1) {
        background-color: rgba(255, 255, 255, 0.37);
        text-align: center;
        font-size: 1.2em;
        font-weight: bold;
    }

    #exhibit_list table tr:nth-child(2) td:nth-child(2) {
        position: relative;
        background-color: #FAF7F1;
        width: 100%;
        height: 150px;
        font-weight: bold;
        border: 0;
        padding: 0;
    }

    #exhibit_list table tr:nth-child(2) td:nth-child(2) textarea {
        position: absolute;
        top: 5%;
        left: 5%;
        width: 90%;
        height: 90%;
        resize: none;
        background-color: #FAF7F1;
        font-weight: bolder;
        font-size: 2em;
        border: 0;
    }

    #add_work_btn {
        display: block;
        border: none;
        width: 85px;
        height: 85px;
        border-radius: 50%;
        background-color: #ACA6CF;
        font-size: 4.5em;
        color: white;
        margin: 0% auto;
        cursor: pointer;
    }
    #add_work_btn:hover {
        transition-duration: 0.7s;
        background-color: #5a5095;
    }

    #exhibit_work_btn {
        display: block;
        border: none;
        width: 150px;
        height: 65px;
        border-radius: 10px;
        background-color: #92809B;
        font-size: 140%;
        padding: 0% 0%;
        color: white;
        margin: 10% auto;
        cursor: pointer;
    }
    #exhibit_work_btn:hover {
        transition-duration: 0.7s;
        background-color: #70348e;
    }

    input:focus {
        outline: none;
    }

    textarea:focus {
        outline: none;
    }

    button:focus {
        outline: none;
    }
</style>
<body>
    <div id="container">
        <div id="header">
            <nav>
                <div class="top">
                    <a href="#"><img src="/image/logo.png" id="logo"></a>
                    <a href="#"><img src="/image/login.png" id="login"></a>
                    <div class="menu">
                        <ul>
                            <li id="m1">전시일정</li>
                            <li id="m2">기관소개</li>
                            <li id="m3">커뮤니티</li>
                            <li id="m4">이전전시</li>
                            <li id="m5">마이페이지</li>
                            <hr>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
        <div id="contents">
            <form action="/writer/exhibit_page2" method="POST" name="exhibit_frm" accept-charset="UTF-8">
            	<input type="hidden" name="exhibit_list_cnt" id="exhibit_list_cnt">
                <div id="exhibit_list">
                    <table>
                        <tr>
                            <td rowspan="2"><button id="min_work_btn_">－</button></td>
                            <td rowspan="2">
                                <div id="input_painting_"><span>이미지 등록/수정</span></div>
                            </td>
                            <td>제목</td>
                            <td><input type="text" name="input_title_" id="input_title_"></td>
                        </tr>
                        <tr>
                            <td>작품설명</td>
                            <td><textarea name="input_comment_" id="input_comment_"></textarea></td>
                        </tr>
                    </table>
                </div>
                <button id="add_work_btn" onclick='insert_work_info();return false;'>+</button>
            </form>
            <button id="exhibit_work_btn" onclick="submit_exihibit()">출품하기</button>
        </div>
        <div id="footer">
            <h3>푸터 영역</h3>
        </div>
    </div>
    <script>
    	/*서블릿의 작품 리스트를 받아온다.*/
    	<%List<WorkVO> list = (List)request.getAttribute("workList");%>
    	
        /*작품 정보 객체 생성*/
        function work_info(painting, title, comment) {
            this.painting = painting;
            this.title = title;
            this.comment = comment;
        }

        /*작품 정보 배열 생성*/
        var work_info_arr = [];
        
        /*서블릿에서 받아온 list를 저장한다.*/
      <%for(int i=0; i<list.size(); i++) {%>
    	   work_info_arr.push(new work_info("/image/entries/<%=list.get(i).getPainting()%>", "<%=list.get(i).getTitle()%>", "<%=list.get(i).getComment()%>"));
       <%}%>
        /*작품정보를 받아와 콘텐츠영역안에 테이블을 생성하여 보여주는 함수*/
        function display_work_info(param_arr) {
            var exhibit_list = document.getElementById('exhibit_list');
            exhibit_list.innerHTML = "";
            for (var i = 0; i < param_arr.length; i++) {
                var table = document.createElement('table');
                table.innerHTML = `<tr><td rowspan="2"><button id="min_work_btn_${i}" onclick="delete_work_info(${i}); return false;">－</button></td><td rowspan="2"><div id="input_painting_${i}" onclick="document.all.file${i}.click()" style="background-image:url(${param_arr[i].painting})"><input type="file" name="file${i}" id="file${i}" style="display:none" accept="image/*" onchange="update_painting(${i})"><span>이미지 등록/수정</span></div></td><td>제목</td><td><input type="text" name="input_title_${i}" id="input_title_${i}" value="${param_arr[i].title}"></td></tr><tr><td>작품설명</td><td><textarea name="input_comment_${i}" id="input_comment_${i}">${param_arr[i].comment}</textarea></td></tr>`;
                exhibit_list.append(table);
            }
        }

        /*현재 까지의 입력사항을 저장하는 함수*/
        function save_frocess() {
            for (var i = 0; i < work_info_arr.length; i++) {
                var title = document.getElementById(`input_title_${i}`).value;
                var comment = document.getElementById(`input_comment_${i}`).value;
                work_info_arr[i].title = title;
                work_info_arr[i].comment = comment;
            }
        }

        /*현재 까지의 입력사항을 검사하는 함수*/
        function check_frocess() {
            save_frocess(work_info_arr);
            for (var i = 0; i < work_info_arr.length; i++) {
                if(work_info_arr[i].title.replace(/\s| /gi, "").length == 0 ||  work_info_arr[i].comment.replace(/\s| /gi, "").length == 0 || work_info_arr[i].painting.replace(/\s| /gi, "").length == 0){
                    return false;
                }
            }
            return true;
        }

        /*작품 목록을 지우는 함수*/
        function delete_work_info(idx) {
            /*지울 작품의 타이틀을 가져옴*/
            var title = document.getElementById(`input_title_${idx}`).value;
            /*삭제확인*/
            if(confirm(`제목: ${title} \n삭제하시겠습니까?`))
            {
                /*현재 까지의 입력 정보를 배열에 저장*/
                save_frocess(work_info_arr);
                work_info_arr.splice(idx, 1);
                display_work_info(work_info_arr);
            }
            
        }

        /*추가버튼을 눌렀을시 공백의 입력란을 만들어주는 함수*/
        function insert_work_info() {
            /*현재 까지의 입력 정보를 배열에 저장*/
            save_frocess();
            work_info_arr.push(new work_info("", "", ""));
            display_work_info(work_info_arr);
        }

        /*이미지 선택시 이미지 변경*/
        function update_painting(idx) {
            var painting = "/image/entries/" + document.getElementById(`file${idx}`).value.substring(document.getElementById(`file${idx}`).value.lastIndexOf("\\") + 1);
            work_info_arr[idx].painting = painting;
            save_frocess();
            display_work_info(work_info_arr);
        }

        /*출품하기 버튼 눌렀을때 페이지 이동하는 페이지*/
        function submit_exihibit(){
        	
            if(check_frocess()){
                alert('출품완료');
                for(var i=0; i<work_info_arr.length; i++){
                 console.log(work_info_arr[i]);
                }
                document.getElementById('exhibit_list_cnt').value = work_info_arr.length;
                alert(document.getElementById('exhibit_list_cnt').value);
                document.exhibit_frm.submit();
            }else {
                alert('작성이 완전치 않은 테이블이 존재합니다.\n작성 혹은 삭제 해주세요.');
            }
        }

        display_work_info(work_info_arr);
    </script>
</body>

</html>