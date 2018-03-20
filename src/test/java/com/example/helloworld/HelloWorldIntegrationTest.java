package com.example.helloworld;


import com.example.helloworld.api.Saying;
import io.dropwizard.testing.ResourceHelpers;
import io.dropwizard.testing.junit.DropwizardAppRule;
import static org.assertj.core.api.Assertions.assertThat;

import org.glassfish.jersey.client.JerseyClient;
import org.glassfish.jersey.client.JerseyClientBuilder;
import org.junit.Rule;
import org.junit.Test;

import javax.ws.rs.client.Client;


public class HelloWorldIntegrationTest {
  @Rule
  public final DropwizardAppRule<HelloWorldConfiguration> RULE =
      new DropwizardAppRule<HelloWorldConfiguration>(HelloWorldApplication.class,
          ResourceHelpers.resourceFilePath("hello-world.yml"));

  @Test
  public void runServerTest() {
    Client client = new JerseyClientBuilder().build();
    Saying result = client.target(
        String.format("http://localhost:%d/hello-world", RULE.getLocalPort())
    ).queryParam("name", "violet").request().get(Saying.class);
    assertThat(result.getContent()).isEqualTo("Hello, violet!");
    assertThat(result.getId()).isEqualTo(1);
  }
}