package com.gram.panchayat.util;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.nio.file.*;
import java.util.Base64;

@Service
public class FileStorage {

	@Value("${app.upload.dir:uploads}")
	private String uploadRoot;

	public SavedFile saveBase64(String subFolder, String originalFileName, String base64) {
		try {
			byte[] bytes = Base64.getDecoder().decode(base64);
			String safeName = System.currentTimeMillis() + "_" + (originalFileName == null ? "file" : originalFileName);

			Path dir = Paths.get(uploadRoot, subFolder);
			Files.createDirectories(dir);

			Path fullPath = dir.resolve(safeName);
			Files.write(fullPath, bytes, StandardOpenOption.CREATE_NEW);

			return new SavedFile(safeName, fullPath.toString());
		} catch (Exception e) {
			throw new RuntimeException("Failed to store document: " + e.getMessage(), e);
		}
	}

	public static class SavedFile {
		public final String fileName;
		public final String filePath;

		public SavedFile(String fileName, String filePath) {
			this.fileName = fileName;
			this.filePath = filePath;
		}
	}
}
