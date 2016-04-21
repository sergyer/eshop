package eshop.business;

/**
 * Created by Serg on 13-Nov-15.
 */
public class User {
    String userName;
    String password;
    String email;
    int creditCardNumber;

    public User(){}

    public int getCreditCardNumber() {
        return creditCardNumber;
    }

    public void setCreditCardNumber(int creditCardNumber) {
        this.creditCardNumber = creditCardNumber;
    }

    public String getEmail() {
        return email;
    }

    public String getUserName() {
        return userName;
    }

    public String getPassword() {
        return password;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public User(String userName,String password,String email){
        this.userName=userName;
        this.password=password;
        this.email=email;
    }

}
