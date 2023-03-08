public class AccountHandler {

    public static Account insertNewAccount(String name) {
        //this is the test comment for the new account
        Account account = new Account(Name = name);

        try {

            insert account;

        } catch (System.DmlException e) {

            return null;

        }

        return account;

    }

}