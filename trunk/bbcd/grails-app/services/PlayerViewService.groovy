
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

    def findAllByClubIdAndClassIdNotInTeam(clubId, classId, teamId) {
        return PlayerView.executeQuery("""select pw from
            PlayerView as pw
            where pw.clubId = ?
            and pw.classId = ?
            and pw.id not in
            (select player.id from Team as t, Player as p
            inner join t.players as player where t.id = ?)
            """, [clubId, classId, teamId])
    }
}