<%@ page import="java.util.ResourceBundle"%>
<%@ page import="java.util.Locale"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Таблица</title>
</head>
<body>
<%
  request.setCharacterEncoding("UTF-8");
  String salary = request.getParameter("salary");
  String lang = request.getParameter("lang");

  if (lang == null) lang = "ru";
  if (!"en".equalsIgnoreCase(lang) && !"ru".equalsIgnoreCase(lang)) {
    response.sendError(HttpServletResponse.SC_NOT_ACCEPTABLE,
            "Параметр lang может принимать значения ru или en вместо \"" + lang + "\"");
    return;
  }
  ResourceBundle res = ResourceBundle.getBundle("list", new Locale(lang));
%>

<h1>
  <%=res.getString("title") %>
  <%=(salary == null)? " " : (res.getString("condition") + salary + "$") %>
</h1>
<%@include file="HelloServletList.jsp"%>
<%@include file="ChangeLang.jsp"%>
<%@include file="search.jsp"%>
</body>
</html>
