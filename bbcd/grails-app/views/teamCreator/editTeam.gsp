<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Opret Hold</title>
        <!--begin custom header content for this example-->

        <g:javascript src="teamCreator.js" />

    </head>
    <body class="yui-skin-sam">
        <div class="body">
            <h1>Hold Oprettelse</h1>
            <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
            </g:if>

            <g:form action="teamCreate">
                <div id="playersBoughtDiv" style="float:left;width:40%;"></div>

                <div id="playersAvailableDiv" style="float:right;width:40%;">
                    <div id="genderDiv">
                        <select name="gender" onchange="updatelicenseclass(this.value);">
                            <option value="1" selected="selected">Dame</option>
                            <option value="0">Herre</option>
                        </select>
                    </div>

                    <div id="licenseClassDiv"></div>
                    <div id="clubDiv">
                        <g:select id="clubList"
                                  optionKey="id"
                                  from="${clubList}"
                                  value="${name}"
                                  onChange="getAvailablePlayers(this.value);"
                                  noSelection="['-1':'Vælg klub...']">
                        </g:select>
                    </div>
                    <div id="searchDiv">
                        <g:textField id="tfSearchField" name="tfSearchField" size="25"/>
                        <input type="button" value="Søg" onclick="javascript: searchPlayer($(tfSearchField).getValue());")/>
                    </div>

                    <div id="availablePlayersDiv"></div>
                </div>
            </g:form>
        </div>
    </body>
</html>