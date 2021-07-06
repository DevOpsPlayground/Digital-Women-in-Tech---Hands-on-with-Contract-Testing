package se.ff.bsv;


import au.com.dius.pact.provider.junit.PactRunner;
import au.com.dius.pact.provider.junit.Provider;
import au.com.dius.pact.provider.junit.State;
import au.com.dius.pact.provider.junit.loader.PactFolder;
import au.com.dius.pact.provider.junit.target.HttpTarget;
import au.com.dius.pact.provider.junit.target.Target;
import au.com.dius.pact.provider.junit.target.TestTarget;
import org.junit.runner.RunWith;

@RunWith(PactRunner.class) // Set JUnit to run tests with custom Runner
@Provider("BusService") // Set up name of tested provider
@PactFolder("../client/target/pacts")

public class BusStopContractTest {


    @State("There is a bus with number 613 arriving to Hammersmith bus station")
    public void hammerSmith() {
        System.out.println("There is a bus with number 613 arriving to Hammersmith bus station" );
    }


    @TestTarget // Annotation denotes Target that will be used for tests
    public final Target target = new HttpTarget(8081);

}
