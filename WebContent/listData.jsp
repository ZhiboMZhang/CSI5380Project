<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Show All Data</title>
</head>
<body>
		<table border=1>
				<thead>
					<tr>	
						<th>CDID</th>
						<th>Title</th>
						<th>Price</th>
						<th>Category</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${datas}" var="data">
						<tr>
							<td><c:out value="${data.cdid}"/></td>
			 				<td><c:out value="${data.title}" /></td>
                    		<td><c:out value="${data.price}" /></td>
                   			<td><c:out value="${data.category}"/></td>               
           				</tr>
           			 </c:forEach>
				</tbody>
			</table>
		</body>
</html>