<%@ page import="java.util.Enumeration" %><%--
  Created by IntelliJ IDEA.
  User: Fulu
  Date: 8.4.2019.
  Time: 12:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String key = request.getParameter("key");
    String value = request.getParameter("value");
    String scope = request.getParameter("scope");

    if (scope.equals("request")) {
        request.setAttribute(key, value);
    } else if (scope.equals("session")) {
        session.setAttribute(key, value);
    } else if (scope.equals("application")) {
        application.setAttribute(key, value);
    }
%>

<h2>Request</h2>
<div style="border: solid 2px black; width: 500px; padding-left: 5px;">
    <%
        Enumeration<String> reqAttributes = request.getAttributeNames();
        while (reqAttributes.hasMoreElements()) {
            String attribute = reqAttributes.nextElement();
    %>
    <p>
        <%= attribute + ": " + request.getAttribute(attribute) %>
    </p>
    <%
        }
    %>
</div>

<h2>Session</h2>
<div style="border: solid 2px black; width: 500px; padding-left: 5px;">
    <%
        Enumeration<String> sessAttributes = session.getAttributeNames();
        while (sessAttributes.hasMoreElements()) {
            String attribute = sessAttributes.nextElement();
    %>
    <p>
        <%= attribute + ": " + session.getAttribute(attribute) %>
    </p>
    <%
        }
    %>
</div>

<h2>Application</h2>
<div style="border: solid 2px black; width: 800px; padding-left: 5px; margin-top: 10px;">
    <%
        Enumeration<String> appAttributes = application.getAttributeNames();
        while (appAttributes.hasMoreElements()) {
            String attribute = appAttributes.nextElement();
    %>
    <p>
        <%= attribute + ": " + application.getAttribute(attribute) %>
    </p>
    <%
        }
    %>
</div>

<div>
    <a href="index.jsp">Back to index</a>
</div>
</body>
</html>
