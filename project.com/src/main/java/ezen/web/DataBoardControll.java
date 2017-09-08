package ezen.web;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import egovframework.rte.fdl.property.EgovPropertyService;
import ezen.example.ui.pagination.PaginationInfo;
import ezen.service.BoardVO;
import ezen.service.DataBoardService;
import ezen.service.PageVO;

@Controller
public class DataBoardControll {

		@Resource(name = "multipartResolver")
		CommonsMultipartResolver multipartResolver;
		
		/** EgovPropertyService */
		@Resource(name = "propertiesService")
		protected EgovPropertyService propertiesService;

		@Resource(name="dataService")
		private DataBoardService dService;
	
		@RequestMapping(value = "/dataBoardWrite.do")
		public String writeDataBoard() {
			return "data/dataBoardWrite";
		}
		
		
		@RequestMapping(value = "/dataBoardSave.do")
		public String insertDataBoard(BoardVO vo, final MultipartHttpServletRequest multiRequest, Model model) throws Exception {
			UUID uuid = UUID.randomUUID();
			vo.setBoardId(uuid.toString());
			
			// 파일저장 및 파일이름 자르기
			multipartProcess(vo, multiRequest);
			// db에 게시글 입력
			dService.insertDataBoard(vo);
			
			
			vo = dService.getDataBoard(vo);
			model.addAttribute("unq", vo.getUnq()+"");
			
			return "redirect:/dataBoardSelect.do";
		}
	
		@RequestMapping(value = "/uploadFile.do")
		public void multipartProcess(BoardVO vo, final MultipartHttpServletRequest multiRequest) throws Exception {
			// 파일저장 
			String uploadPath = "D:/sy/upload";
			// String uploadPath = egovMessageSource.getMessage("file.upload.path");
			
			File saveFolder = new File(uploadPath);
			if (!saveFolder.exists() || saveFolder.isFile()) {
				saveFolder.mkdirs();
			}
			
			// 여러개의 파일 처리 
			MultipartFile file;
			String filePath = "";
			String now = new SimpleDateFormat("yyyyMMddHmsS").format(new Date()) + "_";  //현재시간

			
			Map<String, MultipartFile> files = multiRequest.getFileMap();
			Iterator<Entry<String, MultipartFile>> itr = files.entrySet().iterator();

			String filename = "";
			
			while (itr.hasNext()) {
				Entry<String, MultipartFile> entry = itr.next();
				file = entry.getValue();
				if (!"".equals(file.getOriginalFilename())) {
					filePath = uploadPath + "\\" + now + file.getOriginalFilename();
					file.transferTo(new File(filePath));
				
					filename +=  now + file.getOriginalFilename()+ "／";
				}
			}
			vo.setFilename(filename);
		}
		
		@RequestMapping(value = "/downloadFile.do")
		public void downloadFile(@RequestParam(value = "requestedFile") String requestedFile,
					HttpServletResponse response) throws Exception {
			String uploadPath = "D:/sy/upload";
			File uFile = new File(uploadPath, requestedFile);
			int fSize = (int) uFile.length();
			
			if (fSize > 0) {
				BufferedInputStream in = new BufferedInputStream(new FileInputStream(uFile));
				// String mimetype = servletContext.getMimeType(requestedFile);
			String mimetype = "text/html";
			response.setBufferSize(fSize);
			response.setContentType(mimetype);
			response.setHeader("Content-Disposition", "attachment; filename=\"" + requestedFile + "\"");
				response.setContentLength(fSize);
				FileCopyUtils.copy(in, response.getOutputStream());
				in.close();
				response.getOutputStream().flush();
				response.getOutputStream().close();
			} else {
				//setContentType을 프로젝트 환경에 맞추어 변경
			response.setContentType("application/x-msdownload");
			PrintWriter printwriter = response.getWriter();
			printwriter.println("<html>");
			printwriter.println("<br><br><br><h2>Could not get file name:<br>"+ requestedFile + "</h2>");
			printwriter.println("<br><br><br><center><h3><a href='javascripｔ: history.go(-1)'>Back</a></h3></center>");
			printwriter.println("<br><br><br>© webAccess");
			printwriter.println("</html>");
			printwriter.flush();
			printwriter.close();
			}
		}
		
		@RequestMapping(value = "/uploadFileDelete.do")
		public void deletefile(BoardVO vo) throws Exception {
			
			String uploadPath = "D:/sy/upload";
			String fullPath = "";
			
			String[] files = vo.getDeleteFile();
			
			for(int i=0; i<files.length; i++) {
				fullPath = uploadPath+"\\"+files[i];
				File file = new File(fullPath);					
				file.delete();
				
				vo.setFilename(vo.getDeleteFile()[i] + "／");
				dService.deleteDataFile(vo);
			}
		}
		
		@RequestMapping(value="/fileDelete.do")
		@ResponseBody public Map<String, String> fileDelete(BoardVO vo) throws Exception{
			Map<String, String> map = new HashMap<String, String>();
			
			if(vo.getUnq() != 0 ) {
				//dService.deleteDataFile(vo);
				map.put("result", "success");
			}
			return map;
		}
		
		@RequestMapping(value = "/dataBoardList.do")
		public String selectAllList(@ModelAttribute("pageVO") PageVO pageVO, ModelMap model) throws Exception{

			/** EgovPropertyService.sample */
			pageVO.setPageUnit(propertiesService.getInt("pageUnit"));
			pageVO.setPageSize(propertiesService.getInt("pageSize"));
			
			System.out.println(pageVO.getSearchCondition());
			System.out.println(pageVO.getSearchKeyword());
			/** pageing setting */
			PaginationInfo paginationInfo = new PaginationInfo();
			paginationInfo.setCurrentPageNo(pageVO.getPageIndex());
			paginationInfo.setRecordCountPerPage(pageVO.getPageUnit());
			paginationInfo.setPageSize(pageVO.getPageSize());

			pageVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
			pageVO.setLastIndex(paginationInfo.getLastRecordIndex());
			pageVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

			
			List<?> list = dService.selectDataBoardList(pageVO);
			model.addAttribute("result", list);
			
			int totCnt = dService.cntDataBoardList(pageVO);
			paginationInfo.setTotalRecordCount(totCnt);
			model.addAttribute("paginationInfo", paginationInfo);
			
			return "data/dataBoardList";
		}
		
		@RequestMapping(value = "/dataBoardSelect.do")
		public String selectDataBoard(BoardVO vo, Model model) throws Exception {
			int unq = vo.getUnq();
			
			if(unq != 0) {
				vo = dService.selectDataBoard(unq);
				model.addAttribute("vo", vo);
				
			} else {
				System.out.println("unq값이 존재하지 않습니다.");
			}
			// 추후 로그인 정보받아 내 아이디이면 hit추가 X
			dService.updateDataBoardHit(unq);
			return "data/dataBoardDetail";
		}
		
		@RequestMapping(value = "/dataBoardModify.do")
		public String dataBoardMofifyView(BoardVO vo, Model model) throws Exception {
			int unq = vo.getUnq();
			
			if(unq != 0) {
				vo = dService.selectDataBoard(Integer.valueOf(unq));
				model.addAttribute("vo", vo);
			} else {
				System.out.println("unq값이 존재하지 않습니다.");
			}
			
			return "data/dataBoardModify";
		}
		
		
		@RequestMapping(value="/updataDataBoard.do",  method = RequestMethod.POST)
		public String dataBoardUpdate(BoardVO vo, final MultipartHttpServletRequest multiRequest, Model model) throws Exception {
			// uploadpath에서 삭제할 파일 
			if(vo.getDeleteFile().length !=0)
				deletefile(vo); 
			
			// 파일저장 및 파일이름 자르기
			multipartProcess(vo, multiRequest);
			dService.updateDataBoard(vo);
			
			model.addAttribute("unq", vo.getUnq()+"");
			
			return "redirect:/dataBoardSelect.do";
		}
		
}
