package com.gram.panchayat;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.boot.builder.SpringApplicationBuilder;

@EnableScheduling
@SpringBootApplication
public class GrampanchayatApplication extends SpringBootServletInitializer {

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(GrampanchayatApplication.class);
	}

	public static void main(String[] args) {
		SpringApplication.run(GrampanchayatApplication.class, args);
	}

}
