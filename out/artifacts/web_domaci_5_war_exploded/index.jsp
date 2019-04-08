<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Enumeration" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Domaci 5</title>
</head>
<body>

<%
    if (application.getAttribute("appAttr") == null) {
        application.setAttribute("appAttr", new HashMap<String, String>());
    }

    String key = request.getParameter("key");
    String value = request.getParameter("value");
    String scope = request.getParameter("scope");

    if (scope != null && key != null) {
        if (scope.equals("request")) {
            request.setAttribute(key, value);
        } else if (scope.equals("session")) {
            session.setAttribute(key, value);
        } else if (scope.equals("application")) {
            Map<String, String> appAttributes = (HashMap) application.getAttribute("appAttr");
            appAttributes.put(key, value);
        }
    }
%>

<%--<%--%>
<%--Cookie[] cookies = request.getCookies();--%>
<%--if (cookies != null) {--%>
<%--for (Cookie cookie : cookies) {--%>
<%--if (cookie.getName().equals("JSESSIONID")) {--%>
<%--System.out.println("JSESSIONID=" + cookie.getValue());--%>
<%--break;--%>
<%--}--%>
<%--}--%>
<%--}--%>
<%--%>--%>

<form action="index.jsp" method="post">
    <label for="scope">Scope:</label>
    <select name="scope" id="scope">
        <option value="request">REQUEST</option>
        <option value="session">SESSION</option>
        <option value="application">APPLICATION</option>
    </select>
    <br><br>

    <label for="key">Key:</label>
    <input type="text" name="key" id="key">
    <br><br>

    <label for="value">Value:</label>
    <input type="text" name="value" id="value">
    <br><br>

    <button type="submit">Submit</button>
</form>

<hr>

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
        <%= " - " + session.getId()%>
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
    Map<String, String> appAttributes = (HashMap) application.getAttribute("appAttr");
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
