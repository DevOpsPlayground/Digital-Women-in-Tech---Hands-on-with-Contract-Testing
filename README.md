Introduction

On this meetup, we will walk you through what Contract testing is and how it's different from functional testing.Pact is a testing tool that guarantees those Contracts are satisfied. We'll will show you how to setup Pact in your machines and write your first Pact test.

Name: Samer Naqvi

Role: QA and Continuous Delivery Consultant

Email: samer.naqvi@ecs-digital.co.uk

LinkedIn: Let's connect

Requirements

Code editor (e.g. Eclipse) basic knowledge
Chrome browser
Basic Java knowledge
Docker installed

Setup

The remote machine will have all the programs you need to follow this session. On a new tab, please open Remote Machine to launch the login screen to connect to the test machines. For any technical assistance, please ask around for help.

If you wish to use your own machine on this playground, please make sure you have all the applications and/or programs listed on the requirements and clone or download this repository.

Further Reading
Official Cypress Documentation
Introduction to Cypress by Brian Mann
Example Cypress framework
Integrating Cypress with your CI Provider
Survey Link
We would love to hear your feedback and make improvements on the way we deliver our playground session. Please click the survey to participate.
Basic example of Consumer driven contract testing using Pact JVM 

Commands used to execute upload of pact-file and doing pact verification on Provider side: 

mvn pact:publish

mvn pact:verify

Note: I don't clame to have a perfect understanding of Pact and Pact-JVM. This is more of a "note to self" and others who are just starting to learn what Pact-JVM is all about. Qusetions are welcome: 

 
Links:

https://github.com/DiUS/pact_broker-docker

https://github.com/DiUS/pact-jvm/tree/master/pact-jvm-consumer-junit

https://github.com/DiUS/pact-jvm/tree/master/pact-jvm-provider-junit

https://github.com/DiUS/pact-jvm/tree/master/pact-jvm-provider-maven
