package com.seeya;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@SpringBootApplication
public class ProjectSeeyaApplication extends WebMvcConfigurerAdapter{

	public static void main(String[] args) {
		SpringApplication.run(ProjectSeeyaApplication.class, args);
	}
}
