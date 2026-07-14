package com.homeservice.common.util;

/**
 * Great-circle distance between two lat/lng points using the Haversine formula.
 * Used for ranking nearby workers at MVP scale (linear scan). A spatial index /
 * KD-Tree is the documented scale-up path per the architecture document.
 */
public final class GeoUtils {

    private static final double EARTH_RADIUS_KM = 6371.0;

    private GeoUtils() {}

    public static double distanceKm(double lat1, double lng1, double lat2, double lng2) {
        double dLat = Math.toRadians(lat2 - lat1);
        double dLng = Math.toRadians(lng2 - lng1);
        double a = Math.sin(dLat / 2) * Math.sin(dLat / 2)
                + Math.cos(Math.toRadians(lat1)) * Math.cos(Math.toRadians(lat2))
                * Math.sin(dLng / 2) * Math.sin(dLng / 2);
        double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
        return EARTH_RADIUS_KM * c;
    }
}
