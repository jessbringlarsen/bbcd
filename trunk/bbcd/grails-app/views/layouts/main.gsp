<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title><g:layoutTitle default="Grails" /></title>
        <link rel="stylesheet" href="${createLinkTo(dir:'css',file:'main.css')}" />
        <link rel="stylesheet" href="${createLinkTo(dir:'css',file:'layout.css')}" />
        <link rel="stylesheet" href="${createLinkTo(dir:'js/yui/2.6.0/grids',file:'grids-min.css')}" />
        <link rel="stylesheet" href="${createLinkTo(dir:'js/yui/2.6.0/menu/assets/skins/sam',file:'menu.css')}" />
        <g:javascript library="application" />
        <modalbox:modalIncludes />
        <g:layoutHead />
    </head>
    <body class="yui-skin-sam">
        <div id="doc2" class="yui-t1">
            <div id="hd">
                <img src='${createLinkTo(dir:'images',file:'bbcdheader.jpg') }'/>.
            </div>
                <div id="bd">
                    <div id="yui-main">
                        <div class="yui-b">
                            <div class="yui-ge">
                                <div class="yui-u first">
                                    <g:isNotLoggedIn>
                                        <g:render template="/layouts/welcome" />
                                    </g:isNotLoggedIn>
                                    <g:isLoggedIn>
                                        <g:layoutBody />
                                    </g:isLoggedIn>

                                </div>
                                <div class="yui-u">

                                   <g:isLoggedIn>
                                        <h6>Velkommen <g:loggedInUserInfo field="userRealName"/></h6>
                                          <div id="bbcd_right_menu" class="yuimenu">
                                            <div class="bd">
                                                <g:render template="/menu/bbcdProfileMenu" />

                                                <g:ifAllGranted role="ROLE_USER,ROLE_ADMIN">
                                                    <g:render template="/menu/bbcdAdminMenu" />
                                                </g:ifAllGranted>
                                            </div>
                                          </div>
                                    </g:isLoggedIn>
                                    <g:isNotLoggedIn>
                                        <g:render template="/menu/bbcdLoginMenu" />
                                    </g:isNotLoggedIn>

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="yui-b">

                        <g:isLoggedIn>
                            <g:render template="/menu/bbcdMainMenu" />
                        </g:isLoggedIn>

                    </div>

                </div>
                <div id="ft">
                    <!-- footer -->
                </div>
       </div>
  </body>
</html>