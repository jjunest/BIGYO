package com.innovest.hospitalCrawling4;

import static com.codeborne.selenide.Selenide.*;

import org.junit.Test;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;

import static com.codeborne.selenide.Condition.*;

public class GoogleTest {

	@Test
	public void userCanLoginByUsername() {
		System.setProperty("webdriver.gecko.driver", "C:\\Users\\Administrator\\Downloads\\dev\\geckodriver-v0.19.1-win64\\geckodriver.exe");
		WebDriver driver = new FirefoxDriver();
		open("http://google.com");
	}
}
