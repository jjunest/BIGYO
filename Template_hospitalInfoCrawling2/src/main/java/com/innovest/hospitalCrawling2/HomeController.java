package com.innovest.hospitalCrawling2;

import static com.codeborne.selenide.Selenide.open;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.codeborne.selenide.Selenide;

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
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		/*System.setProperty("webdriver.gecko.driver",
				"C:\\Users\\Administrator\\Downloads\\dev\\geckodriver-v0.19.1-win64\\geckodriver.exe");
		System.out.println("this is main started");
		WebDriver driver = new FirefoxDriver();
		driver.get("http://www.toolsqa.com");*/
		userCanLoginByUsername();
	/*	try {
			Thread.sleep(5000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		driver.quit();*/
		
		
		return "home";
	}
	public void userCanLoginByUsername() {

		Selenide.open("http://google.com");
	}
}
