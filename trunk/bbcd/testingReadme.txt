I give a little sumary hereafter for other people who need to debug test with eclipse

First create an *external tools configuration* with the following paramters: *Location*: ${env_var:GRAILS_HOME}/bin/grails.bat *Wking Dir*: ${project_loc} *Arguments*: test-app $[string_prompt}

In environnment tab, set JAVA_OPTS= -Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=1044

This task will run grails test-app in debug mode and stop is when it starts

Next create a* java remote application* via debug/open debug dialog... - *Project*: your project - *Connection type*: Standard - *Host:*localhost - *Port:*1044

To debug run first the external application which should start in suspended mode and next start the java remote application. Eclipse goes to the debug panel and your application starts. If you set a breakpoint the application should stop at it 