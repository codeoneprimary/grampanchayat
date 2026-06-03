package com.gram.panchayat.serviceImpl;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.gram.panchayat.model.Property;
import com.gram.panchayat.model.TaxMaster;
import com.gram.panchayat.repository.PropertyRepository;
import com.gram.panchayat.repository.PropertyTaxPaymentRepository;
import com.gram.panchayat.repository.PropertyTaxRepository;
import com.gram.panchayat.repository.TaxMasterRepository;
import com.gram.panchayat.services.PropertyService;

@Service
public class PropertyServiceImpl implements PropertyService {

	private final PropertyRepository propertyRepo;

	private final TaxMasterRepository taxMasterRepo;

	private final PropertyTaxRepository propertyTaxRepository;

	private final PropertyTaxPaymentRepository propertyTaxPaymentRepository;

	public PropertyServiceImpl(PropertyRepository propertyRepo, TaxMasterRepository taxMasterRepo,
			PropertyTaxRepository propertyTaxRepository, PropertyTaxPaymentRepository propertyTaxPaymentRepository) {
		this.propertyRepo = propertyRepo;
		this.taxMasterRepo = taxMasterRepo;
		this.propertyTaxRepository = propertyTaxRepository;
		this.propertyTaxPaymentRepository = propertyTaxPaymentRepository;
	}

	@Override
	public List<TaxMaster> getAllTaxMaster() {
		return taxMasterRepo.findAll();
	}

	@Override
	public void savePropertyDetails(Property property) {
		propertyRepo.save(property);
	}

	@Override
	public List<Property> getAllPropertyList() {
		return propertyRepo.findAll();
	}

	@Override
	public Page<Property> findByOwnerNameContainingOrPropertyNoContaining(String keyword, String keyword2,
			Pageable pageable) {
		return propertyRepo.findByOwnerNameContainingOrPropertyNoContaining(keyword, keyword, pageable);
	}

	@Override
	public Page<Property> getAllPropertyListPageable(Pageable pageable) {
		return propertyRepo.findAll(pageable);
	}

	@Transactional
	@Override
	public void deletePropertyById(Long id) {
		try {
			boolean hasTax = propertyTaxRepository.existsByPropertyId(id);
			boolean hasPayment = propertyTaxPaymentRepository.existsByPropertyId(id);
			if (hasPayment) {
				propertyTaxPaymentRepository.deleteByPropertyId(id);
			}
			// delete all tax records first
			if (hasTax) {
				propertyTaxRepository.deleteByPropertyId(id);
			}
			// then delete property
			propertyRepo.deleteById(id);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public List<Object[]> getAllPendingSummary() {
		return propertyRepo.getAllPendingSummary();
	}

	@Override
	public Page<Object[]> getPropertyWithPending(String keyword, Pageable pageable) {
		// TODO Auto-generated method stub
		return propertyRepo.getPropertyWithPending(keyword, pageable);
	}

	@Override
	public Property getPropertyDetails(Long id) {
		return propertyRepo.findById(id);
	}

	@Override
	public Optional<Property> getPropertyDetailsByNo(String propertyNo) {
		// TODO Auto-generated method stub
		return propertyRepo.findByPropertyNo(propertyNo);
	}

	@Override
	public void savePropertyDetails(TaxMaster propertyType) {
		taxMasterRepo.save(propertyType);

	}

	@Override
	public TaxMaster getPropertTypeById(int id) {
		// TODO Auto-generated method stub
		return taxMasterRepo.findById(id).get();
	}

	@Override
	public void deletePropertyTypeById(int id) {
		taxMasterRepo.deleteById(id);
	}

	@Override
	public boolean existsByPropertyNo(String propertyNo) {
		// TODO Auto-generated method stub
		return propertyRepo.existsByPropertyNo(propertyNo);
	}

	@Override
	public Map<String, Object> saveCsvDataWithUpsert(MultipartFile file) throws Exception {

		List<Property> successList = new ArrayList<>();
		List<String> errors = new ArrayList<>();
		Set<String> filePropertyNos = new HashSet<>();

		int total = 0, success = 0, fail = 0;

		// ✅ 1. Check empty
		if (file == null || file.isEmpty()) {
			errors.add("Please upload a file.");
			return Map.of("totalCount", total, "successCount", success, "failCount", fail, "errors", errors,
					"successList", successList);
		}

		// ✅ 2. Check extension
		String fileName = file.getOriginalFilename();
		if (fileName == null || !fileName.toLowerCase().endsWith(".csv")) {
			errors.add("Only CSV files are allowed.");
			return Map.of("totalCount", total, "successCount", success, "failCount", fail, "errors", errors,
					"successList", successList);
		}

		// ✅ 3. Check content type
		String contentType = file.getContentType();
		if (contentType == null
				|| !(contentType.equals("text/csv") || contentType.equals("application/vnd.ms-excel"))) {
			errors.add("Invalid file type");
			return Map.of("totalCount", total, "successCount", success, "failCount", fail, "errors", errors,
					"successList", successList);
		}

		// ✅ 4. Validate CSV structure
		BufferedReader testReader = new BufferedReader(
				new InputStreamReader(file.getInputStream(), StandardCharsets.UTF_8));

		String header = testReader.readLine();
		if (header == null || !header.contains(",")) {
			errors.add("Invalid CSV format.");
			return Map.of("totalCount", total, "successCount", success, "failCount", fail, "errors", errors,
					"successList", successList);
		}

		try (BufferedReader br = new BufferedReader(
				new InputStreamReader(file.getInputStream(), StandardCharsets.UTF_8))) {

			// handle BOM (Excel CSV)
			br.mark(1);
			if (br.read() != '\uFEFF')
				br.reset();

			String line = br.readLine(); // header
			int rowNum = 1;

			while ((line = br.readLine()) != null) {
				rowNum++;
				total++;

				String[] cols = parseCsvLine(line);
				if (cols.length < 7) {
					errors.add("Row " + rowNum + ": Invalid column count");
					fail++;
					continue;
				}

				String ownerName = cols[0].trim();
				String mobile = cols[1].trim();
				mobile = mobile.replace("=", "").trim();
				String propertyNo = cols[2].trim();
				String areaStr = cols[3].trim();
				String propertyType = cols[4].trim();
				String wardNoStr = cols[5].trim();
				String address = cols[6].trim();

				// required
				if (isEmpty(ownerName, mobile, propertyNo, areaStr, propertyType, wardNoStr, address)) {
					errors.add("Row " + rowNum + ": Missing required fields");
					fail++;
					continue;
				}

				// mobile
				if (!mobile.matches("\\d{10}")) {
					errors.add("Row " + rowNum + ": Invalid mobile");
					fail++;
					continue;
				}

				// numeric
				double area;
				int wardNo;
				try {
					area = Double.parseDouble(areaStr);
					wardNo = Integer.parseInt(wardNoStr);
				} catch (Exception e) {
					errors.add("Row " + rowNum + ": Invalid numeric value");
					fail++;
					continue;
				}

				// duplicate in file
				if (filePropertyNos.contains(propertyNo)) {
					errors.add("Row " + rowNum + ": Duplicate propertyNo in file");
					fail++;
					continue;
				}
				filePropertyNos.add(propertyNo);

				// UPSERT
				Optional<Property> existing = propertyRepo.findByPropertyNo(propertyNo);

				Property p;
				if (existing.isPresent()) {
					p = existing.get();
					p.setOwnerName(ownerName);
					p.setMobile(mobile);
					p.setArea(area);
					p.setPropertyType(propertyType);
					p.setWardNo(wardNo);
					p.setAddress(address);
					p.setUploadStatus("UPDATED"); // 👈 for UI
				} else {
					p = new Property();
					p.setOwnerName(ownerName);
					p.setMobile(mobile);
					p.setPropertyNo(propertyNo);
					p.setArea(area);
					p.setPropertyType(propertyType);
					p.setWardNo(wardNo);
					p.setAddress(address);
					p.setUploadStatus("NEW"); // 👈 for UI
				}

				successList.add(p);
				success++;
			}
		}

		// save all
		propertyRepo.saveAll(successList);

		return Map.of("totalCount", total, "successCount", success, "failCount", fail, "errors", errors, "successList",
				successList);
	}

	// helpers
	private boolean isEmpty(String... vals) {
		for (String v : vals)
			if (v == null || v.trim().isEmpty())
				return true;
		return false;
	}

	private String[] parseCsvLine(String line) {
		List<String> out = new ArrayList<>();
		boolean inQuotes = false;
		StringBuilder sb = new StringBuilder();

		for (char c : line.toCharArray()) {
			if (c == '"')
				inQuotes = !inQuotes;
			else if (c == ',' && !inQuotes) {
				out.add(sb.toString().replace("\"\"", "\""));
				sb.setLength(0);
			} else
				sb.append(c);
		}
		out.add(sb.toString().replace("\"\"", "\""));
		return out.toArray(new String[0]);
	}

}
