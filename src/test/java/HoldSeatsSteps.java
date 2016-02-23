package test.java;


public class HoldSeatsSteps {

    v@Given("^seats specified in file ([^\\s]+) are on hold level ([^\\s]+)$")
    public void precondition(String fileName, String seatLevel) {
        //read file and load data using following method
    }

    @When("^hold (\\d+) seats in level ([^\\s]+)$")
    public void reserveSeats(int numOfSests, String level) {
        //make post call to client using url /level
    }

    @When("^hold (\\d+) seats based on criteria ([^\\s]+)$")
    public void reserveSeats(int numOfSeats, String criteria) {
        //make post call to client using url /criteria
    }
}
