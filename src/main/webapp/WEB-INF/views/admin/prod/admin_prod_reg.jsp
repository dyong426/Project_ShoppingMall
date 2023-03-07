<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- include header -->

<%@ include file="../include/header.jsp"%>

<!-- admin_prod_reg -->

<body>

	<div class="main-container">

		<!-- include left Nav Bar -->

		<%@ include file="../include/left_nav_bar.jsp"%>

		<!-- prod_reg content-container -->

		<div class="content-container-prod">

			<div class="card grid-top">탑</div>

			<div class="card grid-main">

				<div class="card-header">제품등록</div>

				<form class="row card-body" id="prod-reg-form"
					action="/jhc/admin/prod/reg" method="POST">
					<div class="col-md-6">
						<label for="main_category" class="form-label">메인 카테고리</label> <select
							id="main-category" name="m_ctgr_num" class="form-select"
							onchange="selectMain(this)">
							<option value="0">메인 카테고리</option>

							<c:forEach items="${mainCtgrs}" var="mainCtgr">
								<option value="${mainCtgr.m_ctgr_num}">${mainCtgr.m_ctgr_name}</option>
							</c:forEach>

						</select>
					</div>

					<div class="col-md-6">
						<label for="sub-category" class="form-label">서브 카테고리</label> <select
							id="sub-category" name="s_ctgr_num" class="form-select">
							<option>서브 카테고리</option>
							<c:forEach items="${sCtgrs}" var="sCtgr">
								<option value="${sCtgr.s_ctgr_num}">${sCtgr.s_ctgr_name}</option>
							</c:forEach>
						</select>
					</div>

					<div class="col-md-6">
						<label for="p_name" class="form-label">제품명</label> <input
							type="text" class="form-control" id="p_name" name="p_name"
							placeholder="제품명을 입력하세요">
					</div>
					<div class="col-md-6">
						<label for="p_price" class="form-label">가격</label> <input
							type="text" class="form-control" id="p_price" name="p_price"
							placeholder="가격을 입력하세요">
					</div>
					<div class="col-md-12">
						<label for="p_info_img_path" class="form-label">제품 정보 이미지</label>
						<input type="file" class="form-control file-upload"
							id="prod-upload-img" name="origin_img_path" multiple>
						<div id="uploadResult" class="dflex-row">
							
						</div>
					</div>
					<div class="dflex-column col-md-12">
						<label for="prod_color_table">제품 색상 등록</label>
						<table class="table" id="prod_color_table">
							<thead>
								<tr>
									<th class="col-3">색상</th>
									<th class="col-1">코드</th>
									<th>이미지</th>
									<th></th>
									<th></th>
								</tr>
							</thead>
							<tbody id="prod-color-table-body">
								<tr id="color0">
									<td><input type="text" class="form-control"
										id="color-name0" name="prodColors[0].pc_name" /></td>
									<td><input type="color" class="form-control"
										id="color-code0" name="prodColors[0].pc_code" /></td>
									<td><input type="file" class="form-control pc-img-path"
										id="color-path0" name="prodColors[0].pc_img_path" onchange="inputColorImg(event)"/></td>
									<td>
										<div id="uploadResult">
											
										</div>
									</td>
									<td>
										<button type="button"
											class="btn btn-plus fa-solid fa-circle-plus btn-primary"
											onclick="addColorBtn(event)"></button>
										<button type="button"
											class="btn btn-minus fa-solid fa-circle-minus btn-danger"
											style='display: none;' onclick="removeColorBtn(event)"></button>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="dflex-column">
						<label for="prod-size-table">제품 사이즈 등록</label>
						<table class="table" id="prod-size-table">
							<thead>
								<tr>
									<th>사이즈</th>
									<th></th>
								</tr>
							</thead>
							<tbody id="prod-size-table-body">
								<tr id="size0">
									<td><input type="text" class="form-control"
										id="size-name0" name="prodSizes[0].ps_name" /></td>
									<td>
										<button type="button"
											class="btn btn-plus fa-solid fa-circle-plus btn-primary"
											onclick="addSizeBtn(event)"></button>
										<button type="button"
											class="btn btn-minus fa-solid fa-circle-minus btn-danger"
											style='display: none;' onclick="removeSizeBtn(event)"></button>
									</td>
								</tr>
							</tbody>
						</table>
					</div>

					<div class="summernote-container col-md-12">
						<label for="prod_explain_editor"></label>
						<textarea class="summernote" id="prod_explain_editor"
							name="prod_explain">
						
						<!-- 브랜드 스토리 -->
						
						<div class="header">
    <div class="title">
        <div class="body" style="color: #000000;">null</div>
    </div>
    <div class="description">
        <div class="body" style="color: #000000;">null</div>
    </div>
    <div class="background_url">
        <div class="body"
										style="background: url() no-repeat center center; background-size: cover; height: 0px;"></div>
    </div>
</div>
<div class="design_collection_contents">
    <div class="design_collection_content"
									design_collection_content_id="7064"
									_sel="./_->design_collection_contents->(#7064)" type="full_img"
									style="margin-bottom: 42.857142857142854px;">
        <div class="body">
            <div class="wrapper">
                <div class="thumbnail_url">
                    <div class="body">
													<img src="/jhc/assets/admin/images/admin.png"></img>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="design_collection_content"
									design_collection_content_id="4154"
									_sel="./_->design_collection_contents->(#4154)" type="h1"
									style="margin-bottom: 17.142857142857142px;">
        <div class="body val" style="color: #000000;">실패 없는 커스텀 웨어</div>
    </div>
    <div class="design_collection_content"
									design_collection_content_id="4155"
									_sel="./_->design_collection_contents->(#4155)" type="p1"
									style="margin-bottom: 42.857142857142854px;">
        <div class="body val" style="color: #000000;">남녀노소 누구나 만족하는 후드 집업<br>나만의 디자인으로 특별함을 더해보세요.</div>
    </div>
    <div class="design_collection_content"
									design_collection_content_id="4156"
									_sel="./_->design_collection_contents->(#4156)" type="full_img"
									style="margin-bottom: 8.571428571428571px;">
        <div class="body">
            <div class="wrapper">
                <div class="thumbnail_url">
                    <div class="body">
													<img
														src="//s3.marpple.co/files/u_1364732/2022/9/original/52ba977faad3f1f195a78d720f617db6f08c41631.jpg"></img>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="design_collection_content"
									design_collection_content_id="4318"
									_sel="./_->design_collection_contents->(#4318)" type="full_img"
									style="margin-bottom: 128.57142857142858px;">
        <div class="body">
            <div class="wrapper">
                <div class="thumbnail_url">
                    <div class="body">
													<img
														src="//s3.marpple.co/files/u_1364732/2022/9/original/e245cba9bed38aa312ea0302c3ca6026861fa6351.jpg"></img>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="design_collection_content"
									design_collection_content_id="6123"
									_sel="./_->design_collection_contents->(#6123)" type="h1"
									style="margin-bottom: 17.142857142857142px;">
        <div class="body val" style="color: #000000;">5장부터 단체 할인이 적용돼요.</div>
    </div>
    <div class="design_collection_content"
									design_collection_content_id="6124"
									_sel="./_->design_collection_contents->(#6124)" type="p1"
									style="margin-bottom: 42.857142857142854px;">
        <div class="body val" style="color: #000000;">마플은 단 1장도 가능하지만<br>단체 구매는 할인 혜택이 있어요.<br>장바구니 담기 후 수량별 할인을 확인하세요.
        </div>
    </div>
    <div class="design_collection_content"
									design_collection_content_id="6125"
									_sel="./_->design_collection_contents->(#6125)" type="full_img"
									style="margin-bottom: 128.57142857142858px;">
        <div class="body">
            <div class="wrapper">
                <div class="thumbnail_url">
                    <div class="body">
													<img
														src="//s3.marpple.co/files/u_1364732/2022/10/original/e5242329dda01dc2c2448c7a7d471020d66119fe1.jpg"></img>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="design_collection_content"
									design_collection_content_id="4277"
									_sel="./_->design_collection_contents->(#4277)" type="h1"
									style="margin-bottom: 17.142857142857142px;">
        <div class="body val" style="color: #000000;">ABOUT BRAND</div>
    </div>
    <div class="design_collection_content"
									design_collection_content_id="6038"
									_sel="./_->design_collection_contents->(#6038)" type="full_img"
									style="margin-bottom: 34.285714285714285px;">
        <div class="body">
            <div class="wrapper">
                <div class="thumbnail_url">
                    <div class="body">
													<img
														src="//s3.marpple.co/files/u_1364732/2022/10/original/5a55623f630e63c76504a50ac2266eeb323380ce1.png"></img>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="design_collection_content"
									design_collection_content_id="4278"
									_sel="./_->design_collection_contents->(#4278)" type="p1"
									style="margin-bottom: 42.857142857142854px;">
        <div class="body val" style="color: #000000;">아시아 NO.1 무지 티셔츠 브랜드<br>프린트스타 & 글리머는 동양인 체형에 최적화된<br>핏과 스타일을
            제안합니다.<br>뛰어난 품질을 합리적인 가격으로 만나보세요.<br>*젤란은 프린트스타로 통합되었습니다.</div>
    </div>
    <div class="design_collection_content"
									design_collection_content_id="4279"
									_sel="./_->design_collection_contents->(#4279)" type="full_img"
									style="margin-bottom: 128.57142857142858px;">
        <div class="body">
            <div class="wrapper">
                <div class="thumbnail_url">
                    <div class="body">
													<img
														src="//s3.marpple.co/files/u_1325934/2022/11/original/6d3b249511dbb0ce81a55627a3f41f4a1010d4f21.jpg"></img>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="design_collection_content"
									design_collection_content_id="4157"
									_sel="./_->design_collection_contents->(#4157)" type="h1"
									style="margin-bottom: 17.142857142857142px;">
        <div class="body val" style="color: #000000;">나만의 애착 후드 집업</div>
    </div>
    <div class="design_collection_content"
									design_collection_content_id="4158"
									_sel="./_->design_collection_contents->(#4158)" type="p1"
									style="margin-bottom: 42.857142857142854px;">
        <div class="body val" style="color: #000000;">반려동물, 나의 최애, 좋아하는 사진이나 그림,<br>무엇이든 가능해요.<br>입고 있는 순간, 매일이 행복할거에요.
        </div>
    </div>
    <div class="design_collection_content"
									design_collection_content_id="4159"
									_sel="./_->design_collection_contents->(#4159)" type="full_img"
									style="margin-bottom: 128.57142857142858px;">
        <div class="body">
            <div class="wrapper">
                <div class="thumbnail_url">
                    <div class="body">
													<img
														src="//s3.marpple.co/files/u_1364732/2022/9/original/52c20ef879b3c88fb0dcb8b51feb5acb757eda6b1.jpg"></img>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="design_collection_content"
									design_collection_content_id="4160"
									_sel="./_->design_collection_contents->(#4160)" type="h1"
									style="margin-bottom: 17.142857142857142px;">
        <div class="body val" style="color: #000000;">소속감, 단결, 팀웍</div>
    </div>
    <div class="design_collection_content"
									design_collection_content_id="4161"
									_sel="./_->design_collection_contents->(#4161)" type="p1"
									style="margin-bottom: 42.857142857142854px;">
        <div class="body val" style="color: #000000;">우리를 상징하는 로고, 슬로건으로<br>단체 유니폼을 제작해보세요.<br>팀웍은 물론이고 구성원의 전문성이 더
            돋보일거에요.</div>
    </div>
    <div class="design_collection_content"
									design_collection_content_id="4162"
									_sel="./_->design_collection_contents->(#4162)" type="full_img"
									style="margin-bottom: 128.57142857142858px;">
        <div class="body">
            <div class="wrapper">
                <div class="thumbnail_url">
                    <div class="body">
													<img
														src="//s3.marpple.co/files/u_1364732/2022/9/original/c71e4d730c3b9f52386077805913671ce9adece61.jpg"></img>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="design_collection_content"
									design_collection_content_id="4163"
									_sel="./_->design_collection_contents->(#4163)" type="h1"
									style="margin-bottom: 17.142857142857142px;">
        <div class="body val" style="color: #000000;">소중한 기념일을 더 특별하게</div>
    </div>
    <div class="design_collection_content"
									design_collection_content_id="4164"
									_sel="./_->design_collection_contents->(#4164)" type="p1"
									style="margin-bottom: 42.857142857142854px;">
        <div class="body val" style="color: #000000;">가족, 커플, 친구와의 여행을 계획한다면<br>우리만의 커스텀 웨어로 특별한 추억을 선물하세요.</div>
    </div>
    <div class="design_collection_content"
									design_collection_content_id="4165"
									_sel="./_->design_collection_contents->(#4165)" type="full_img"
									style="margin-bottom: 128.57142857142858px;">
        <div class="body">
            <div class="wrapper">
                <div class="thumbnail_url">
                    <div class="body">
													<img
														src="//s3.marpple.co/files/u_1364732/2022/9/original/641c98a91e8294182924ecc5c052073abfe6cc301.jpg"></img>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="design_collection_content"
									design_collection_content_id="4169"
									_sel="./_->design_collection_contents->(#4169)" type="h1"
									style="margin-bottom: 17.142857142857142px;">
        <div class="body val" style="color: #000000;">사진 후기만 무려 9만 개</div>
    </div>
    <div class="design_collection_content"
									design_collection_content_id="4170"
									_sel="./_->design_collection_contents->(#4170)" type="p1"
									style="margin-bottom: 42.857142857142854px;">
        <div class="body val" style="color: #000000;">마플만의 독보적인 인쇄 퀄리티는 이미 검증되었어요.<br />너, 나, 우리를 표현할 아이디어만 준비하세요.</div>
    </div>
    <div class="design_collection_content"
									design_collection_content_id="4171"
									_sel="./_->design_collection_contents->(#4171)" type="full_img"
									style="margin-bottom: 128.57142857142858px;">
        <div class="body">
            <div class="wrapper">
                <div class="thumbnail_url">
                    <div class="body">
													<img
														src="//s3.marpple.co/files/u_1364732/2022/9/original/485b7d602803adb75619526d5bebc2acd70b9db61.jpg"></img>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="design_collection_content"
									design_collection_content_id="4172"
									_sel="./_->design_collection_contents->(#4172)" type="h1"
									style="margin-bottom: 17.142857142857142px;">
        <div class="body val" style="color: #000000;">타협 없는 품질에 대한 자부심</div>
    </div>
    <div class="design_collection_content"
									design_collection_content_id="4173"
									_sel="./_->design_collection_contents->(#4173)" type="p1"
									style="margin-bottom: 42.857142857142854px;">
        <div class="body val" style="color: #000000;">마플은 디지털 프린팅, 실크 스크린, 플렉스, 전사, 자수 등<br>각 의류 특성에 적합한 풍부한 인쇄 방식을
            제공합니다.<br>업계 최고의 기술력을 갖춘 전문가에게 맡기세요.</div>
    </div>
    <div class="design_collection_content"
									design_collection_content_id="4174"
									_sel="./_->design_collection_contents->(#4174)" type="full_img"
									style="margin-bottom: 8.571428571428571px;">
        <div class="body">
            <div class="wrapper">
                <div class="thumbnail_url">
                    <div class="body">
													<img
														src="//s3.marpple.co/files/u_1364732/2022/9/original/428d63e5f02f87f57c9429dd06d081726a32638b1.jpg"></img>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="design_collection_content"
									design_collection_content_id="4175"
									_sel="./_->design_collection_contents->(#4175)" type="full_img"
									style="margin-bottom: 128.57142857142858px;">
        <div class="body">
            <div class="wrapper">
                <div class="thumbnail_url">
                    <div class="body">
													<img
														src="//s3.marpple.co/files/u_1364732/2022/9/original/759d30a3f30ee430b11b4cb4567072d558f582751.jpg"></img>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="design_collection_content"
									design_collection_content_id="4176"
									_sel="./_->design_collection_contents->(#4176)" type="h1"
									style="margin-bottom: 42.857142857142854px;">
        <div class="body val" style="color: #000000;">후드 집업과 함께 보면 좋은 상품</div>
    </div>
    <div class="design_collection_content"
									design_collection_content_id="4177"
									_sel="./_->design_collection_contents->(#4177)" type="items"
									style="margin-bottom: 0px;">
        <div class="body">
            <div class="wrapper">
                <div class="design_collection_content_items" lines="1">
                    <div class="design_collection_content_item"
													_sel="./_->design_collection_content_items->(#5089)"">
													<div class=" wrapper">
														<a href="/product/detail?bp_id=4673&pc_id=11276216"
															class="img_wrapper"><img
															src="https://image1.marpple.co/files/u_1812399/2022/9/original/968948ad118ce96b66e7457622830f61b8de8ff91.png?q=90&w=484&f=jpeg&bg=f6f6f6"></a>
                        <div class="info">
                            <div class="name">
                                <div class="pc_name">필잇 시그니처 오버핏 기모 맨투맨</div>
                            </div>
                            <div class="mp_currency price">20,900</div>
                        </div>
                    </div>
                </div>
                <div class="design_collection_content_item"
													_sel="./_->design_collection_content_items->(#5090)"">
													<div class=" wrapper">
														<a href="/product/detail?bp_id=3125&pc_id=11276217"
															class="img_wrapper"><img
															src="https://image1.marpple.co/files/u_1812399/2022/9/original/35f1282374ad0c5045a96d981a7ec89513d87b661.png?q=90&w=484&f=jpeg&bg=f6f6f6"></a>
                    <div class="info">
                        <div class="name">
                            <div class="pc_name">길단 12500 베이직 후드 (USA 핏) 기능성/기모</div>
                        </div>
                        <div class="mp_currency price">30,900</div>
                    </div>
                </div>
            </div>
            <div class="design_collection_content_item"
													_sel="./_->design_collection_content_items->(#5091)"">
													<div class=" wrapper">
														<a href="/product/detail?bp_id=4663&pc_id=11276218"
															class="img_wrapper"><img
															src="https://image1.marpple.co/files/u_1812399/2022/9/original/b7ca4a88bc9a7728194f79459e2bd23baa4117311.png?q=90&w=484&f=jpeg&bg=f6f6f6&r=85"></a>
                <div class="info">
                    <div class="name">
                        <div class="pc_name">페어플레이 에센셜 와이드 스웨트 팬츠</div>
                    </div>
                    <div class="mp_currency price">32,000</div>
                </div>
            </div>
        </div>
        <div class="design_collection_content_item"
													_sel="./_->design_collection_content_items->(#5092)"">
													<div class="
            wrapper">
														<a href="/product/detail?bp_id=4112&pc_id=11276219"
															class="img_wrapper"><img
															src="https://image1.marpple.co/files/u_1812399/2022/9/original/16e1d7a76af56deee7c5d494c699b98752b920e71.png?q=90&w=484&f=jpeg&bg=f6f6f6"></a>
            <div class="info">
                <div class="name">
                    <div class="pc_name">프린트스타 17수 라운드 티셔츠(남녀공용)</div>
                </div>
                <div class="mp_currency price">8,900</div>
            </div>
        </div>
    </div>
</div>
						
						<!-- 브랜드 스토리 끝 -->
						</textarea>
						<label for="prod_info_editor" class="form-label">제품 상세 정보</label>
						<textarea class="summernote" id="prod_info_editor"
							name="prod_info">
						
						<!-- 제품 상세 정보 -->
						
<div class="product_detail_tab_body" data-tab_name="BP_DETAIL_TAB"
								data-is_hidden="false">
    <div class="tab_wrapper">
        <div class="toggle_cont toggle_cont_img product_info"
										is_open="true">
            <div class="tg_head">
                <span class="tit">상품 정보</span>
                <span class="btn"></span>
            </div>
            <div class="tg_body">
                <div class="product_info_text">
                    <p>다양한 색상으로 제작되어 선택의 폭이 넓으며 캐주얼하게 착용하기 좋습니다.</p>
                    <ul>
                        <li>소재 : 코튼 100% (모쿠 그레이 : 코튼 90% 폴리 10%)</li>
                        <li>제조사 : JELLAN</li>
                        <li>제조국 : Made In Bangladesh, Made In Vietnam</li>
                        <li>사이즈 : S,M,L,XL,2XL</li>
                        <li>핏 : 정사이즈 (남녀공용)</li>
                        <li>신축성 : 신축성 약간 있음</li>
                        <li>감촉 : 부드러운 감촉</li>
                        <li>두께 : 도톰한 소재</li>
                    </ul>
                    <p>
													<strong>주의사항</strong>
												</p>
                    <ul>
                        <li>모델컷의 경우 촬영장소의 환경에 따라 실제 색상과 상이할 수 있습니다.</li>
                        <li>젤란 제품은 프린트스타 라벨과 혼용되어 제작, 배송됩니다. 사이즈, 소재, 핏 모두 동일한 제품입니다.</li>
                    </ul>
                    <p>
													<strong>세탁방법</strong>
												</p>
                    <ul>
                        <li>드라이크리닝 또는 단독 손세탁가능합니다.</li>
                        <li>찬물에 뒤집어 세탁해 주십시오.</li>
                        <li>다리미 사용 시 천을 올린 후 다림질해 주십시오.</li>
                    </ul>
                    <p>
													<strong>MODEL SIZE</strong>
												</p>
                    <ul>
                        <li>착용사이즈 2XL, 키 186, 허리 25, 신발 280</li>
                    </ul>
                </div>
                <div
												class="product_info_text product_info_text--precautions">
                    <p>
													<strong>구매 시 주의사항</strong>
					</p>
                    <ul>
                        <li>전자상거래 등에서의 소비자보호에 관한 법률에 의거하여 미성년자가 물품을 구매하는 경우, 법정대리인이 동의하지 않으면 미성년자 본인 또는 법정대리인이 구매를 취소할 수
                            있습니다.</li>
                    </ul>
                </div>

            </div>
        </div>

        <div class="toggle_cont tg_size" is_open="true">
            <div class="tg_head">
                <span class="tit">사이즈 정보</span>
                <span class="btn"></span>
            </div>
            <div class="tg_body">
                <table class="a-table">
                    <tbody>
                        <tr>
                            <th>Size (cm)</th>
                            <th>S</th>
                            <th>M</th>
                            <th>L</th>
                            <th>XL</th>
                            <th>2XL</th>
                        </tr>
                        <tr>
                            <th>총기장</th>
                            <td>61</td>
                            <td>64</td>
                            <td>66</td>
                            <td>70</td>
                            <td>73</td>
                        </tr>
                        <tr>
                            <th>어깨넓이</th>
                            <td>41</td>
                            <td>44</td>
                            <td>48</td>
                            <td>51</td>
                            <td>54</td>
                        </tr>
                        <tr>
                            <th>가슴둘레</th>
                            <td>45</td>
                            <td>49</td>
                            <td>52</td>
                            <td>55.5</td>
                            <td>57.5</td>
                        </tr>
                        <tr>
                            <th>소매길이</th>
                            <td>60</td>
                            <td>61</td>
                            <td>61</td>
                            <td>62</td>
                            <td>62</td>
                        </tr>
                    </tbody>
                </table>
                <div class="size_tip" has_size_info_url="true">
                    <div class="size_info_url">
                        <img
														src="//s3.marpple.co/files/u_1703564/2022/3/original/66fecaf514124d76a80a84c44270937dbb7f9e5e1.jpg"
														alt="">
                    </div>
                    <ul>
                        <li>
                            상세 사이즈는 측정 방법과 위치에 따라 1~3cm 오차가 발생할 수 있습니다. 기재된 상세 사이즈와 실측
                            오차(1~3cm)에 대한 불량처리는 어려우며 교환 및 환불 사유가 될 수 없습니다.
                        </li>
                        <li>
                            마플에서 판매되는 상품은 각 브랜드, 도매처에서 각각의 샘플링을 거쳐 공급되는 제품이므로, 특정 브랜드
                            또는 가지고 계신 상품과 상세 사이즈가 다를 수 있습니다.<br>
                            실측구매 시 상세 사이즈를 반드시 확인 부탁드립니다.
                        </li>
                        <li>
                            사이즈 측정은 상품을 바닥에 펼친 후 끝선과 끝선까지 측정해야하며, 신축성 있는 소재일 경우,
                            잡아당기지 않고 바닥에 펼쳐진 상태 그대로 측정해야합니다. 오차범위 이외 잘못된 측정으로 인한 반품 및
                            교환은 어려운 점 양해 부탁드립니다.
                        </li>


                    </ul>
                </div>

            </div>
        </div>

    </div>
</div>
<div class="product_detail_tab_body" data-tab_name="MANUFACTURE_TAB"
								data-is_hidden="false">
    <div class="tab_wrapper">
        <div class="toggle_cont tg_print" is_open="true">
            <div class="tg_head">
                <span class="tit">인쇄 관련 사항</span>
                <span class="btn"></span>
            </div>
            <div class="tg_body">
                <div class="print_area">
                    <div class="img1">
                        <img
														src="//s3.marpple.co/files/u_218933/2020/1/original/1447427615f02a618208be86c5f98f28ba80d89291cabec.png"
														alt="" class="pc">
                        <img
														src="//s3.marpple.co/files/u_218933/2020/1/original/1447431a273455f34397ee326029512f66cb1fac2d0b341.png"
														alt="" class="m">
                    </div>
                    <h2>주의사항</h2>
                    <ul class="list1">
                        <li>
                            배경이 투명한 PNG의 경우, CMYK 색상모드로 웹용(Save for Web) 저장해 주세요.<br>배경이 꽉 찬 JPG의
                            경우, RGB 색상모드로 저장해 주세요.<br>이미지 크기는 최소 2500~3500px / 해상도는 150dpi 이상으로
                            제작해 주세요.
                        </li>
                        <li>상품마다 이미지 크기가 다르므로, 해당 상품의 이미지 가이드를 확인해 주세요.</li>
                        <li>작은 원본 이미지를 사이즈 규격에 맞게 임의로 크게 확대할 경우 인쇄 시 화질이 깨질 수 있습니다.</li>
                        <li>상품 실측 사이즈를 반드시 확인해 주세요.</li>
                        <li>
                            인쇄를 원하시는 위치가 있을 시 [상품 제작 요청사항]에 남겨주시거나, 1:1 상담 또는
                            고객센터(help@marpple.com)로 메일 주세요.
                        </li>
                        <li>모니터, 핸드폰에 따라 실제 인쇄 색상과 다르게 보일 수 있습니다.</li>
                    </ul>
                    <h2>교환/환불 불가 사항</h2>
                    <p class="txt1">
                        마플의 모든 상품은 고객 주문에 따라 개별 제작되는 방식으로 단순 변심을 포함, 아래의 경우에는 교환 /
                        환불이 불가합니다.
                    </p>
                    <h3>- 디자인 시안 색상의 차이</h3>
                    <p class="txt2">
                        프린팅 방식과 원단 재질에 따른 경우의 수가 다양하므로 인쇄 후 모니터, 혹은 종이 출력물과 색상 차이가
                        발생할 수 있습니다.
                    </p>
                    <h3>- 인쇄 위치 및 크기의 차이</h3>
                    <p class="txt2">
                        제품 재질에 따른 특성의 차이와 대부분의 인쇄가 수작업으로 이루어진다는 점에서 시안과 실제 상품의 인쇄
                        위치 및 크기의 오차가 발생할 수 있습니다. 인쇄 위치 및 크기를 별도로 [요청] 하지 않은 주문건에 대한 교환
                        또는 환불은 불가합니다.
                    </p>
                    <h3>- 추가 주문 시 기존 상품 색상과의 컬러 차이</h3>
                    <p class="txt2">
                        상품 컬러 및 사이즈는 제작 시기별, 생산시즌별로 원단 컬러와 사이즈 차이가 발생할 수 있습니다.
                    </p>
                    <h3>- 화학 제품 사용으로 인한 손상</h3>
                    <p class="txt2">
                        우레탄 전사(PU Heat Transfer) 인쇄 제품에 솔벤트와 같은 용해력이 있는 용매를 사용한 향수를 직접적으로
                        분사할 경우 인쇄 부분이 손상될 수 있으니 주의해 주세요.
                    </p>
                    <h2>교환/환불 기간</h2>
                    <p class="txt1">
                        물품에 문제 되는 사항에 대해서는 수령 후 7일 이내 이메일
                        <a href="mailto:help@marpple.com">help@marpple.com</a> 또는 고객센터로 연락주셔야 가능합니다.
                    </p>
                    <p class="txt1">
                        ★ 주문 완료 후 상품 및 이미지 변경을 원하실 경우 [제작준비중] 상태에서만 변경이 가능하며 [제작중]에는
                        변경 및 취소가 불가합니다. 변경을 원하시는 경우 1:1 상담 및 카톡 또는 고객센터(<a
														href="tel:1566-9437">1566-9437</a>)를 통해 문의
                        바랍니다.
                    </p>
                </div>
            </div>
        </div>
        <div class="toggle_cont tg_faq" is_open="false">
            <div class="tg_head">
                <span class="tit">자주 묻는 질문</span>
                <span class="btn"></span>
            </div>
            <div class="tg_body">
                <div class="faq_area">
                    <ul>
                        <li>
                            <div class="q">저작권이 있는 이미지 사용이 가능한가요?</div>
                            <div class="a">
                                마플은 모든 저작권자를 존중합니다. 이미지의 저작권자 또는 원작자가 공공으로 쓸 수 있는 이미지라고
                                명시했거나, 저작권이 만료된 이미지에 한해 사용이 가능합니다.
                            </div>
                        </li>
                        <li>
                            <div class="q">원하는 디자인을 의뢰할 수 있나요?</div>
                            <div class="a">
                                마플은 고객 맞춤 디자인을 제공하지 않습니다.<br>
                                단, 업로드 한 이미지의 배경 제거 및 로고 컬러 수정 등 원활한 인쇄 작업을 위한 간단한 수정만
                                제공합니다.
                            </div>
                        </li>
                        <li>
                            <div class="q">배경 제거가 가능한가요?</div>
                            <div class="a">
                                가능합니다. 주문 시 [배경 지우기] 요청에 체크 후 주문해 주세요.<br>배경 제거가 불가한 경우 별도로
                                연락드립니다.
                            </div>
                        </li>
                        <li>
                            <div class="q">인쇄 가능한 영역을 벗어났다는 메시지가 확인됩니다.</div>
                            <div class="a">
                                올려주신 이미지 또는 텍스트가 인쇄 영역보다 크게 삽입되었을 경우 팝업 되는 메시지입니다.<br>
                                이미지 또는 텍스트 크기를 줄여서 인쇄 영역 안으로 이미지를 조정해 주세요.
                            </div>
                        </li>
                        <li>
                            <div class="q">AI나 PSD 파일로 제작할 수 있나요?</div>
                            <div class="a">
                                가능합니다. 주문 후 원본 파일을 <a
																href="mailto:help@marpple.com">help@marpple.com</a>으로
                                전송해주시면 원본 파일로 보다 깔끔한 제작이 가능합니다.
                            </div>
                        </li>
                        <li>
                            <div class="q">자수로 제작하고 싶어요.</div>
                            <div class="a">
                                자수의 경우 주문 시 [상품 제작 요청사항] 메모를 남겨 주시면, 디자인 검토 후 가능 여부를 알려드리며,
                                추가 비용이 발생할 수 있습니다.
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="toggle_cont tg_delivery" is_open="false">
            <div class="tg_head">
                <span class="tit">배송안내</span>
                <span class="btn"></span>
            </div>
            <div class="tg_body">
                <div class="delivery_area">
                    <ul>
                        <li>
                            - 제품은 100% 주문 제작으로 만들어지며, 출고 이후에도 택배사의 사정에 따라 변수가 생길 수 있습니다.
                        </li>
                        <li>
                            - 주문 전 1:1 상담 / 전화 상담 등을 통해 제작 일정을 확인하신 후 주문하시면 친절하게 안내해드립니다.
                        </li>
                        <li>
                            - 대량 단체주문건의 경우에는 주문 및 결제 완료 후 영업일 기준으로 약 7~10일 가량 소요될 수 있습니다.
                        </li>
                    </ul>
                    <div class="delivery_table">
                        <h2>택배배송</h2>
                        <table>
                            <tbody>
                                <tr>
                                    <th>배송 지역</th>
                                    <td>CJ대한통운 / 전국지역</td>
                                </tr>
                                <tr>
                                    <th>상담 시간</th>
                                    <td>1588-1255 (평일 9AM-6PM / 토요일 9AM~ 1PM)</td>
                                </tr>
                                <tr>
                                    <th>배송비</th>
                                    <td>3,000원</td>
                                </tr>
                                <tr>
                                    <th>배송 기간</th>
                                    <td>
                                        택배사로 상품 출고 후 영업일 기준 1~2일 이내 수령 (단, 지역 및 배송사 상황에 따라 달라질 수 있음)
                                    </td>
                                </tr>
                            </tbody>
                        </table>

                        <h2>퀵배송</h2>
                        <table>
                            <tbody>
                                <tr>
                                    <th>출발지</th>
                                    <td>서울시 금천구 가산동</td>
                                </tr>
                                <tr>
                                    <th>배송 비용</th>
                                    <td>
                                        구간 요금은 30분 ~120분 처리 기준이며 지역, 시간, 부피, 날씨 등에 따라 추가 할증이 붙을 수
                                        있습니다.<br>
                                        <span class="price_table">지역별 착불 예상 요금표 보기</span>
                                    </td>
                                </tr>
                            </tbody>
                        </table>

                        <h2>방문 수령</h2>
                        <table>
                            <tbody>
                                <tr>
                                    <th>수령 안내</th>
                                    <td>
                                        주문 시 "방문수령"을 선택하시면 직접 방문하셔서 수령하실 수 있습니다. 제품이 완성되면 주문 시
                                        입력한 연락처로 문자메시지를 발송해드립니다.
                                    </td>
                                </tr>
                                <tr>
                                    <th>주소</th>
                                    <td>
                                        <span>서울 금천구 가산디지털1로 75-24 아이에스비즈타워 10층</span>
                                        <div class="map">
                                            <a
																			href="http://naver.me/5qRUQ5oI" target="_blank">
                                                <img
																			src="//s3.marpple.co/files/u_218933/2021/4/original/7edbcc2936cec7c649fb7c4972fcf268bf14d3481.jpg"
																			style="max-width: 100%;" alt="마플 위치">
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>오시는길</th>
                                    <td>
                                        [지하철 이용 시]<br>
                                        1, 7호선 가산디지털단지역 6번 출구 맞은편 마을버스 5번 탑승 후 마이크로오피스 하차<br>
                                        1, 7호선 가산디지털단지역 5번 출구로 나와 길 건너 800m 도보<br>
                                        7호선 독산역 2번 출구 맞은편 마을버스 금천 05번 탑승 후 에이스태세리타워 하차<br>
                                        7호선 독산역 2번 출구로 나와 800m 도보<br><br>

                                        [자가용 이용 시] <br>
                                        아이에스비즈타워 건물 내 지하 주차장 이용
                                    </td>
                                </tr>
                                <tr>
                                    <th>방문 시간</th>
                                    <td>10:00 ~ 19:00 (주말/공휴일 제외)</td>
                                </tr>
                                <tr>
                                    <th>전화</th>
                                    <td>
                                        <a href="tel:1566-9437">1566-9437</a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="toggle_cont tg_guide" is_open="false">
            <div class="tg_head">
                <span class="tit">품질보증/청약철회 안내</span>
                <span class="btn"></span>
            </div>
            <div class="tg_body">
                <div class="guide_area">
                    <h2>품질보증기준</h2>
                    <ul class="list1">
                        <li>
                            - 본 제품은 철저한 품질관리와 공정관리를 거쳐 생산되었으며 외관, 규격, 물성검사에서 합격한 제품입니다.
                        </li>
                        <li>
                            - 본 제품의 수명을 연장시키기 위하여 제품에 부착된 취급주의사항과 세탁방법을 필히 확인해주시기
                            바랍니다.
                        </li>
                        <li>- 본 제품의 품질에 이상이 있을 경우 소비자 상담실로 연락 주시기 바랍니다.</li>
                        <li>- 본 제품의 품질에 이상이 있을 경우 제품 수령일로부터 7일 이내 반품/환불 가능합니다.</li>
                    </ul>
                    <h2>청약철회안내</h2>
                    <h3>- 가능한 경우</h3>
                    <p class="txt1">
                        제품에 문제가 있거나, 판매자의 실수로 인해 교환, 반품이 필요한 경우 (제품 불량인 경우 동일 상품 / 동일
                        사이즈 / 동일한 색상으로 교환하거나 환불)
                    </p>
                    <h3>- 불가능한 경우</h3>
                    <ul class="list2">
                        <li>주문 제작 상품인 경우</li>
                        <li>
                            착용한 흔적이 남아있거나 세탁을 한 경우, 오염이나 특정한 향이 배어 있는 경우, 임의로 수선하신 경우,
                            상품이 훼손 된 경우 (다만, 제품 확인을 위해 포장을 열어본 경우에는 청약철회를 할 수 있습니다.)
                        </li>
                        <li>시간의 경과에 의하여 재판매가 곤란할 정도로 상품의 가치가 현저히 감소한 경우</li>
                    </ul>
                    <p class="txt2">
                        고객센터로 교환 및 반품 접수하신 후 7일 이내 제품이 도착해야 합니다. 단순 변심에 의한 교환 및 반품은
                        고객이 택배비용을 전액 부담합니다.<br>
                        (반품시에는 CJ택배를 이용해 주세요. 다른 택배사를 이용하실 때는 택배비용을 선불로 보내주세요)
                    </p>
                    <p class="txt3">소비자 피해보상 처리 및 상품 문의처: 고객센터 <a
														href="tel:1566-9437">1566-9437</a>
												</p>
                </div>
            </div>
        </div>
        <div class="bp_info_pop_buttons">
            <span class="print">인쇄 관련 사항</span><span class="faq">자주 묻는 질문</span><span
											class="delivery">배송안내</span><span class="guide">품질보증/청약철회 안내</span>
        </div>
    </div>
</div>
						
						
						
						<!-- 상세정보 끝 -->
						</textarea>
					</div>

					<div class="col-md-12">
						<input type="submit" id='prod-reg-btn' class="btn btn-primary"
							form="prod-reg-form" value="등록">
					</div>
				</form>

			</div>
		</div>

		<!-- include footer -->
		<%@ include file="../include/footer.jsp"%>