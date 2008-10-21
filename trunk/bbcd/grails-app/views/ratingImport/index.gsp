<html>
  <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <!-- meta name="layout" content="main" / -->
        <title>Rating import</title>
  </head>

  <body>
  	<div class="body">
		<h1>Rating import</h1>
            <table>
	            <g:if test="${conversionFailures}">
	            	<% conversionFailures.each { entry ->  out << "<tr><td>${entry}</td></tr>" } %>
	            </g:if>
            </table>
	</div>
  </body>
</html>