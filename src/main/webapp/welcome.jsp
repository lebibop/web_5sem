<%@ page import="java.net.URLDecoder"%>
<%@ page import="java.nio.charset.StandardCharsets" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Приветствую</title>
</head>
<body>

<form method = get action = "SalaryProcessor">
    <h2>Введите минимальную<br>зарплату</h2>
    <input type = "text" name = "salary" placeholder = "Пропуск, если не надо"
        <%
			Cookie [] c = request.getCookies();
			if(c != null)
				for(Cookie cookie: c)
                    if("salary".equals(cookie.getName())) {
                        // Запись значения в поле ввода, если найден Cookie
						out.print(" value='" + URLDecoder.decode(cookie.getValue(), StandardCharsets.UTF_8) + "' ");
						break;
					}
		%>
    > <br>
    <input type = "submit" value = "Ввод">
</form>

</body>
</html>
