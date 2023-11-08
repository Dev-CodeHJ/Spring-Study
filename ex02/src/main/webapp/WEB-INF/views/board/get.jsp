<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <div id="wrapper">
        <div id="page-wrapper">
			<div class="row">
		        <div class="col-lg-12">
		            <h1 class="page-header">Board Read</h1>
		        </div>
		        <!-- /.col-lg-12 -->
		    </div>
		    <!-- /.row -->
		    <div class="row">
		        <div class="col-lg-12">
		            <div class="panel panel-default">
		                <div class="panel-heading">Board Read Page</div>
		                <!-- /.panel-heading -->
		                
		                <div class="panel-body">
		                	
		                	<div class="form-group">
	                			<label>Bno</label><input class="form-control" name='bno' value='<c:out value="${board.bno}"/>' readonly="readonly">
	                		</div>
		                	
		                	<div class="form-group">
	                			<label>Title</label><input class="form-control" name='title' value='<c:out value="${board.title}"/>' readonly="readonly">
	                		</div>
	                		
	                		<div class="form-group">
	                			<label>Text area</label>
	                			<textarea class="form-control" rows="3" name='content' readonly="readonly"><c:out value="${board.content}"/></textarea>
	                		</div>
	                		
	                		<div class="form-group">
	                			<label>Writer</label><input class="form-control" name='writer' value='<c:out value="${board.writer}"/>' readonly="readonly">
	                		</div>
	                		
	                		<button data-oper='modify' class="btn btn-default">Modify</button>
	                		<button data-oper='list' class="btn btn-info">List</button>
	                		
	                		<form id='operForm' action="/board/modify" method="get">
	                			<input type='hidden' id='bno' name='bno' value='<c:out value="${board.bno}"/>'>
	                		</form>
		                </div>
		                <!-- /.table-responsive -->
		            </div>
		            <!-- /.panel-body -->
		        </div>
		        <!-- /.panel -->
		    </div>
		    <!-- /.col-lg-6 -->
		    <div class="row">
		        <div class="col-lg-12">
		            <div class="panel panel-default">
		                <div class="panel-heading">
		                	<i class="fa fa-comments fa-fw"></i> Reply
		                </div>
		                <!-- /.panel-heading -->
		                
		                <div class="panel-body">
		                	<ul class="chat">
		                		<li class="left clearfix" data-rno="12">
		                			<div>
		                				<div class="header">
		                					<strong class="primary-font">user00</strong>
		                					<small class="pull-right text-muted">2018-01-01 13:13</small>
		                				</div>
		                				<p>Good job!</p>
		                			</div>
		                		</li>
		                	</ul>
		                </div>
		                <!-- /.table-responsive -->
		            </div>
		            <!-- /.panel-body -->
		        </div>
		        <!-- /.panel -->
		    </div>
          </div>
          <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->
    <%@include file="../includes/footer.jsp" %>
    <script type="text/javascript" src="/resources/js/reply.js"></script>
    <script type="text/javascript">
    	console.log("==============");
    	console.log("JS TEST");
    	
    	var bnoValue = '<c:out value="${board.bno}"/>';
    	var replyUL = $(".chat");
    	
    	function showList() {
    		replyService.replyList({bno:bnoValue}, function(list) {
    			var str = "";
    			if(list == null || list.length == 0) {
    				replyUL.html("");
    				return;
    			}
    			for(var i = 0, len = list.length || 0; i < len; i++) {
    				str += "<li class='left clearfix' data-rno='"+list[i].rno+"'><div><div class='header'><strong class='primary-font'>"+list[i].replyer+"</strong><small class='pull-right text-muted'>"+list[i].replyDate+"</small></div><p>"+list[i].reply+"</p></div></li>";
    			}
    			replyUL.html(str);
    		});
    	}
    	
    	//for replyService add test
    	replyService.add({reply:"JS TEST", replyer:"tester", bno:bnoValue}, function(result){
    			alert("RESULT : " + result);
    		});
    	
    	//for replyList test
    	replyService.replyList({bno:bnoValue}, function(list){
    		for(var i = 0, len = list.length||0; i < len; i++) {
    			console.log(list[i]);
    		}
   		});
    	
    	//댓글 삭제 테스트
    	replyService.remove(29, function(count) {
    		console.log(count);
    		
    		if(count === "success") {
    			alert("REMOVED");
    		}
    	}, function(err) {
    		alert('ERROR....');
    	});
    	
    	//댓글 수정
    	replyService.update({
    		rno : 22,
    		bno : bnoValue,
    		reply : "Modified"
    	}, function(result) {
    		alert("수정 완료....");
    	});
    	
    	//특정 번호 댓글 조회
    	replyService.get(3, function(data) {
    		console.log(data);
    	});
    </script>
    <script type="text/javascript">
    	$(document).ready(function() {
    		var operForm = $("#operForm");
    		$("button[data-oper='modify']").on("click", function(e){
    			operForm.attr("action", "/board/modify").submit();
    		});
    		
    		$("button[data-oper='list']").on("click", function(e){
    			operForm.find("#bno").remove();
    			operForm.attr("action", "/board/list")
    			operForm.submit();
    		});
    	});
    </script>
</body>
</html>