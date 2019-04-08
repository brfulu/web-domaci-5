<%@ page import="java.util.Enumeration" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
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
            Map<String, String> appAttributes = (HashMap) application.getAttribute("app");
            appAttributes.put(key, value);
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
    Map<String, String> appAttributes = (HashMap) application.getAttribute("app");
    if (appAttributes.size() > 0) {
%>
<h2>Application</h2>
<div style="border: solid 2px black; width: 500px; padding-left: 5px;">
    <%
        for (String attribute : appAttributes.keySet()) {
    %>
    <p>
        <strong>
            <%= attribute %>
        </strong>
        <%= " - " + appAttributes.get(attribute) %>
    </p>
    <% } %>
</div>
<% } %>


</body>
</html>
