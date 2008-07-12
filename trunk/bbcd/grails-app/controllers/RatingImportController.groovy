import java.io.IOException;
import dk.brondbybordtennisclub.bbcd.domain.exceptions.PlayerDateParseException;

import org.openuri.www.HentKlubberIdentifikationType;
import org.openuri.www.HentKlubberResponseType0;
import org.openuri.www.HentSpillerIdentifikationType;
import org.openuri.www.HentSpillerResponseType0;import org.openuri.www.HentListerIdentifikationType;import org.openuri.www.HentListerResponseType0;

import weblogic.jws.proxies.OSTSTAPfunctionsWSSoap;
import weblogic.jws.proxies.OSTSTAPfunctionsWS_Impl;

/**
 * Responsible for retrieving and save the rating data, players and clubs to the database.
 *
 */
class RatingImportController {
	 def transactional = true

	 def index = {
		def conversionFailures = []

		Properties ratingProperties = new Properties()
		ratingProperties.load(RatingImportController.class.getResourceAsStream("RatingPropertyFile.properties"))

		OSTSTAPfunctionsWS_Impl s = new OSTSTAPfunctionsWS_Impl(ratingProperties.getProperty("url"));
		OSTSTAPfunctionsWSSoap soap = s.getOSTSTAPfunctionsWSSoap();

		HentListerResponseType0[] listerResult = soap.hentLister(new HentListerIdentifikationType(
				ratingProperties.getProperty("Forbundsnummer"),
				ratingProperties.getProperty("Brugernavn"),
				ratingProperties.getProperty("Kodeord")));
		updateFederations(listerResult)

		HentKlubberResponseType0[] klubberResult = soap.hentKlubber(new HentKlubberIdentifikationType(
				ratingProperties.getProperty("Forbundsnummer"),
				ratingProperties.getProperty("Brugernavn"),
				ratingProperties.getProperty("Kodeord")));
		updateClubs(klubberResult, conversionFailures)

		HentSpillerResponseType0[] spillerResult = soap.hentSpiller(new HentSpillerIdentifikationType(
				ratingProperties.getProperty("Forbundsnummer"),
				ratingProperties.getProperty("Brugernavn"),
				ratingProperties.getProperty("Kodeord")));
		updatePlayers(spillerResult, conversionFailures)
		updateRating(spillerResult, conversionFailures)
		[ conversionFailures : conversionFailures ]
	}

	private void updateFederations(HentListerResponseType0[] federationList) {
		 int updateCount=0, createCount=0;
		// Fetch all idraetsforbund objects
		def idraetsforbundMap = [:]
		Idraetsforbund.list().each { union ->
			idraetsforbundMap[union.getXmlId()] = union
		}

		federationList.each { federation ->
			Idraetsforbund idraetsForbund = null;
			if(idraetsforbundMap.containsKey(federation.getXmlID())) {
				idraetsForbund = idraetsforbundMap[federation.getXmlID()]
				idraetsForbund.setName(federation.getNamn());
				updateCount++
			} else {
				idraetsForbund = new Idraetsforbund()
				idraetsForbund.setName(federation.getNamn())
				idraetsForbund.setXmlId(federation.getXmlID())
				createCount++
			}
			idraetsForbund.save()
		}
		log.info("${updateCount} idrætsforbund opdateret, ${createCount} oprettet")
	 }

	private void updateClubs(HentKlubberResponseType0[] clubList, Collection convertionFailures) {
		int updateCount=0, createCount=0;
		// Fetch all idraetsforbund objects
		def idraetsforbundMap = [:]
		Idraetsforbund.list().each { federation ->
			idraetsforbundMap[federation.getXmlId()] = federation
		}

		// Get all club to determine wether to update or create
		List allClubList = Club.list()
    	Map clubMapExisting = [:]
    	allClubList.each { club ->
    		clubMapExisting[club.getXmlId()] = club
    	}

		clubList.each { club ->
			Club clubToUpdate;
			if(clubMapExisting.containsKey(club.getXmlID())) {
				clubToUpdate = clubMapExisting[club.getXmlID()]
				updateCount++
			} else {
				clubToUpdate = new Club()
				clubToUpdate.setXmlId(club.getXmlID())
				createCount++
			}
			clubToUpdate.setName(club.getKlubbnamn())
			clubToUpdate.setShortName(club.getKlubbforkortning())

			if(idraetsforbundMap.containsKey(club.getDistriktsid())) {
				clubToUpdate.setUnion(idraetsforbundMap[club.getDistriktsid()])
				clubToUpdate.save()
			} else {
				convertionFailures << "Union: ${club.getDistriktsid()} ikke fundet for klub: ${club.getKlubbnamn()}"
			}
		}
		log.info("${updateCount} klubber opdateret, ${createCount} oprettet")
	}

	private void updatePlayers(HentSpillerResponseType0[] spillerResult, Collection convertionFailures) {
		int updateCount=0, createCount=0;

		// Retrieve all Player objects to we can determine wether to save or update
    	List allPlayerList = Player.list()
    	Map playerMapExisting = [:]
    	allPlayerList.each { player ->
    		playerMapExisting[player.getXmlId()] = player
    	}

    	spillerResult.each { player ->
    		Player playerToUpdate

    		if(playerMapExisting.containsKey(player.getXmlID())) {
    			playerToUpdate = playerMapExisting[player.getXmlID()]
    			updateCount++
    		} else {
    			playerToUpdate = new Player()
    			playerToUpdate.setXmlId(player.getXmlID())
    			createCount++
    		}

    		try {
	    		playerToUpdate.setPlayerNo(player.getPersonnr())
    			playerToUpdate.setName(player.getNamn())
    			playerToUpdate.setGender(player.getKon())

   				Date dateOfBirth = playerToUpdate.parsePersonNr(player.getPersonnr())
   				playerToUpdate.setDateOfBirth(dateOfBirth)

	    		playerToUpdate.save()
    		} catch(PlayerDateParseException e) {
				convertionFailures << e.getMessage()
			}
    	}
    	log.info("${createCount} spillere opdateret, ${updateCount} oprettet")
    }

	private void updateRating(HentSpillerResponseType0[] spillerResult, Collection errorList) {
    	RatingUpdate ratingUpdate = new RatingUpdate()
    	ratingUpdate.setDateOfUpdate(new Date())

    	ratingUpdate = ratingUpdate.save()

    	List allPlayerList = Player.list()
    	Map playerMap = [:]
    	allPlayerList.each { player ->
    		playerMap[player.getXmlId()] = player
    	}

    	List allClubList = Club.list()
    	Map clubMap = [:]
    	allClubList.each { club ->
    		clubMap[club.getXmlId()] = club
    	}

    	spillerResult.each { player ->
    		Rating rating = new Rating()
    		rating.setRatingUpdate(ratingUpdate)

    		StringTokenizer st = new StringTokenizer(player.getPoang(), ".")
    		rating.setRating(Integer.parseInt(st.nextToken()))

    		boolean validReferences = true;
    		if(clubMap.containsKey(player.getKlubXmlID())) {
    			rating.setClub(clubMap[player.getKlubXmlID()])
    		} else {
    			validReferences = false;
    			errorList << "Klub: ${player.getKlubXmlID()}"
    		}

    		if(playerMap.containsKey(player.getXmlID())) {
    			rating.setPlayer(playerMap[player.getXmlID()])
    		} else {
    			validReferences = false;
    			errorList << "Spiller: ${player.getXmlID()} ikke fundet"
    		}

    		if(validReferences) {
    			rating.save()
    		}
    	}
    }
 }