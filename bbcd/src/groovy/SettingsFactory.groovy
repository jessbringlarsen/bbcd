/**
 * Responsible for containing all the various settings used in the application
 *
 * @author jbl
 */
class SettingsFactory {
	private static final String teamMaxSize = "team.max.size";
    private static final String teamMaxSizeValue = "7";
    private static SettingsFactory instance;

    // When first initialized save all settings to the db.
    private SettingsFactory() {
        new Setting(code:teamMaxSize, type:"Integer", value:"7").save();
    }

    public static synchronized void initialize() {
        if(instance == null) {
            instance = new SettingsFactory();
        }
    }

    static Integer getTeamMaxSize() {
        return Setting.valueFor(teamMaxSize, teamMaxSizeValue)
    }
}