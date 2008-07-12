package dk.brondbybordtennisclub.bbcd.domain.exceptions;

/**
 * Thrown if the date of birth could not be extracted from the personnr in the
 * Player domain class.
 *
 * @author jbl
 *
 */
public class PlayerDateParseException extends Exception {

	public PlayerDateParseException(String message) {
		super(message);
	}

	static int floor(int number, int place) {
		int rest = number % place;
		return number - rest;
	}

	static int ceil(int number, int place) {
		int rest = number % place;
		int toAdd = place - rest;
		return number + toAdd;
	}

	public static void main(String[] args) {
		System.out.println(PlayerDateParseException.ceil(523, 10));
	}
}