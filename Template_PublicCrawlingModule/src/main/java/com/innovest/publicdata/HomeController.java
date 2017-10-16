package com.innovest.publicdata;

import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.parser.Parser;
import org.jsoup.select.Elements;
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
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);
		try {
			Document doc = Jsoup.connect(
					"http://openapi1.nhis.or.kr/openapi/service/rest/HmcSearchService/getRegnHmcList?ServiceKey=8K5J%2FYDyte2OmM4vbXD4d1WkjHqLQNEpjcbSbO56TEzYhqGKl8u8xvt67axIaZGMGlzBa6iqzKF1DlZEzwwNdw%3D%3D")
					.data("pageNo", "3").userAgent("Mozila").parser(Parser.xmlParser()).get();

			Elements elements = doc.select("hmcNm");
	
			for(int i=0; i<elements.size(); i++) {
				System.out.println("this is forloop and elementname : "+elements.get(i).text());
			}
		




		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "home";
	}

}
