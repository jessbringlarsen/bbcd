
/**
 * 
 * Service for retriving players using playerView.
 * 
 * @author jbl
 */
class PlayerViewService {

    def getByTeam(Long teamId) {
        return PlayerView.executeQuery("""select pw from
            PlayerView as pw, Player as p
            inner join p.teams as team
            where p.id = pw.id and team.id = ?""", [teamId])
    }
	
}