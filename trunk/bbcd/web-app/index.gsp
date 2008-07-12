<html>
    <head>
        <title>Welcome to Grails</title>
		<meta name="layout" content="main" />
    </head>
    <body>
        <chart:includeSwfobject />

        <h1 style="margin-left:20px;">Welcome to Grails</h1>
        <p style="margin-left:20px;width:80%">Congratulations, you have successfully started your first Grails application! At the moment
        this is the default page, feel free to modify it to either redirect to a controller or display whatever
        content you may choose. Below is a list of controllers that are currently deployed in this application,
        click on each to execute its default action:</p>
        <div class="dialog" style="margin-left:20px;width:60%;">
            <ul>
              <g:each var="c" in="${grailsApplication.controllerClasses}">
                    <li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
              </g:each>
            </ul>
        </div>
        <chart:graph line_hollow="2,4,0x80a033,Bounces,10"
                 title="This is a test graph,{font-size: 20px; color: #736AFF}"
                 x_labels="Mon,Tue,Wed,Thu,Fri,Sat,Sun"
                 x_label_style="10,0x000000,0,2"
                 y_min="5"
                 y_max="20"
                 y_label_steps="4"
                 y_legend="Open Flash Chart,12,#736AFF"
                 tool_tip="Progress #val#%"
                 values="5,6,7,7.5,8,8,9"
                 width="500" height="300"
        />
    </body>
</html>