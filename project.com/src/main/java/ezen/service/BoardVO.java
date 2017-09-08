package ezen.service;

/**
 * @author Administrator
 *
 */
public class BoardVO {
	
	private String		boardId;
	
	private int 		unq;
	private int 		fid;
	private String 		title;
	private String 		pwd;
	private String 		name;
	private String 		content;
	private String 		thread;
	private String 		hit;
	private String 		rdate;
	
	private String 		filename;
	private String[]	deleteFile;
	/**
	 * @return the unq
	 */
	public int getUnq() {
		return unq;
	}
	/**
	 * @param unq the unq to set
	 */
	public void setUnq(int unq) {
		this.unq = unq;
	}
	/**
	 * @return the fid
	 */
	public int getFid() {
		return fid;
	}
	/**
	 * @param fid the fid to set
	 */
	public void setFid(int fid) {
		this.fid = fid;
	}
	/**
	 * @return the title
	 */
	public String getTitle() {
		return title;
	}
	/**
	 * @param title the title to set
	 */
	public void setTitle(String title) {
		this.title = title;
	}
	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * @return the pwd
	 */
	public String getPwd() {
		return pwd;
	}
	/**
	 * @param pwd the pwd to set
	 */
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	/**
	 * @return the content
	 */
	public String getContent() {
		return content;
	}
	/**
	 * @param content the content to set
	 */
	public void setContent(String content) {
		this.content = content;
	}
	/**
	 * @return the thread
	 */
	public String getThread() {
		return thread;
	}
	/**
	 * @param thread the thread to set
	 */
	public void setThread(String thread) {
		this.thread = thread;
	}
	/**
	 * @return the hit
	 */
	public String getHit() {
		return hit;
	}
	/**
	 * @param hit the hit to set
	 */
	public void setHit(String hit) {
		this.hit = hit;
	}
	/**
	 * @return the rdate
	 */
	public String getRdate() {
		return rdate;
	}
	/**
	 * @param rdate the rdate to set
	 */
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
//	public String getFilename1() {
//		return filename1;
//	}
//	public void setFilename1(String filename1) {
//		this.filename1 = filename1;
//	}
//	public String getFilename2() {
//		return filename2;
//	}
//	public void setFilename2(String filename2) {
//		this.filename2 = filename2;
//	}
	
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String[] getDeleteFile() {
		return deleteFile;
	}
	public void setDeleteFile(String[] deleteFile) {
		this.deleteFile = deleteFile;
	}
	public String getBoardId() {
		return boardId;
	}
	public void setBoardId(String boardId) {
		this.boardId = boardId;
	}


	
	
}
