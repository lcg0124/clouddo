package com.bootdo.clouddocms.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Component
public class WebConfig implements WebMvcConfigurer {
    @Value("${app.filePath}")
    String filePath;

    @Value("${app.pre}")
    String pre;
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler(pre+"/**").addResourceLocations("file:///"+filePath);
    }
}
