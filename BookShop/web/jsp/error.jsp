<html>

    <body bgcolor="white">

        <%@ page isErrorPage="true" %>
        <%  String msg = (String) request.getAttribute("result");
            out.print("<h3>" + msg);
            session.invalidate();%>

    </body>
</html>
