<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../common/include.jsp"/>
<body>
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<jsp:include page="../common/head.jsp"/>
		</div>
	</div>
	<div class="row" style="padding-top: 45px;">
		<div class="col-md-3">
			<jsp:include page="../common/menu.jsp"/>
		</div>
		<div class="col-md-9">
			<jsp:include page="../common/breadcrumbs.jsp"/>
			<div>
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">${actionName }</h3>
					</div>
					<div class="panel-body">
						<form class="form-horizontal" role="form" method="post"  action="${pageContext.request.contextPath}/department/save" onsubmit="return checkForm()" >
					<div class="form-group">
						<label  class="col-md-2 control-label">部门编号：</label>
						<div class="col-md-10">
							<input type="text" class="form-control" id="department_id"  name="department_id" style="width: 300px;"  value="${department.id }" >
						</div>
					</div>	
		            <div class="form-group">
						<label  class="col-md-2 control-label">部门名字：</label>
						<div class="col-md-10">
							<input type="text" class="form-control" id="department_name"  name="department_name" style="width: 300px;"  value="${department.name }" >
						</div>
					</div>
					<div class="form-group">
						<label  class="col-md-2 control-label">部门职能：</label>
						<div class="col-md-10">
							<input type="text" class="form-control" id="department_function"  name="department_function" style="width: 300px;"  value="${department.function }" >
						</div>
					</div>
					<div class="form-group">
						<label  class="col-md-2 control-label">部门描述：</label>
						<div class="col-md-10">
							<input type="text" class="form-control" id="department_description"  name="department_description" style="width: 300px;"  value="${department.description }" >
						</div>
					</div>
					<div class="form-group">
						<label  class="col-md-2 control-label">创建日期：</label>
						<div class="col-md-10">
							<input type="text" class="form-control" id="department_createTime"  name="department_createTime" style="width: 300px;"  value="${department.createTime }" >
						</div>
					</div>
					
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<button type="submit" class="btn btn-primary">保存</button>&nbsp;&nbsp;
									<button type="button" class="btn btn-primary" onclick="resetValue()">重置</button>&nbsp;&nbsp;
									<font color="red" id="error"></font>
								</div>
							</div>
						</form>
					</div>
				</div>
				<nav >
					<ul class="pagination">
						${pageCode }
					</ul>
				</nav>
			</div>

		</div>
	</div>

	<div class="row">
		<div class="col-md-12">
			<jsp:include page="../common/foot.jsp"/>
		</div>
	</div>
</div>
</body>
</html>

<script type="text/javascript">
	function checkForm(){
		var department_name=$("#department_name").val();
		var trueName=$("#trueName").val();
		var stuNo=$("#stuNo").val();
		var professional=$("#professional").val();
		if(department_name==null||department_name==""){
			$("#error").html("部门名称不能为空！");
			return false;
		}

		return true;
	}
	
	function resetValue(){
		$("#department_name").val("");
		$("#department_function").val("");

    }
</script>


