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
                    <h2>Stats</h2>
                    <li class="controller"><a href="/bbcd/leagueStat/index">LeagueStatController</a></li>
                    <li class="controller"><a href="/bbcd/playerStat/index">PlayerStatController</a></li>
                    <li class="controller"><a href="/bbcd/playerStatTournament/index">PlayerStatTournamentController</a></li>
                    <li class="controller"><a href="/bbcd/playerRatingChart/index">PlayerRatingChartController</a></li>
                    <li class="controller"><a href="/bbcd/teamStat/index">TeamStatController</a></li>


                    <h2>Security</h2>
                    <li class="controller"><a href="/bbcd/role/index">RoleController</a></li>
                    <li class="controller"><a href="/bbcd/captcha/index">CaptchaController</a></li>

                    <h2>Gameplay</h2>
                    <li class="controller"><a href="/bbcd/licenseClass/index">LicenseClassController</a></li>
                    <li class="controller"><a href="/bbcd/licenseClassPrice/index">LicenseClassPriceController</a></li>
                    <li class="controller"><a href="/bbcd/licenseClassAge/index">LicenseClassAgeController</a></li>
                    <li class="controller"><a href="/bbcd/teamCreator/index">TeamCreatorController</a></li>
                    <li class="controller"><a href="/bbcd/tournament/index">TournamentController</a></li>
                    <li class="controller"><a href="/bbcd/ratingImport/index">RatingImportController</a></li>

                    <h2>Domain</h2>
                    <li class="controller"><a href="/bbcd/club/index">ClubController</a></li>
                    <li class="controller"><a href="/bbcd/leagueForumMessage/index">LeagueForumMessageController</a></li>
                    <li class="controller"><a href="/bbcd/leagueParticipant/index">LeagueParticipantController</a></li>
                    <li class="controller"><a href="/bbcd/idraetsforbund/index">IdraetsforbundController</a></li>
                    <li class="controller"><a href="/bbcd/player/index">PlayerController</a></li>
                    <li class="controller"><a href="/bbcd/pointsRule/index">PointsRuleController</a></li>
                    <li class="controller"><a href="/bbcd/rating/index">RatingController</a></li>
                    <li class="controller"><a href="/bbcd/ratingUpdate/index">RatingUpdateController</a></li>
                    <li class="controller"><a href="/bbcd/register/index">RegisterController</a></li>
                    <li class="controller"><a href="/bbcd/team/index">TeamController</a></li>
                    <li class="controller"><a href="/bbcd/user/index">UserController</a></li>
                    <li class="controller"><a href="/bbcd/profile/index">ProfileController</a></li>
                    <li class="controller"><a href="/bbcd/league/index">LeagueController</a></li>
                    <li class="controller"><a href="/bbcd/playerView/index">PlayerViewController</a></li>


                    <h2>Security</h2>
                    <li class="controller"><a href="/bbcd/requestmap/index">RequestmapController</a></li>
                    <li class="controller"><a href="/bbcd/setting/index">SettingController</a></li>

                    <h2>Misc</h2>
                    <li class="controller"><a href="/bbcd/admin/admin">AdminController</a></li>
                    <li class="controller"><a href="/bbcd/playerExternalBinding/index">PlayerExternalBindingController</a></li>
            </ul>
        </div>
    </body>
</html>