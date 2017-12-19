package com.innovest.template_addressapimodule;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

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
		
		model.addAttribute("serverTime", formattedDate );
	
/*		
		GeoPoint in_pt = new GeoPoint(127., 38.);
		System.out.println("geo in : xGeo="  + in_pt.getX() + ", yGeo=" + in_pt.getY());
		GeoPoint tm_pt = GeoTrans.convert(GeoTrans.GEO, GeoTrans.GRS80, in_pt);
		System.out.println("grs80 : x=" + tm_pt.getX() + ", y=" + tm_pt.getY());*/
		
		GeoPoint grs80 = new GeoPoint(963635.8317205664,1925333.4697321486);
		System.out.println("grs80 : x=" + grs80.getX() + ", y=" + grs80.getY());
		GeoPoint GEO = GeoTrans.convert(GeoTrans.GRS80, GeoTrans.GEO, grs80);
		System.out.println("GEO : x=" + GEO.getX() + ", y=" + GEO.getY());
		
	/*	GeoPoint katec_pt = GeoTrans.convert(GeoTrans.TM, GeoTrans.KATEC, tm_pt);
		System.out.println("katec : xKATEC=" + katec_pt.getX() + ", yKATEC=" + katec_pt.getY());
		GeoPoint out_pt = GeoTrans.convert(GeoTrans.KATEC, GeoTrans.GEO, katec_pt);
		System.out.println("geo out : xGeo=" + out_pt.getX() + ", yGeo=" + out_pt.getY());
		GeoPoint in2_pt = new GeoPoint(128., 38.);
		System.out.println("geo distance between (127,38) and (128,38) =" + GeoTrans.getDistancebyGeo(in_pt, in2_pt) + "km");*/
		
		
		return "home";
	}
	
	
	@RequestMapping(value = "/jusoPopup")
	public String jusoPopup(Locale locale, Model model) {
	
		return "jusoPopup";
	}
	
	@RequestMapping(value = "/Sample")
	public String Sample(Locale locale, Model model) {
	
		return "Sample";
	}
}
