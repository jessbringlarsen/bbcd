    // Generic function to use if a div needs to be updated.
    function updateDiv(url, div) {
        new Ajax.Request(url, {
            onSuccess: function(transport) {
                if(transport.responseText.length != 0) {
                    $(div).update(transport.responseText);
                } 
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
         new Ajax.Request('/bbcd/licenseClass/getByGender?id=' + genderId, {
            onSuccess: function(transport) {
                if(transport.responseText.length != 0) {
                    $('licenseClassDiv').update(transport.responseText);
                    getAvailablePlayers();
                }
            }
          });
      };

      // Show players the player have bought
      function initBoughtPlayerTable() {
         updateDiv('/bbcd/teamCreator/getTeamPlayers', 'playersBoughtDiv');
      };

      function buyplayer(id, btn) {
         new Ajax.Request('/bbcd/teamCreator/addPlayerToTeam?id=' + id, {
            onSuccess: function(transport) {
                if(transport.responseText.length != 0) {
                    $('playersBoughtDiv').update(transport.responseText);
                    getAvailablePlayers();
                } else {
                    btn.disabled=false;
                }
            }
          });
      };

      function sellplayer(id) {
            new Ajax.Request('/bbcd/teamCreator/removePlayerFromTeam?id=' + id, {
            onSuccess: function(transport) {
                if(transport.responseText.length != 0) {
                    $('playersBoughtDiv').update(transport.responseText);
                    getAvailablePlayers();
                }
            }
          });
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