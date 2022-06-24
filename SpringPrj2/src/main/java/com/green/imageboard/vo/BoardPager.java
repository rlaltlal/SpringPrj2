package com.green.imageboard.vo;

public class BoardPager {
	
	public static final int PAGE_SCALE = 5; // 페이지당 게시물 수(5)
	public static final int BLOCK_SCALE = 5; // 화면당 페이지 수
	private int curPage; 	// 현재 페이지 수
	private int prevPage;	// 이전 페이지
	private int nextPage;	// 다음페이지
	private int totPage;	// 전체 페이지 갯수
	private int totBlock; 	// 전체 페이지 블록 갯수
	private int curBlock;   // 현재 페이지 블록
	private int prevBlock;  // 이전 페이지 블록
	private int nextBlock;  // 다음 페이지 블록
	
	// WHERE rn BETWEEN #{start} AND #{end}
	private int pageBegin;	// #{start}
	private int pageEnd;	// #{end}
	
	// [이전] blockBegin -> ex) 1, 2, 3, 4, 5, 6 [다음]
	private int blockBegin;	// 현재 페이지 블록의 시작번호
	// ex) [이전] 7, 8, 9, 10, 11 <- blockEnd [다음]
	private int blockEnd; 	// 현재 페이지 블록의 끝 번호
	
	
	// 생성자
	// BoardPager(게시물 갯수, 현재 페이지 번호)
	public BoardPager(int count, int curPage) {
		curBlock     = 1;			// 현재 페이지 블록 정보
		this.curPage = curPage;	// 현재 페이지 생성
		setTotPage(count);		// 전체 페이지 갯수 계산
		setPageRange();			
		setTotBlock();			// 전체 페이지 블록 갯수 계산
		setBlockRange();		// 페이지 블록의 시작, 끝 번호 계산
	}

	public void setBlockRange() {
		
		curBlock = (int)Math.ceil((curPage - 1) / BLOCK_SCALE) + 1;
		
		blockBegin   = (curBlock - 1) * BLOCK_SCALE + 1;
		
		blockEnd     = blockBegin + BLOCK_SCALE - 1;
		
		if(blockEnd > totPage) blockEnd = totPage;
		
		prevPage = (curPage == 1)? 1:(curBlock - 1) * BLOCK_SCALE;
		
		nextPage     = curBlock > totBlock ? (curBlock * BLOCK_SCALE) : (curBlock * BLOCK_SCALE) + 1;
		
		if(nextPage >= totPage) nextPage = totPage;
	}
	
	public void setPageRange() {
		
		pageBegin   = (curPage - 1) * PAGE_SCALE + 1;
		
		pageEnd     = pageBegin + PAGE_SCALE - 1;
	}

	
	// Getter / Setter
	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getPrevPage() {
		return prevPage;
	}

	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}

	public int getNextPage() {
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}

	public int getTotPage() {
		return totPage;
	}

	public void setTotPage(int count) {
		
		totPage = (int) Math.ceil(count * 1.0 / PAGE_SCALE);
	}

	public int getTotBlock() {
		return totBlock;
	}

	public void setTotBlock() {
		
		totBlock = (int)Math.ceil(totPage / BLOCK_SCALE);
	}

	public int getCurBlock() {
		return curBlock;
	}

	public void setCurBlock(int curBlock) {
		this.curBlock = curBlock;
	}

	public int getPrevBlock() {
		return prevBlock;
	}

	public void setPrevBlock(int prevBlock) {
		this.prevBlock = prevBlock;
	}

	public int getNextBlock() {
		return nextBlock;
	}

	public void setNextBlock(int nextBlock) {
		this.nextBlock = nextBlock;
	}

	public int getPageBegin() {
		return pageBegin;
	}

	public void setPageBegin(int pageBegin) {
		this.pageBegin = pageBegin;
	}

	public int getPageEnd() {
		return pageEnd;
	}

	public void setPageEnd(int pageEnd) {
		this.pageEnd = pageEnd;
	}

	public int getBlockBegin() {
		return blockBegin;
	}

	public void setBlockBegin(int blockBegin) {
		this.blockBegin = blockBegin;
	}

	public int getBlockEnd() {
		return blockEnd;
	}

	public void setBlockEnd(int blockEnd) {
		this.blockEnd = blockEnd;
	}

	@Override
	public String toString() {
		return "BoardPager [curPage=" + curPage + ", prevPage=" + prevPage + ", nextPage=" + nextPage + ", totPage="
				+ totPage + ", totBlock=" + totBlock + ", curBlock=" + curBlock + ", prevBlock=" + prevBlock
				+ ", nextBlock=" + nextBlock + ", pageBegin=" + pageBegin + ", pageEnd=" + pageEnd + ", blockBegin="
				+ blockBegin + ", blockEnd=" + blockEnd + "]";
	}
	

	
}
