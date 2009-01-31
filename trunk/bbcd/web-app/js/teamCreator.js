    function updateDiv(url, div) {
        new Ajax.Request(url, {
            method: 'get',
            onSuccess: function(transport) {
              $(div).update(transport.responseText);
            }
          });
      };

      // Get available players to buy
      function getAvailablePlayers() {
        if($('clubList') != null && $('licenseClassList') != null) {
            var clubId = $('clubList').getValue();
            if(clubId != '-1') {
                var classId = $('licenseClassList').getValue();
                updateDiv('/bbcd/teamCreator/getAvailablePlayers?clubId='+clubId+'&classId='+classId, 'availablePlayersDiv');
            }
        }
      };

      // Show available licensclasses
      function updatelicenseclass(genderId) {
        updateDiv('/bbcd/licenseClass/getByGender?id=' + genderId, 'licenseClassDiv');
        getAvailablePlayers();
      };

      // Show players the player have bought
      function initBoughtPlayerTable() {
         updateDiv('/bbcd/teamCreator/getTeamPlayers', 'playersBoughtDiv');
      };

      function buyplayer(id) {
          updateDiv('/bbcd/teamCreator/addPlayerToTeam?id=' + id, 'playersBoughtDiv');
      };

      function sellplayer(id) {
          updateDiv('/bbcd/teamCreator/removePlayerFromTeam?id=' + id, 'playersBoughtDiv');
          var btn = $('btnBuyPlayer-'+id);

          if(btn != null) {
            btn.disabled=false;
          } else {
              getAvailablePlayers();
          }
      };

      // Fired when a new licenseclass was selected
      function licenseClassListChanged(licenseClassId) {
        getAvailablePlayers();
      };

      function searchPlayer(searchString) {
         updateDiv('/bbcd/teamCreator/searchPlayer?searchString=' + searchString, 'availablePlayersDiv');
      };

      initBoughtPlayerTable();
      updatelicenseclass(1);