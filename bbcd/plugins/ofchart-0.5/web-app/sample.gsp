<html>
    <head>
        <title>Grails Open Flash Chart Plugin Page</title>
    </head>

    <body>

        <h1>Grails Open Flash Chart Plugin Page</h1>

        <chart:includeSwfobject />

        <p>
        <chart:graph bar_sketch="50,6,#99FF00,#7030A0,% Complete,14"
                 title="This is a test graph,{font-size:18px;color:#A0A0A0}"
                 x_legend="Week 1,12,#A0A0A0"
                 x_axis_steps="1"
                 x_label_style="10,#A0A0A0,0,1"
                 x_labels="Mon,Tue,Wed,Thu,Fri,Sat,Sun"
                 y_label_style="10,#A0A0A0"
                 y_ticks="5,10,2"
                 y_min="0" y_max="100"
                 x_axis_colour="#A0A0A0"
                 x_grid_colour="#FFFFFF"
                 y_axis_colour="#A0A0A0"
                 y_grid_colour="#FFFFFF"
                 tool_tip="Progress #val#%"
                 values="50,65,70,75,80,89,100"
                 width="500" height="300"
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


        <p>
            <chart:graph title="Pie Chart,{font-size: 18px;color #d01f3c}"
                     y_legend="Grails Open Flash Chart Plugin,12,#736AFF"
                     x_axis_steps="1"
                     y_ticks="5,10,5"
                     line="3,#87421F"
                     y_min="0"
                     y_max="20"
                     pie="60,#505050,#000000"
                     values="14,14,12,15,11"
                     pie_labels="IE,Firefox,Opera,Wii,Other"
                     colours="#d01f3c,#356aa0,#C79810"
                     tool_tip="#val#%"
             />

        </p>

    </body>

</html>
