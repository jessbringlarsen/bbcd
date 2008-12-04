<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Opret Hold</title>

<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.6.0/build/fonts/fonts-min.css" />
<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.6.0/build/button/assets/skins/sam/button.css" />
<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.6.0/build/datatable/assets/skins/sam/datatable.css" />
<script type="text/javascript" src="http://yui.yahooapis.com/2.6.0/build/yahoo-dom-event/yahoo-dom-event.js"></script>
<script type="text/javascript" src="http://yui.yahooapis.com/2.6.0/build/element/element-beta-min.js"></script>

<script type="text/javascript" src="http://yui.yahooapis.com/2.6.0/build/button/button-min.js"></script>
<script type="text/javascript" src="http://yui.yahooapis.com/2.6.0/build/dragdrop/dragdrop-min.js"></script>
<script type="text/javascript" src="http://yui.yahooapis.com/2.6.0/build/datasource/datasource-min.js"></script>
<script type="text/javascript" src="http://yui.yahooapis.com/2.6.0/build/datatable/datatable-min.js"></script>

<script type="text/javascript" src="http://yui.yahooapis.com/2.6.0/build/connection/connection-min.js"></script>
<script type="text/javascript" src="http://yui.yahooapis.com/2.6.0/build/yahoo/yahoo-min.js"></script>
<script type="text/javascript" src="http://yui.yahooapis.com/2.6.0/build/event/event-min.js"></script>
<script type="text/javascript" src="http://yui.yahooapis.com/2.6.0/build/json/json-min.js"></script>
<script type="text/javascript" src="http://yui.yahooapis.com/2.6.0/build/button/button-min.js"></script>


        <!--begin custom header content for this example-->
<style type="text/css">
/* custom styles for this example */
#buttons {margin-bottom: 1em;}
</style>
    <script type="text/javascript">

        <!-- Købte -->

        var dtBoughtPlayers = null;
        var data = {id:"id",name:"name",age:"age"};
        var i=1;

        YAHOO.util.Event.addListener(window, "load", function() {
        YAHOO.example.DynamicData = new function() {

            var myColumnDefs = [
                {key: 'id',
                    type: 'number',
                    sortable: false,
                    resizeable: false,
                    label: 'id'},
                {key: 'name',
                    sortable: false,
                    resizeable: false,
                    label: 'navn'},
                {key: 'age',
                    type: 'number',
                    sortable: false,
                    resizeable: false,
                    label: 'alder'},
                 {key:"button", 
                     label:"Sælg",
                     formatter:YAHOO.widget.DataTable.formatButton},
            ];


            this.myDataSource = new YAHOO.util.DataSource('/bbcd/teamCreator/allPlayers');
            this.myDataSource.responseType = YAHOO.util.DataSource.TYPE_JSARRAY;
            this.myDataSource.responseSchema = {
                    resultsList : 'results',
                    fields      : ["id","name","age"],
                    metaFields  : {
                        totalRecords: 'totalRecords'
                    }
                //fields : ["id","name","age"],
            };

            this.myDataTable = new YAHOO.widget.DataTable("playersBought", myColumnDefs, this.myDataSource, {});
            dtBoughtPlayers = this.myDataTable;

            var bReverseSorted = false;

            // Track when Column is reverse-sorted, since new data will come in out of order
            var trackReverseSorts = function(oArg) {
                bReverseSorted = (oArg.dir === YAHOO.widget.DataTable.CLASS_DESC);
            };
            this.myDataTable.subscribe("columnSortEvent", trackReverseSorts);

            this.myDataTable.subscribe("buttonClickEvent", function(oArgs)  {
                var oRecord = this.getRecord(oArgs.target);
                //alert(YAHOO.lang.dump(oRecord.getData().row));
                dtBoughtPlayers.deleteRow(oRecord);
            });

        };
    });

    function addRow(id) {
        var request = YAHOO.util.Connect.asyncRequest('GET',
                '/bbcd/teamCreator/dataTableDataAsJSON?id=' + id, { success: function(response) {

            var jsonResponse = YAHOO.lang.JSON.parse(response.responseText);
            var record = YAHOO.widget.DataTable._cloneObject(data);
            record.row = jsonResponse.id;
            record.id = jsonResponse.id;
            record.name = jsonResponse.name;
            record.age = jsonResponse.age;

              YAHOO.util.Connect.asyncRequest(
                'GET', '/bbcd/teamPlayer/createById?teamId=1&playerId=' + record.id,
                {
                    success: function (o) {
                        if (o.responseText == "Ok") {
                            dtBoughtPlayers.addRow(record);
                        } else {
                            alert(o.responseText);
                        }
                    },
                    failure: function (o) {
                        alert(o.statusText);
                    },
                    scope:this
                }
            );
        }});
    }

    </script>
    </head>
    <body class="yui-skin-sam">
        <div class="body">
            <h1>Hold Oprettelse</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:form action="teamCreate">
                <div class="list">
                    <table>
                        <thead>
                            <tr>
                                <g:sortableColumn property="name" title="Navn" />
                                <g:sortableColumn property="clubName" title="Klub" />
                                <g:sortableColumn property="className" title="Klasse" />
                                <g:sortableColumn property="rating" title="Rating" />
                                <g:sortableColumn property="price" title="Pris" />
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                        <g:each in="${playerViewList}" status="i" var="playerView">
                            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                                <td>${fieldValue(bean:playerView, field:'name')}</td>
                                <td>${fieldValue(bean:playerView, field:'clubName')}</td>
                                <td>${fieldValue(bean:playerView, field:'className')}</td>
                                <td>${fieldValue(bean:playerView, field:'rating')}</td>
                                <td>${fieldValue(bean:playerView, field:'price')}</td>
                                <td><button name="buyPlayer" type="button" onclick="addRow(${playerView.id});" >Køb</button></td>
                            </tr>
                        </g:each>
                        </tbody>
                    </table>
                </div>

                <div id='playersBought'></div>
               
               
                <div class="paginateButtons">
                    <g:paginate total="${PlayerView.count()}" />
                </div>
             </g:form>
         </div>
    </body>
</html>