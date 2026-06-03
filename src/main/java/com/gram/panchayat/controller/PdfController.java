package com.gram.panchayat.controller;

import java.io.File;
import java.nio.file.Files;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.PDPageContentStream;
import org.apache.pdfbox.pdmodel.font.PDType1Font;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import java.io.IOException;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class PdfController {

	@Value("${pdf.upload.path}")
	private String UPLOAD_DIR;

	@GetMapping("/uploadPdf")
	public String home(Model model) {
		File folder = new File(UPLOAD_DIR);
		String[] files = folder.list((dir, name) -> name.toLowerCase().endsWith(".pdf"));

		model.addAttribute("pdfList", files);
		return "uploadPdf";
	}

	@PostMapping("/uploadPdf")
	public String uploadPdf(@RequestParam("file") MultipartFile file, @RequestParam("text") String text)
			throws Exception {
		try {
			String safeText = text.replaceAll("[^a-zA-Z0-9]", "_");

			File dir = new File(UPLOAD_DIR);
			if (!dir.exists()) {
				dir.mkdirs();
			}

			String fileName = safeText + "_" + System.currentTimeMillis() + ".pdf";
			File savedFile = new File(dir, fileName);

			file.transferTo(savedFile);

			addTextToPdf(savedFile.getAbsolutePath(), text);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/uploadPdf";
	}

	@GetMapping("/viewPdf")
	public void viewPdf(@RequestParam String name, HttpServletResponse response) throws Exception {

		File file = new File(UPLOAD_DIR + name);

		response.setContentType("application/pdf");
		response.setHeader("Content-Disposition", "inline; filename=" + name);

		Files.copy(file.toPath(), response.getOutputStream());
		response.getOutputStream().flush();
	}

	@GetMapping("/files/{filename:.+}")
	@ResponseBody
	public ResponseEntity<Resource> downloadFile(@PathVariable String filename) throws IOException {

		File file = new File(UPLOAD_DIR + "/" + filename);
		Resource resource = new UrlResource(file.toURI());

		return ResponseEntity.ok()
				.header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + resource.getFilename() + "\"")
				.body(resource);
	}

	@GetMapping("/allPdfs")
	public String allPdfs(Model model) {
		File folder = new File(UPLOAD_DIR);
		String[] files = folder.list((dir, name) -> name.toLowerCase().endsWith(".pdf"));
		model.addAttribute("pdfList", files);
		return "allPdfs"; // JSP page
	}

	@GetMapping("/deletePdf")
	public String deletePdf(@RequestParam String name) {

		File file = new File(UPLOAD_DIR + name);
		if (file.exists()) {
			file.delete();
		}

		return "redirect:/";
	}

	private void addTextToPdf(String filePath, String text) throws Exception {

		PDDocument document = PDDocument.load(new File(filePath));
		PDPage page = document.getPage(0);

		PDPageContentStream contentStream = new PDPageContentStream(document, page,
				PDPageContentStream.AppendMode.APPEND, true);

		contentStream.beginText();
		contentStream.setFont(PDType1Font.HELVETICA_BOLD, 12);
		contentStream.newLineAtOffset(100, 100);
		contentStream.showText(text);
		contentStream.endText();

		contentStream.close();
		document.save(filePath);
		document.close();
	}
}