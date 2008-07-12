<html>
    <head>
        <title>Grails Open Flash Chart Plugin Page</title>
    </head>

    <body>

        <h1>Grails Open Flash Chart Plugin Page -- Pie Chart</h1>

        <chart:includeSwfobject />

        <p>
            <chart:pie title="AJAX Toolkit Usage Survey Dec '07,{font-size: 18px;color #d01f3c}"
                     x_axis_steps="1"
                     y_ticks="5,10,5"
                     line="3,#87421F"
                     y_min="0"
                     y_max="20"
                     alpha="60"
                     height="350"
                     width="350"
                     line_colour="#505050"
                     label_colour="#005600"
                     bg_colour="#ffffff"
                     pie_labels="Prototype,jQuery,Ext JS,Script.aculo.us,Mootools, I Use raw Ajax,JSON,Dojo,Backbase"
                     pie_values="34.10,29.30,22.50,14.30,13.00,12.90,11.90,8.30"
                     pie_slice_colours="#d01f3c,#356aa0,#C79810,#00ff00,#ff00ff,#c0c0c0,#00ffff,#ffff00"
                     pie_slice_colours="#006600,#0066cc,#993300,#9933cc,#cc3300,#cc66cc,#ffcc00,#99ccff"
                     links="http://ajaxian.com/archives/2007-ajax-tools-usage-survey-results"
                     tool_tip="#val#%"
             />

        </p>

    </body>

</html>
