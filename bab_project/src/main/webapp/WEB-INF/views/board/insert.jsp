<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/reset.css">
<meta charset="UTF-8">
    <title>공지사항 글쓰기</title>
    <!-- 테이블 -->
    <style>
    	.y_insert_table {
    		width: 100%;
    		border-top: 1px solid lightgray;
    		border-collapse: collapse;
    		text-align: center;
    	}
    	
    	.y_insert_td, y_insert_tr {
    		border-bottom: 1px solid lightgray;
    		border-left: 1px solid lightgray;
    		padding: 10px;
  		}
  		
  		.y_insert_td:first-child {
   		 	border-left: none;
 		}
 		
  		.ck.ck-content{
 			height: 350px;
 		} 
 		
    	
    </style>
    
  </head>
  <body>
  
    <div class="row" style="margin: 0 25px;">
		<div class="col-lg-12" >
			<h1 class="page-header">글쓰기</h1>
		</div>
		
		<hr>
	</div>
    <button class="btn btn-secondary" id="y_btn_back" style="margin: 30px 20px 10px;">목록</button>
	
    <div style="margin-left: 20px;">
    <form action="" method="POST">
    	<table class="y_insert_table">
    		<tr class="y_insert_tr">
    			<td class="y_insert_td">제목</td>
    			<td class="y_insert_td"><input type="text" class="form-control"></td>
    		</tr>
			<tr class="y_insert_tr">
				<td class="y_insert_td">작성자</td>
				<td class="y_insert_td"><input type="text" class="form-control" value="아무개" name="name" readonly></td>
			</tr>    		
    		<tr class="y_insert_tr">
    			<td class="y_insert_td">내용</td>
    			<td class="y_insert_td"><textarea name="text" id="editor" style="margin: 10px; height: 200px; resize: none;"></textarea></td>
    		</tr>
    	</table>
    	<button class="btn btn-primary" id="y_btn_insertDo" style="margin-top: 10px;">확인</button>
    </form>
    </div>
    
    
    <script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
    <script>
      ClassicEditor.create( document.querySelector( '#editor' ) );
    </script>
    <script>
    $("#y_btn_back").click(function(){
    	$("#menu_board").get(0).click();
    });
    
    </script>
    
  </body>
</html>