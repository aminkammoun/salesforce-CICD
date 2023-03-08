public class ParkLocator {
    public static List<String> country(String country){
        ParkService.ParksImplPort prkSrv = new ParkService.ParksImplPort();
        return prkSrv.byCountry(country);
    }
}