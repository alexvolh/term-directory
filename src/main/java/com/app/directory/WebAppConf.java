package com.app.directory;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebAppConf implements WebMvcConfigurer {
    String externalFilePath = "file:///D:/terms_images/";

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/terms_images/**").addResourceLocations(externalFilePath);
    }
}
