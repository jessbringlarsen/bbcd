
class RatingImportController {
	 def transactional = true
	 
	 RatingImportService ratingImportService

	 def index = {
		
		[ conversionFailures : ratingImportService.doImport() ]
	}
 }