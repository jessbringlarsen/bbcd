

class BootStrap {

     def init = { servletContext ->

     	new Idraetsforbund(name:"ØBTU").save()
     	new Idraetsforbund(name:"JBTU").save()
     	new Idraetsforbund(name:"FBTU").save()
     	new Idraetsforbund(name:"BBTU").save()

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
