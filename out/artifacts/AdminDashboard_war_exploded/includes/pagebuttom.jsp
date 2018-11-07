<%--
  Created by IntelliJ IDEA.
  User: Hamza
  Date: 07/11/2018
  Time: 12:48
  To change this template use File | Settings | File Templates.
--%>
</div>
</div>
</div>
</div>
</div>
</body>
<%@include file="footers.jsp" %>
<script type="text/javascript">
    var box = paginator({
        table: document.getElementById("mytable"),
        box_mode: "list",
    });
    box.className = "box";
    document.getElementsByTagName("center")[0].appendChild(box);
    //document.getElementById("mytable").parentNode.appendChild(box);
</script>
</html>