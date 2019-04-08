<%@ page import="java.util.Enumeration" %>
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

    if (scope != null) {
        if (scope.equals("request")) {
            request.setAttribute(key, value);
        } else if (scope.equals("session")) {
            session.setAttribute(key, value);
        } else if (scope.equals("application")) {
            application.setAttribute(key, value);
        }
    }
%>


<div>
    <a href="index.jsp">Back to index</a>
</div>


<%
    Enumeration<String> reqAttributes = request.getAttributeNames();
    if (reqAttributes.hasMoreElements()) {
%>
<h2>Request</h2>
<div style="border: solid 2px black; width: 500px; padding-left: 5px;">
    <%
        while (reqAttributes.hasMoreElements()) {
            String attribute = reqAttributes.nextElement();
    %>
    <p>
        <strong>
            <%= attribute %>
        </strong>
        <%= " - " + request.getAttribute(attribute) %>
    </p>
    <% } %>
</div>
<% } %>


<h2>Session</h2>
<div style="border: solid 2px black; width: 500px; padding-left: 5px;">
    <p>
        <strong>
            JSESSIONID
        </strong>
        <%= " - " + session.getId() %>
    </p>
    <%
        Enumeration<String> sessAttributes = session.getAttributeNames();
        while (sessAttributes.hasMoreElements()) {
            String attribute = sessAttributes.nextElement();
    %>
    <p>
        <strong>
            <%= attribute %>
        </strong>
        <%= " - " + session.getAttribute(attribute) %>
    </p>
    <% } %>
</div>


<%
    Enumeration<String> appAttributes = application.getAttributeNames();
    if (appAttributes.hasMoreElements()) {
%>
<h2>Application</h2>
<div style="border: solid 2px black; width: 1000px; padding-left: 5px;">
    <%
        while (appAttributes.hasMoreElements()) {
            String attribute = appAttributes.nextElement();
    %>
    <p>
        <strong>
            <%= attribute %>
        </strong>
        <%= " - " + application.getAttribute(attribute) %>
    </p>
    <% } %>
</div>
<% } %>


</body>
</html>
