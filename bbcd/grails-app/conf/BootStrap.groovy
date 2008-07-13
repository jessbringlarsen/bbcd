

class BootStrap {

     def init = { servletContext ->

     	new Idraetsforbund(name:"ØBTU", xmlId:"1").save()
     	new Idraetsforbund(name:"JBTU", xmlId:"2").save()
     	new Idraetsforbund(name:"FBTU", xmlId:"3").save()
     	new Idraetsforbund(name:"BBTU", xmlId:"4").save()
     	
     	Profile profile = new Profile(firstName:"Jess", 
     			sirName:"Bring-Larsen",
     			email:"jess@bringlarsen.dk",
     			password:"hemmeligt",
     			activationKey:"1",
     			lastLogin:new Date(),
     			activated:new Integer(1),
     			question:"test",
     			answer:"test")
     	profile.save()
     	
     	new Team(name:"TeamOne",
     			credit:new Integer(500),
     			creationDate:new Date(),
     			teamOwner:profile).save()
     			
     	new Team(name:"TeamTwo",
     			credit:new Integer(1500),
     			creationDate:new Date(),
     			teamOwner:profile).save()
     	
     	Tournament tournament = new Tournament(name:"ØM",
     			tournamentStart:new Date(),
     			tournamentEnd: new Date(),
     			isCurrentTournament:Boolean.TRUE)
     	tournament.save()
     			
     	new League(name:"LeagueOne",
     			creationDate:new Date(),
		    	tournament:tournament,
		    	privateLeague:Boolean.FALSE,
		    	password:"hemmeligt",
		    	leagueAdministrator:profile).save()
		    	
		new League(name:"LeagueTwo",
     			creationDate:new Date(),
		    	tournament:tournament,
		    	privateLeague:Boolean.FALSE,
		    	password:"hemmeligt",
		    	leagueAdministrator:profile).save()
     	
     	/*new PointsRule(from_:-10000, to_:-30, credit:-30000).save()
     	new PointsRule(from_:-29, to_:-20, credit:-20000).save()
     	new PointsRule(from_:-19, to_:-10, credit:-15000).save()
     	new PointsRule(from_:-9, to_:0, credit:-10000).save()
     	new PointsRule(from_:1, to_:10, credit:10000).save()
     	new PointsRule(from_:11, to_:15, credit:15000).save()
     	new PointsRule(from_:21, to_:30, credit:20000).save()
     	new PointsRule(from_:31, to_:10000, credit:30000).save()
     	*/
     }

     def destroy = {
     }
}
