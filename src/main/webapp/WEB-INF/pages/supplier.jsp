<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Pizzashop</title>
</head>
<body>
    <h1>List Supplier of Shop Việt Nam</h1>
    <ul>
        <c:forEach var="s" items="${suppliers}">
            ${s[0]} - ${s[1]} ${s[2]} ${s[3]}
        </c:forEach>
        <br/>
        
        ${param123}<br/>
        </ul>
</body>
</html>