package com.ats.rto.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ats.rto.common.Constants;
import com.ats.rto.common.VpsImageUpload;
import com.ats.rto.model.Cust;
import com.ats.rto.model.GetWork;
import com.ats.rto.model.TaskDesc;
import com.ats.rto.model.User;
import com.ats.rto.model.Work;
import com.ats.rto.model.WorkDetail;
import com.ats.rto.model.WorkType;

@Controller
public class TxController {
	RestTemplate rest = new RestTemplate();

	@RequestMapping(value = "/showAddWorkHeader", method = RequestMethod.GET)
	public ModelAndView showAddWorkHeader(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("work/addWorkHeader");
		try {
			WorkType[] workListArray = rest.getForObject(Constants.url + "/getAllWorkTypeList", WorkType[].class);
			List<WorkType> workList = new ArrayList<WorkType>(Arrays.asList(workListArray));
			model.addObject("workList", workList);

			Cust[] userListArray = rest.getForObject(Constants.url + "/getAllCustList", Cust[].class);
			List<Cust> custList = new ArrayList<Cust>(Arrays.asList(userListArray));
			model.addObject("custList", custList);
			//model.addObject("editWorkTypeId", 0);
			model.addObject("editWorkType", 0);
		} catch (Exception e) {

			System.err.println("Exception in showing Error Message Page " + e.getMessage());
			e.printStackTrace();
		}

		return model;

	}

	List<GetWork> workList = null;

	@RequestMapping(value = "/showWorkHeadList", method = RequestMethod.GET)
	public ModelAndView showWorkList(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("work/workHeadList");
		try {

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("status", 1);

			GetWork[] workListArray = rest.postForObject(Constants.url + "/getWorkHeaderByStatus", map,
					GetWork[].class);
			workList = new ArrayList<GetWork>(Arrays.asList(workListArray));
			model.addObject("workList", workList);

		} catch (Exception e) {

			System.err.println("Exception in showing showWorkHeadList " + e.getMessage());
			e.printStackTrace();
		}

		return model;

	}

	// editWorkHead
	@RequestMapping(value = "/editWorkHead/{workId}", method = RequestMethod.GET)
	public ModelAndView editWorkList(@PathVariable int workId, HttpServletRequest request,
			HttpServletResponse response) {

		ModelAndView model = new ModelAndView("work/addWorkHeader");
		
		try {

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

			map.add("workId", workId);

			GetWork getWork = rest.postForObject(Constants.url + "/getWorkHeaderByWorkId", map, GetWork.class);

			model.addObject("getWork", getWork);
			
			model.addObject("editWorkType", getWork.getWorkTypeTd());
			// model.addObject("workdetail", getWork.getWorkDetailList());

			 System.out.println("getWorkTypeTd for edit " + getWork.getWorkTypeTd());

			WorkType[] workListArray = rest.getForObject(Constants.url + "/getAllWorkTypeList", WorkType[].class);
			List<WorkType> workList = new ArrayList<WorkType>(Arrays.asList(workListArray));
			model.addObject("workList", workList);
			System.out.println("workList " + workList.toString());
			Cust[] userListArray = rest.getForObject(Constants.url + "/getAllCustList", Cust[].class);
			List<Cust> custList = new ArrayList<Cust>(Arrays.asList(userListArray));
			model.addObject("custList", custList);
			model.addObject("docUrl", Constants.RTO_DOC_URL);
			
		} catch (Exception e) {

			System.err.println("exce In /editWorkHead/{workId} " + e.getMessage());

			e.printStackTrace();
		}

		return model;
	}

	@RequestMapping(value = "/insertWorkHeader", method = RequestMethod.POST)
	public String insertWorkHeader(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("doc[]") List<MultipartFile> docList, @RequestParam("imgInp") List<MultipartFile> photo1,
			@RequestParam("imgInp1") List<MultipartFile> photo2) {

		
		try {

			int custId = Integer.parseInt(request.getParameter("cust_id"));
			int workType = Integer.parseInt(request.getParameter("workTypeId"));
			
			int workId=0;
			try {
			 workId = Integer.parseInt(request.getParameter("workId"));
			}
			catch (Exception e) {
				System.err.println("inside catch Set work id =0");
				workId=0;
			}
			String vehNo = request.getParameter("veh_no");

			System.err.println("cust Id " + custId);

			System.err.println("workType " + workType);

			System.err.println("vehNo" + vehNo);

			System.err.println("Photo1  " + photo1.get(0).getOriginalFilename());
			System.err.println("Photo2 " + photo2.get(0).getOriginalFilename());

			Work work = new Work();

			work.setWorkId(workId);

			work.setCustId(custId);
			work.setWorkTypeTd(workType);
			work.setVehicalNo(vehNo);
			work.setVehicalName("NULL");

			String pic1 = request.getParameter("prevImage1");
			String pic2 = request.getParameter("prevImage2");

			if (workType == 1 || workType == 4) {
				System.err.println("work type= " + workType);

				String aadharCard = request.getParameter("prev_ac");
				String ins1 = request.getParameter("prev_ins1");
				String ins2 = request.getParameter("prev_ins2");
				String puc = request.getParameter("prev_puc");
				String addProof = request.getParameter("prev_add_proof");
				String rcBook = request.getParameter("prev_rc");

				System.err.println(
						"aadharCard" + aadharCard + "ins1" + ins1 + "ins2" + ins2 + "puc" + puc + "adProof" + addProof);

				// String tStamp = ""+System.currentTimeMillis();

				try {
					VpsImageUpload imgUpload = new VpsImageUpload();

					if (!photo1.get(0).getOriginalFilename().equalsIgnoreCase("")) {

						String tStamp = "" + System.currentTimeMillis();

						String extension = FilenameUtils.getExtension(photo1.get(0).getOriginalFilename());

						// String prevImage1 = new String();
						pic1 = tStamp + "p1" + "." + extension;
						imgUpload.saveUploadedFiles(photo1.get(0), Constants.CAT_FILE_TYPE, pic1);

					}

					if (!photo2.get(0).getOriginalFilename().equalsIgnoreCase("")) {

						String tStamp = "" + System.currentTimeMillis();

						String extension = FilenameUtils.getExtension(photo2.get(0).getOriginalFilename());

						// String prevImage1 = new String();
						pic2 = tStamp + "p2" + "." + extension;
						imgUpload.saveUploadedFiles(photo2.get(0), Constants.CAT_FILE_TYPE, pic2);

					}
					// getting doc List
					// 1 Aadhar
					if (!docList.get(0).getOriginalFilename().equalsIgnoreCase("")) {

						String tStamp = "" + System.currentTimeMillis();

						String extension = FilenameUtils.getExtension(docList.get(0).getOriginalFilename());

						// String prevImage1 = new String();
						aadharCard = tStamp + "ac" + "." + extension;
						imgUpload.saveUploadedFiles(docList.get(0), Constants.CAT_FILE_TYPE, aadharCard);

						System.err.println("aadharCard saved ");
					}

					// 2 Ins1
					if (!docList.get(3).getOriginalFilename().equalsIgnoreCase("")) {

						String tStamp = "" + System.currentTimeMillis();

						String extension = FilenameUtils.getExtension(docList.get(3).getOriginalFilename());

						ins1 = tStamp + "ins1" + "." + extension;
						imgUpload.saveUploadedFiles(docList.get(3), Constants.CAT_FILE_TYPE, ins1);
						System.err.println("Ins 1 saved ");
					}

					// 3 Ins2
					if (!docList.get(4).getOriginalFilename().equalsIgnoreCase("")) {

						String tStamp = "" + System.currentTimeMillis();

						String extension = FilenameUtils.getExtension(docList.get(4).getOriginalFilename());

						ins2 = tStamp + "ins2" + "." + extension;
						imgUpload.saveUploadedFiles(docList.get(4), Constants.CAT_FILE_TYPE, ins2);
						System.err.println("Ins 2 saved ");
					}
					// 4puc

					if (!docList.get(2).getOriginalFilename().equalsIgnoreCase("")) {

						String tStamp = "" + System.currentTimeMillis();

						String extension = FilenameUtils.getExtension(docList.get(2).getOriginalFilename());

						puc = tStamp + "puc" + "." + extension;
						imgUpload.saveUploadedFiles(docList.get(2), Constants.CAT_FILE_TYPE, puc);
						System.err.println("PUC saved ");

					}

					// 5 addProof

					if (!docList.get(5).getOriginalFilename().equalsIgnoreCase("")) {

						String tStamp = "" + System.currentTimeMillis();

						String extension = FilenameUtils.getExtension(docList.get(5).getOriginalFilename());

						addProof = tStamp + "adpf" + "." + extension;
						imgUpload.saveUploadedFiles(docList.get(5), Constants.CAT_FILE_TYPE, addProof);

						System.err.println("Ad proof saved 5");

					}

					// 6 add rcBook

					if (!docList.get(1).getOriginalFilename().equalsIgnoreCase("")) {

						String tStamp = "" + System.currentTimeMillis();

						String extension = FilenameUtils.getExtension(docList.get(1).getOriginalFilename());

						rcBook = tStamp + "rc" + "." + extension;
						imgUpload.saveUploadedFiles(docList.get(1), Constants.CAT_FILE_TYPE, rcBook);

						System.err.println("rcBook proof saved ");

					}

				} catch (Exception e) {
					System.err.println("Exc in uploading work Imag work type= 1 or 4 " + e.getMessage());
					e.printStackTrace();

				}

				System.err.println("aadharCard " + aadharCard + "ins1 " + ins1 + "ins2 " + ins2 + "puc " + puc
						+ "adProof " + addProof + "rcBook " + rcBook);

				work.setAddProof(addProof);
				work.setAdharCard(aadharCard);
				work.setInsurance(ins1);
				work.setInsurance1(ins2);
				work.setPuc(puc);
				work.setRcbook(rcBook);

			} // end of if workType

			if (workType == 2) {

				System.err.println("work type =2");

				String aadharCard = request.getParameter("prev_ac");
				String ins1 = request.getParameter("prev_ins1");
				String ins2 = request.getParameter("prev_ins2");
				String puc = request.getParameter("prev_puc");
				String bankNoc = request.getParameter("prev_bank_noc");
				String rcBook = request.getParameter("prev_rc");

				System.err.println(
						"aadharCard" + aadharCard + "ins1" + ins1 + "ins2" + ins2 + "puc" + puc + "adProof" + bankNoc);

				// String tStamp = ""+System.currentTimeMillis();

				try {
					VpsImageUpload imgUpload = new VpsImageUpload();

					if (!photo1.get(0).getOriginalFilename().equalsIgnoreCase("")) {

						String tStamp = "" + System.currentTimeMillis();

						String extension = FilenameUtils.getExtension(photo1.get(0).getOriginalFilename());

						// String prevImage1 = new String();
						pic1 = tStamp + "p1" + "." + extension;
						imgUpload.saveUploadedFiles(photo1.get(0), Constants.CAT_FILE_TYPE, pic1);

					}

					if (!photo2.get(0).getOriginalFilename().equalsIgnoreCase("")) {

						String tStamp = "" + System.currentTimeMillis();

						String extension = FilenameUtils.getExtension(photo2.get(0).getOriginalFilename());

						// String prevImage1 = new String();
						pic2 = tStamp + "p2" + "." + extension;
						imgUpload.saveUploadedFiles(photo2.get(0), Constants.CAT_FILE_TYPE, pic2);

					}
					// getting doc List
					// 1 Aadhar
					if (!docList.get(0).getOriginalFilename().equalsIgnoreCase("")) {

						String tStamp = "" + System.currentTimeMillis();

						String extension = FilenameUtils.getExtension(docList.get(0).getOriginalFilename());

						// String prevImage1 = new String();
						aadharCard = tStamp + "ac" + "." + extension;
						imgUpload.saveUploadedFiles(docList.get(0), Constants.CAT_FILE_TYPE, aadharCard);

						System.err.println("aadharCard saved ");
					}

					// 2 Ins1
					if (!docList.get(3).getOriginalFilename().equalsIgnoreCase("")) {

						String tStamp = "" + System.currentTimeMillis();

						String extension = FilenameUtils.getExtension(docList.get(3).getOriginalFilename());

						ins1 = tStamp + "ins1" + "." + extension;
						imgUpload.saveUploadedFiles(docList.get(3), Constants.CAT_FILE_TYPE, ins1);
						System.err.println("Ins 1 saved ");
					}

					// 3 Ins2
					if (!docList.get(4).getOriginalFilename().equalsIgnoreCase("")) {

						String tStamp = "" + System.currentTimeMillis();

						String extension = FilenameUtils.getExtension(docList.get(4).getOriginalFilename());

						ins2 = tStamp + "ins2" + "." + extension;
						imgUpload.saveUploadedFiles(docList.get(4), Constants.CAT_FILE_TYPE, ins2);
						System.err.println("Ins 2 saved ");
					}
					// 4puc

					if (!docList.get(2).getOriginalFilename().equalsIgnoreCase("")) {

						String tStamp = "" + System.currentTimeMillis();

						String extension = FilenameUtils.getExtension(docList.get(2).getOriginalFilename());

						puc = tStamp + "puc" + "." + extension;
						imgUpload.saveUploadedFiles(docList.get(2), Constants.CAT_FILE_TYPE, puc);
						System.err.println("PUC saved ");

					}

					// 5 bank noc

					if (!docList.get(6).getOriginalFilename().equalsIgnoreCase("")) {

						String tStamp = "" + System.currentTimeMillis();

						String extension = FilenameUtils.getExtension(docList.get(6).getOriginalFilename());

						bankNoc = tStamp + "bnoc" + "." + extension;
						imgUpload.saveUploadedFiles(docList.get(6), Constants.CAT_FILE_TYPE, bankNoc);

						System.err.println("bankNoc saved 5");

					}

					// 6 add rcBook

					if (!docList.get(1).getOriginalFilename().equalsIgnoreCase("")) {

						String tStamp = "" + System.currentTimeMillis();

						String extension = FilenameUtils.getExtension(docList.get(1).getOriginalFilename());

						rcBook = tStamp + "rc" + "." + extension;
						imgUpload.saveUploadedFiles(docList.get(1), Constants.CAT_FILE_TYPE, rcBook);

						System.err.println("rcBook proof saved ");

					}

				} catch (Exception e) {
					System.err.println("Exc in uploading work Imag work type=2" + e.getMessage());
					e.printStackTrace();

				}

				System.err.println("aadharCard " + aadharCard + "ins1 " + ins1 + "ins2 " + ins2 + "puc " + puc
						+ "bankNoc " + bankNoc + "rcBook " + rcBook);

				work.setBankDocument(bankNoc);
				work.setAdharCard(aadharCard);
				work.setInsurance(ins1);
				work.setInsurance1(ins2);
				work.setPuc(puc);
				work.setRcbook(rcBook);

			} // end of if workType=2

			if (workType == 3) {
				System.err.println("work type =3");

				String aadharCard = request.getParameter("prev_ac");
				String ins1 = request.getParameter("prev_ins1");
				String ins2 = request.getParameter("prev_ins2");
				String puc = request.getParameter("prev_puc");
				String bankLetter = request.getParameter("prev_bank_letter");
				String form17 = request.getParameter("prev_form_no17");
				String rcBook = request.getParameter("prev_rc");

				System.err.println("aadharCard " + aadharCard + "ins1 " + ins1 + "ins2" + ins2 + "puc " + puc
						+ "bankLetter " + bankLetter + "form17 " + form17);

				// String tStamp = ""+System.currentTimeMillis();

				try {

					VpsImageUpload imgUpload = new VpsImageUpload();

					if (!photo1.get(0).getOriginalFilename().equalsIgnoreCase("")) {

						String tStamp = "" + System.currentTimeMillis();

						String extension = FilenameUtils.getExtension(photo1.get(0).getOriginalFilename());

						// String prevImage1 = new String();
						pic1 = tStamp + "p1" + "." + extension;
						imgUpload.saveUploadedFiles(photo1.get(0), Constants.CAT_FILE_TYPE, pic1);

					}

					if (!photo2.get(0).getOriginalFilename().equalsIgnoreCase("")) {

						String tStamp = "" + System.currentTimeMillis();

						String extension = FilenameUtils.getExtension(photo2.get(0).getOriginalFilename());

						// String prevImage1 = new String();
						pic2 = tStamp + "p2" + "." + extension;
						imgUpload.saveUploadedFiles(photo2.get(0), Constants.CAT_FILE_TYPE, pic2);

					}
					// getting doc List
					// 1 Aadhar
					if (!docList.get(0).getOriginalFilename().equalsIgnoreCase("")) {

						String tStamp = "" + System.currentTimeMillis();

						String extension = FilenameUtils.getExtension(docList.get(0).getOriginalFilename());

						// String prevImage1 = new String();
						aadharCard = tStamp + "ac" + "." + extension;
						imgUpload.saveUploadedFiles(docList.get(0), Constants.CAT_FILE_TYPE, aadharCard);

						System.err.println("aadharCard saved ");
					}

					// 2 Ins1
					if (!docList.get(3).getOriginalFilename().equalsIgnoreCase("")) {

						String tStamp = "" + System.currentTimeMillis();

						String extension = FilenameUtils.getExtension(docList.get(3).getOriginalFilename());

						ins1 = tStamp + "ins1" + "." + extension;
						imgUpload.saveUploadedFiles(docList.get(3), Constants.CAT_FILE_TYPE, ins1);
						System.err.println("Ins 1 saved ");
					}

					// 3 Ins2
					if (!docList.get(4).getOriginalFilename().equalsIgnoreCase("")) {

						String tStamp = "" + System.currentTimeMillis();

						String extension = FilenameUtils.getExtension(docList.get(4).getOriginalFilename());

						ins2 = tStamp + "ins2" + "." + extension;
						imgUpload.saveUploadedFiles(docList.get(4), Constants.CAT_FILE_TYPE, ins2);
						System.err.println("Ins 2 saved ");
					}
					// 4puc

					if (!docList.get(2).getOriginalFilename().equalsIgnoreCase("")) {

						String tStamp = "" + System.currentTimeMillis();

						String extension = FilenameUtils.getExtension(docList.get(2).getOriginalFilename());

						puc = tStamp + "puc" + "." + extension;
						imgUpload.saveUploadedFiles(docList.get(2), Constants.CAT_FILE_TYPE, puc);
						System.err.println("PUC saved ");

					}

					// 5 bankLetter

					if (!docList.get(7).getOriginalFilename().equalsIgnoreCase("")) {

						String tStamp = "" + System.currentTimeMillis();

						String extension = FilenameUtils.getExtension(docList.get(7).getOriginalFilename());

						bankLetter = tStamp + "blet" + "." + extension;
						imgUpload.saveUploadedFiles(docList.get(7), Constants.CAT_FILE_TYPE, bankLetter);

						System.err.println("bankLetter saved ");

					}

					// 6 form17

					if (!docList.get(8).getOriginalFilename().equalsIgnoreCase("")) {

						String tStamp = "" + System.currentTimeMillis();

						String extension = FilenameUtils.getExtension(docList.get(8).getOriginalFilename());

						form17 = tStamp + "blet" + "." + extension;
						imgUpload.saveUploadedFiles(docList.get(8), Constants.CAT_FILE_TYPE, form17);

						System.err.println("form17 saved ");

					}

					// 67add rcBook

					if (!docList.get(1).getOriginalFilename().equalsIgnoreCase("")) {

						String tStamp = "" + System.currentTimeMillis();

						String extension = FilenameUtils.getExtension(docList.get(1).getOriginalFilename());

						rcBook = tStamp + "rc" + "." + extension;
						imgUpload.saveUploadedFiles(docList.get(1), Constants.CAT_FILE_TYPE, rcBook);

						System.err.println("rcBook proof saved ");

					}

				} catch (Exception e) {
					System.err.println("Exc in uploading work Imag  work type 3 " + e.getMessage());
					e.printStackTrace();

				}

				System.err.println("aadharCard " + aadharCard + "ins1 " + ins1 + "ins2 " + ins2 + "puc " + puc
						+ "bankLetter " + bankLetter + "rcBook " + rcBook + "form 17 " + form17);

				work.setBankDocument(bankLetter);
				work.setBankDocument1(form17);

				work.setAdharCard(aadharCard);
				work.setInsurance(ins1);
				work.setInsurance1(ins2);
				work.setPuc(puc);
				work.setRcbook(rcBook);

			} // end of if workType=3

			if (workType == 5) {
				System.err.println("work type =5");

				String aadharCard = request.getParameter("prev_ac");

				String origLic = request.getParameter("prev_orig_lic");

				System.err.println("aadharCard" + aadharCard + "origLic" + origLic);

				// String tStamp = ""+System.currentTimeMillis();

				try {
					VpsImageUpload imgUpload = new VpsImageUpload();

					if (!photo1.get(0).getOriginalFilename().equalsIgnoreCase("")) {

						String tStamp = "" + System.currentTimeMillis();

						String extension = FilenameUtils.getExtension(photo1.get(0).getOriginalFilename());

						// String prevImage1 = new String();
						pic1 = tStamp + "p1" + "." + extension;
						imgUpload.saveUploadedFiles(photo1.get(0), Constants.CAT_FILE_TYPE, pic1);

					}

					if (!photo2.get(0).getOriginalFilename().equalsIgnoreCase("")) {

						String tStamp = "" + System.currentTimeMillis();

						String extension = FilenameUtils.getExtension(photo2.get(0).getOriginalFilename());

						// String prevImage1 = new String();
						pic2 = tStamp + "p2" + "." + extension;
						imgUpload.saveUploadedFiles(photo2.get(0), Constants.CAT_FILE_TYPE, pic2);

					}
					// getting doc List
					// 1 Aadhar
					if (!docList.get(0).getOriginalFilename().equalsIgnoreCase("")) {

						String tStamp = "" + System.currentTimeMillis();

						String extension = FilenameUtils.getExtension(docList.get(0).getOriginalFilename());

						// String prevImage1 = new String();
						aadharCard = tStamp + "ac" + "." + extension;
						imgUpload.saveUploadedFiles(docList.get(0), Constants.CAT_FILE_TYPE, aadharCard);

						System.err.println("aadharCard saved ");
					}

					// 2 orig Lic
					if (!docList.get(9).getOriginalFilename().equalsIgnoreCase("")) {

						String tStamp = "" + System.currentTimeMillis();

						String extension = FilenameUtils.getExtension(docList.get(9).getOriginalFilename());

						origLic = tStamp + "lic" + "." + extension;
						imgUpload.saveUploadedFiles(docList.get(9), Constants.CAT_FILE_TYPE, origLic);
						System.err.println("origLic saved ");
					}

					System.err.println("aadharCard" + aadharCard + "origLic" + origLic);

				} catch (Exception e) {
					System.err.println("Exc in uploading work Imag " + e.getMessage());
					e.printStackTrace();

				}
				work.setAdharCard(aadharCard);
				work.setOrignalLicence(origLic);
			} // end of if workType=5

			System.out.println("pic1" + pic1);
			System.out.println("pic2" + pic2);

			work.setPhoto(pic1);
			work.setPhoto1(pic2);

			work.setIsUsed(1);
			work.setStatus(1);
			Date now = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String date = sdf.format(now.getTime());
			work.setDate1(date);

			WorkDetail workDetail = new WorkDetail();

			workDetail.setDate(date);

			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Calendar cal = Calendar.getInstance();
			List<WorkDetail> workDetailList = new ArrayList<>();

			workDetail.setDateTime(dateFormat.format(cal.getTime()));
			workDetail.setUserId(1);// to be get from session

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

			map.add("innerTaskId", 1);

			TaskDesc taskDesc = rest.postForObject(Constants.url + "/getTaskByInnerTaskId", map, TaskDesc.class);

			workDetail.setWorkDesc(taskDesc.getTaskDesc());
			workDetail.setInnerTaskId(taskDesc.getInnerTaskId());
			workDetail.setIsUsed(1);
			workDetailList.add(workDetail);
			work.setWorkDetailList(workDetailList);

			System.err.println("work Bean  " + work.toString());

			Info info = rest.postForObject(Constants.url + "/saveOrderHeaderDetail", work, Info.class);

			System.err.println("work insert Res  " + info.toString());

			/*
			 * for (int i = 0; i < docList.size(); i++) {
			 * 
			 * System.err.println("docList[" + i + "] " +
			 * docList.get(i).getOriginalFilename()); }
			 */
		} catch (Exception e) {

			System.err.println("Exception in  insertWorkHeader  " + e.getMessage());
			e.printStackTrace();
		}

		return "redirect:/showAddWorkHeader";

	}

}
