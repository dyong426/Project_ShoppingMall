package com.ezen.jhc.common.util;

public class PagingHelper {
	
		// 전체 글의 행의 수
		private int pageSize;
		// 현재 페이지 번호
		private int currentPage;
		// 전체 페이지 개수
		private int totalPages;
		// 시작 페이지 번호
		private int startPage;
		// 종료 페이지 번호
		private int endPage;
		// 페이징의 개수
		private int pagingCount;
		// 게시글 데이터
		//private List<LprodVO> content;
		
		// size : 한 화면에 보여질 행의 수
		public PagingHelper(int pageSize, int currentPage, int size, int pagingCount) {
			
			this.pageSize = pageSize;
			this.currentPage = currentPage;
			//this.content = content;
			this.pagingCount = pagingCount;
			
			// 데이터 없을 경우
			if(pageSize == 0) { 
				totalPages = 0;
				startPage = 0;
				endPage = 0;
			} else { 
				// 전체 페이지 (전체 데이터 개수 / 한 페이지 행의 수)
				totalPages = pageSize / size;
				
				
				if(pageSize % size != 0) {
					// 나머지가 0이 아니면 전체페이지 + 1
					totalPages++;
				}
				
				
				//페이지 번호가 총 페이지 수보다 크면 마지막 페이지 번호로 변경
				if (totalPages < currentPage) {
					currentPage = totalPages;
				}
				
				// startPage : '이전 [1] [2] [3] [4] [5] 다음' 일때 1을 의미
				
				startPage = (currentPage - 1) / pagingCount * pagingCount + 1;
				
				// endPage   : '이전 [1] [2] [3] [4] [5] 다음' 일때 5을 의미
				
				endPage = startPage + pagingCount - 1 ;
				
				//마지막 페이지가 총 페이지 수보다 크면 마지막 페이지 번호로 변경
				if(endPage > totalPages) {
					endPage = totalPages;
				}
			}
		}
		
		// 전체 행의 수를 리턴
		public int getTotal() {
			return this.pageSize;
		}
		
		// select 결과가 없는가? 체킹 : true면 결과가 없다는 의미
		public boolean hasNoPages() {
			return this.pageSize == 0;
		}
		
		// select 결과가 있는가? 체킹 : true면 결과가 있다는 의미
		public boolean hasPages() {
			return this.pageSize > 0;
		}
		
		// 현재 페이지 번호 리턴
		public int getCurrentPage() {
			return this.currentPage;
		}
		
		// 전체 페이지의 개수 리턴
		public int getTotalPages() {
			return totalPages;
		}
		
		// 데이터 VO List 리턴
//		public List<LprodVO> getContent(){
//			return this.content;
//		}
		
		// 목록 하단의 시작 번호를 리턴
		public int getStartPage() {
			return this.startPage;
		}
		
		// 목록 하단의 종료 번호를 리턴
		public int getEndPage() {
			return this.endPage;
		}

}
