package test.java;


public class ReserveSeatsSteps {
    @Given("^seats specified in file ([^\\s]+) are booked in level ([^\\s]+)$")
    public void precondition(String fileName, String seatLevel) {
        //read file and load data using following method
    }

    @When("^reserve (\\d+) seats in level ([^\\s]+)$")
    public void reserveSeats(int numOfSests, String level) {
        //make post call to client using url /level
    }

    @When("^reserve (\\d+) seats based on criteria ([^\\s]+)$")
    public void reserveSeats(int numOfSeats, String criteria) {
        //make post call to client using url /criteria
    }
}
