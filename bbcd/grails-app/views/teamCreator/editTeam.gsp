
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Opret Hold</title>
        <!--begin custom header content for this example-->


    <script type="text/javascript">

      function updateDiv(url, div) {
        new Ajax.Request(url, {
            method: 'get',
            onSuccess: function(transport) {
              $(div).update(transport.responseText);
            }
          });
      };

      function updatelicenseclass(genderId) {
        updateDiv('/bbcd/licenseClass/getByGender?id=' + genderId, 'licenseClassDiv');
      };

      function initBoughtPlayerTable() {
         updateDiv('/bbcd/teamCreator/getTeamPlayers', 'playersBoughtDiv');
      };

      function buyplayer(id) {
          updateDiv('/bbcd/teamCreator/addPlayerToTeam?id=' + id, 'playersBoughtDiv');
      };

      function sellplayer(id) {
          updateDiv('/bbcd/teamCreator/removePlayerFromTeam?id=' + id, 'playersBoughtDiv');
      };

      function getAvailablePlayers(clubId) {
          var classId = $('licenseClassList').getValue();
          updateDiv('/bbcd/teamCreator/getAvailablePlayers?clubId='+clubId+'&classId='+classId, 'availablePlayersDiv');
      };

      initBoughtPlayerTable();
      updatelicenseclass(1);
      getAvailablePlayers();

    </script>
    </head>
    <body class="yui-skin-sam">
        <div class="body">
            <h1>Hold Oprettelse</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:form action="teamCreate">
             <select name="gender" onchange="updatelicenseclass(this.value);">
                <option value="1" selected="selected">Dame</option>
                <option value="0">Herre</option>
              </select>
              
              <div id="licenseClassDiv"></div>
              <g:select optionKey="id" 
                from="${clubList}"
                name="clubList"
                value="${name}"
                onChange="getAvailablePlayers(this.value);">
              </g:select>

              <div id="availablePlayersDiv"></div>
              <div id="playersBoughtDiv"></div>
             </g:form>
         </div>
    </body>
</html>