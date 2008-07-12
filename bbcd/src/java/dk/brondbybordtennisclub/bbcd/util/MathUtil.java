package dk.brondbybordtennisclub.bbcd.util;

/**
 * Define various math functions.
 *
 * @author jbl
 *
 */
public class MathUtil {

	/**
	 * Floor the specified int to the specified place
	 * <p>
	 * E.g. floor(4512, 100) == 4500
	 * </p>
	 *
	 * @param number to round
	 * @param place specify e.g. 10 or 100
	 * @return the number rounded down
	 */
	public static int floor(int number, int place) {
		if(number < 0) { return 0; }
		if(place <= 0) { return number; }

		int rest = number % place;
		return number - rest;
	}

	public static int ceil(int number, int place) {
		if(number < 0) { return 0; }
		if(place <= 0) { return number; }

		int rest = number % place;
		int toAdd = place - rest;
		return number + toAdd;
	}
}