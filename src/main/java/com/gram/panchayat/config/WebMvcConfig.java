package com.gram.panchayat.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

	@Value("${complaint.image.upload.path}")
	private String complaintImageUploadPath;

	@Value("${pdf.upload.path}")
	private String UPLOAD_DIR;

	@Bean
	public InternalResourceViewResolver viewResolver() {
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setPrefix("/WEB-INF/views/");
		resolver.setSuffix(".jsp");
		return resolver;
	}

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/complaintImages/**").addResourceLocations("file:" + complaintImageUploadPath);
		registry.addResourceHandler("/pdf/**").addResourceLocations("file:" + UPLOAD_DIR + "/");
	}
}