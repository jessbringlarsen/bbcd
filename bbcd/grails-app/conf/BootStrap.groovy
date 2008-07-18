

class BootStrap {

     def init = { servletContext ->

     	def oebtu = new Idraetsforbund(name:"ØBTU", xmlId:"1").save()
     	new Idraetsforbund(name:"JBTU", xmlId:"2").save()
     	new Idraetsforbund(name:"FBTU", xmlId:"3").save()
     	new Idraetsforbund(name:"BBTU", xmlId:"4").save()
     	
     	new Club(xmlId: '1', name: 'Brøndby BC',	shortName: 'BBC', union: oebtu).save()
     	
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
		    	password:"hemmeligt",
		    	leagueAdministrator:profile).save()
		    	
		new League(name:"LeagueTwo",
     			creationDate:new Date(),
		    	tournament:tournament,
		    	password:"hemmeligt",
		    	leagueAdministrator:profile).save()
     	
     	new PointsRule(fromRating:-10000, toRating:-30, credit:-30000).save()
     	new PointsRule(fromRating:-29, toRating:-20, credit:-20000).save()
     	new PointsRule(fromRating:-19, toRating:-10, credit:-15000).save()
     	new PointsRule(fromRating:-9, toRating:0, credit:-10000).save()
     	new PointsRule(fromRating:1, toRating:10, credit:10000).save()
     	new PointsRule(fromRating:11, toRating:15, credit:15000).save()
     	new PointsRule(fromRating:21, toRating:30, credit:20000).save()
     	new PointsRule(fromRating:31, toRating:10000, credit:30000).save()
     	
     	
     }

     def destroy = {
     }
}
