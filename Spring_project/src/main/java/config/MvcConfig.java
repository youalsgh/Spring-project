package config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import util.AdminInterceptor;
import util.CartInterceptor;
import util.LoginInterceptor;
 
@Configuration
@EnableWebMvc
public class MvcConfig implements WebMvcConfigurer{

	@Override
	public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
		configurer.enable();
	}

	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		registry.jsp("/WEB-INF/view/", ".jsp");
	}
	
	/* 네비바에서 컨트롤러 거치지 않고 해당페이지로 바로 이동 */
	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		//registry.addViewController("/index").setViewName("index");
		registry.addViewController("/main/cart").setViewName("main/cart");
		registry.addViewController("/main/about").setViewName("main/about");
		registry.addViewController("/main/contact").setViewName("main/contact");
		registry.addViewController("/main/shop").setViewName("main/shop");
	}
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(adminInterceptor()).addPathPatterns("/admin/**");
		registry.addInterceptor(loginInterceptor()).addPathPatterns("/member/login.do");
		registry.addInterceptor(cartInterceptor()).addPathPatterns("/cart/**");
		//.excludePathPatterns("/cart/add");
	}
	
	@Bean
	AdminInterceptor adminInterceptor() {
		return new AdminInterceptor();
	}
	
	@Bean
	LoginInterceptor loginInterceptor() {
		return new LoginInterceptor();
	}
	
	@Bean
	CartInterceptor cartInterceptor() {
		return new CartInterceptor();
	}
	
}
