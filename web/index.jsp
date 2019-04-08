<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Domaci 5</title>
  </head>
  <body>

  <%
    if (application.getAttribute("app") == null) {
        application.setAttribute("app", new HashMap<String, String>());
    }
  %>

  <form action="response.jsp" method="post">
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

  </body>
</html>
