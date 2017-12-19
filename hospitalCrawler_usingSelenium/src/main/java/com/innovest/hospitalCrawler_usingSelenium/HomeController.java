package com.innovest.hospitalCrawler_usingSelenium;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.phantomjs.PhantomJSDriver;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		// Set executable file path to system variable phantomjs.binary.path's value.
		String phantomjsExeutableFilePath = "C:\\Users\\Administrator\\Downloads\\dev\\phantomjs-2.1.1-windows\\phantomjs-2.1.1-windows\\bin\\phantomjs.exe";
		System.setProperty("phantomjs.binary.path", phantomjsExeutableFilePath);

		// Initiate PhantomJSDriver.
		WebDriver driver = new PhantomJSDriver();
		driver.get("https://healthsmart.kr:5004/?c=program");

		System.out.println("this is pageSource:" + driver.getPageSource());
		return "home";
	}
	
}
