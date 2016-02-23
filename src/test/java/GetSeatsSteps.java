package test.java;

import cucumber.api.DataTable;
import cucumber.api.java.Before;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.When;
import cucumber.api.java.en.Then;
import org.json.simple.JSONObject;
import org.junit.Assert;
import org.apache.commons.io.FileUtils;

import java.io.File;


public class GetSeatsSteps {

    @When("^get number of seats available in level ([^\\s]+)$")
    public void getSeats(String levelName) {

        //Get actual results from client with url /level

    }

    @When("get seats sorted by ([^\\s]+) with limit (\\d+)$")
    public void getSeatsBasedOnCriteria(String criteria, int limit) {
        //get actual response from client with url /criteria and limit (using pagination)
    }

    @Then("^It (?:succeeds|fails|responds) with (?:response |status )?code (\\d+)$")
    public static void verifyResponseCode(int responseCode) {
        int status = response.getStatus();
        Assert.assertEquals(!CollectionUtils.isEmpty(errors) ? "ERRORS:\n" + errors.toString() : null, responseCode, status);
    }

    @Then("^result seats in level ([^\\s]+) are ([^\\s]+)$")
    public void dataOutFacebook(String level) {

        //Build expected results
        expectedContent = FileUtils.readFileToString(new File(fileName));

        //Assert method(actual,exp)

    }

    @And("^error message is ([^\\s]+)$")
    public void verifyError(String errorMsg) {
        //verify error
    }
}
