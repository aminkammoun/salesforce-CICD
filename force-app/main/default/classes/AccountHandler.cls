public class AccountHandler {

    public static Account insertNewAccount(String name) {
        //this is the test comment for the new account
        Account account = new Account(Name = name);

        try {
            System.debug('this test working fine another one');
            insert account;

        } catch (System.DmlException e) {

            return null;

        }

        return account;

    }

}