<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%
    Object[][] list = new Object[][] {
            {"Денисов", "Илья", "Махачкала", 15000},
            {"Самсонов", "Александр", "Санкт-Петербург", 30000},
            {"Золотов", "Артем", "Екатеринбург", 25000},
            {"Зубов", "Никита", "Вологда", 19000},
            {"Быков", "Егор", "Москва", 14000}
    };
%>
<table border="1">
    <tr>
        <td><b><%=res.getString("surname")%></b></td>
        <td><b><%=res.getString("name")%></b></td>
        <td><b><%=res.getString("city")%></b></td>
        <td><b><%=res.getString("salary")%></b></td>
    </tr>
    <%
        for (Object[] temp : list) {
            if (salary == null || (int)temp[3] >= Integer.parseInt(salary)) {
    %>
    <tr>
        <td><%=temp[0]%></td>
        <td><%=temp[1]%></td>
        <td><%=temp[2]%></td>
        <td><%=temp[3]%></td>
    </tr>
    <%
            }
        }
    %>
</table>