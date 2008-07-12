<html>
    <head>
        <title>Grails Open Flash Chart Plugin Page</title>
    </head>

    <body>

        <h1>Grails Open Flash Chart Plugin Page</h1>

        <chart:includeSwfobject />
        
        <p>

        <%
            def values = []
            values << 20
            values << 65
            values << 70
            values << 86
            values << 90
            values << 67
            values << 98


            def value2 = new ArrayList()
            value2.add(20)
            value2.add(54)
            value2.add(45)
            value2.add(65)
            value2.add(89)
            value2.add(96)
            value2.add(74)

        %>
        <chart:graph bar="80,#ff9900,% Complete,10"
                 title="This is a test graph,{font-size:18px;color:#A0A0A0}"
                 x_labels="Mon,Tue,Wed,Thu,Fri,Sat,Sun"
                 tool_tip="Progress #val#%"
                 values="${values}"
                 line_dot_2="3,0xCC3399,Downloads,10,5"
                 values_2="${value2}"
        />
        </p>

        <p>
        <chart:graph bar="80,#ffcc33,#f5f5f5"
                 key="% Complete,10"
                 title="This is a test graph,{font-size:18px;color:#A0A0A0}"
                 x_labels="Mon,Tue,Wed,Thu,Fri,Sat,Sun"
                 tool_tip="Progress #val#%"
                 values="50,65,70,75,80,89,100"
        />
        </p>

        <p>
            
            <chart:graph title="Size Example,{font-size: 15px}"
                     x_axis_steps="1"
                     y_legend="Grails Open Flash Chart Plugin,12,#736AFF"
                     y_ticks="5,10,5"
                     x_labels="15,6,9,17,17,12,7,3,15"
                     y_min="0"
                     y_max="20"
                     line="3,#87421F"
                     values="15,6,9,17,17,12,7,3,15"
             />
         </p>



        <p>
            <chart:graph title="Many data lines, {font-size:20px;color:#736AFF}"
                     x_label_style="10,#000000,0,2"
                     x_axis_steps="1"
                     y_legend="Grails Open Flash Chart Plugin,12,#736AFF"
                     y_ticks="5,10,4"
                     x_labels="January,February,March,April,May,June,July,August,Spetember,October,November,December"
                     y_min="0"
                     y_max="20"
                     line="2,0x80a033,Bounces,10,4"
                     values="15,15,14,18,19,14,15,15,19,16,14,19"
                     line_dot_2="3,0xCC3399,Downloads,10,5"
                     values_2="13,8,13,10,12,9,12,8,9,8,10,11"
                     line_hollow_3="2,0x80a033,Bounces,10,4"
                     values_3="6,2,6,1,2,6,4,6,7,4,4,4"
                     width="500" height="300"
             />
            
        </p>


    </body>

</html>
