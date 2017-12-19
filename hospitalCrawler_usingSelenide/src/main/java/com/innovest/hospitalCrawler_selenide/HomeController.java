package com.innovest.hospitalCrawler_selenide;

import static com.codeborne.selenide.Selenide.open;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.phantomjs.PhantomJSDriver;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.codeborne.selenide.ElementsCollection;
import com.codeborne.selenide.SelenideElement;

import static com.codeborne.selenide.Selenide.*;
import static com.codeborne.selenide.Condition.*;
import static com.codeborne.selenide.Selectors.*;
import static com.codeborne.selenide.SelenideElement.*;

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
		System.out.println("this is test1");
		open("https://healthsmart.kr:5004/");
		$(byText("내주변검진알아보기")).click();

		SelenideElement a = $(byText("더보기"));
		while (a.exists()) {
			System.out.println("this is loop");
			a.click();
		}

		ElementsCollection collections = $(".pg_area").$$(".img_box > .view_a");
		
		for(int i=0; i<collections.size();i++) {
			System.out.println("this is loop2");
			collections.get(i).click();
			String hospital_name = $(".search_view_box h3").getText();
			System.out.println("hispitalname:"+hospital_name);
			$("div.x_btn_box > img").click();
		}
		
		
		System.out.println("this is test2");
		return "home";
	}

}
