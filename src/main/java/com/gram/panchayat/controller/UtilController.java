package com.gram.panchayat.controller;

import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class UtilController {

	@GetMapping("/captcha")
	public void captcha(HttpServletResponse response, HttpSession session) throws IOException {
		String captcha = String.valueOf(new Random().nextInt(8999) + 1000);
		session.setAttribute("CAPTCHA", captcha);

		BufferedImage image = new BufferedImage(120, 40, BufferedImage.TYPE_INT_RGB);
		Graphics g = image.getGraphics();
		g.setFont(new Font("Arial", Font.BOLD, 22));
		g.drawString(captcha, 20, 28);

		ImageIO.write(image, "png", response.getOutputStream());
	}

}
