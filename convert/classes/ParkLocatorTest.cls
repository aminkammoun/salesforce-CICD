@isTest
public class ParkLocatorTest {
@isTest static void testCallout() {              
    // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        // Call the method that invokes a callout
        String country = 'United States';
    	
        System.assertEquals(new List<String>{'Yosemite','Sequoia','Amine'}, ParkLocator.country(country)); 
    }
}