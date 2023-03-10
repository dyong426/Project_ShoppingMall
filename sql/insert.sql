-- product

-- insert main category
INSERT INTO main_ctgr VALUES(1, '의류','assets\common\images\prod_img\admin.png');
INSERT INTO main_ctgr VALUES(2, '폰케이스','assets\common\images\prod_img\admin.png');
INSERT INTO main_ctgr VALUES(3, '홈데코','assets\common\images\prod_img\admin.png');
INSERT INTO main_ctgr VALUES(4, '액자','assets\common\images\prod_img\admin.png');


-- insert sub category
-- clothes
INSERT INTO sub_ctgr VALUES(1,'후드티',1);
INSERT INTO sub_ctgr VALUES(2,'맨투맨',1);
INSERT INTO sub_ctgr VALUES(3,'반팔티',1);

-- phone case
INSERT INTO sub_ctgr VALUES(4,'아이폰',2);
INSERT INTO sub_ctgr VALUES(5,'갤럭시',2);

-- home deco
INSERT INTO sub_ctgr VALUES(6,'무드등',3);
INSERT INTO sub_ctgr VALUES(7,'머그컵',3);
INSERT INTO sub_ctgr VALUES(8,'텀블러',3);

-- photo frame
INSERT INTO sub_ctgr VALUES(9,'디아섹 액자',4);
INSERT INTO sub_ctgr VALUES(10,'HD 메탈액자',4);
INSERT INTO sub_ctgr VALUES(11,'포토타일',4);
SELECT * FROM sub_ctgr;

-- colors example
--'RED', '#FF0000'
--'BLUE', '#0000FF'
--'GREEN', '#00FF00'
--'YELLOW', '#FFFF00'
--'PURPLE', '#800080'
--'BLACK', '#000000'
--'WHITE', '#FFFFFF'

-- insert prod
-- clothes
INSERT INTO prods VALUES(p_seq.nextval,'젤란 라이트 후드집업',29200,'코튼 100%','resources\assets\common\images\prod_img\admin.png',1);            -- 1. 제품 테이블 insert
INSERT INTO prod_colors VALUES(pc_seq.nextval, 'RED', '#FF0000',p_seq.currval );      -- 2. 제품 색상 추가 , p_num 시퀀스 currval insert 
INSERT INTO prod_colors VALUES(pc_seq.nextval, 'BLUE', '#0000FF',p_seq.currval );
INSERT INTO prod_colors VALUES(pc_seq.nextval, 'GREEN', '#00FF00' ,p_seq.currval);

INSERT INTO prod_sizes VALUES(ps_seq.nextval, 'S', p_seq.currval);                    -- 3. 제품 사이즈 추가, p_num 시퀀스 currval insert
INSERT INTO prod_sizes VALUES(ps_seq.nextval, 'M', p_seq.currval);
INSERT INTO prod_sizes VALUES(ps_seq.nextval, 'L', p_seq.currval);
INSERT INTO prod_sizes VALUES(ps_seq.nextval, 'XL', p_seq.currval);

INSERT INTO prod_size_info VALUES(psi_seq.nextval, '총기장', p_seq.currval);
INSERT INTO prod_size_info VALUES(psi_seq.nextval, '어깨넓이', p_seq.currval);
INSERT INTO prod_size_info VALUES(psi_seq.nextval, '가슴둘레', p_seq.currval);
INSERT INTO prod_size_info VALUES(psi_seq.nextval, '소매길이', p_seq.currval);

INSERT INTO prod_images VALUES(pi_seq.nextval, 'main_image_path'||p_seq.currval,'sub_image_path'|| p_seq.currval, p_seq.currval ); -- 4. 제품 이미지 추가

INSERT INTO prods VALUES(p_seq.nextval,'플러스82갤러리 헤비 3단쭈리 후드',27900,'코튼 100%','resources\assets\common\images\prod_img\admin.png',1);
INSERT INTO prod_colors VALUES(pc_seq.nextval, 'RED', '#FF0000',p_seq.currval );
INSERT INTO prod_colors VALUES(pc_seq.nextval, 'BLUE', '#0000FF' ,p_seq.currval);
INSERT INTO prod_colors VALUES(pc_seq.nextval, 'GREEN', '#00FF00' ,p_seq.currval);
INSERT INTO prod_colors VALUES(pc_seq.nextval, 'YELLOW', '#FFFF00' ,p_seq.currval);
INSERT INTO prod_colors VALUES(pc_seq.nextval, 'PURPLE', '#800080' ,p_seq.currval);
INSERT INTO prod_colors VALUES(pc_seq.nextval, 'BLACK', '#000000' ,p_seq.currval);

INSERT INTO prod_sizes VALUES(ps_seq.nextval, 'S', p_seq.currval);
INSERT INTO prod_sizes VALUES(ps_seq.nextval, 'M', p_seq.currval);
INSERT INTO prod_sizes VALUES(ps_seq.nextval, 'L', p_seq.currval);
INSERT INTO prod_sizes VALUES(ps_seq.nextval, 'XL', p_seq.currval);

INSERT INTO prod_images VALUES(pi_seq.nextval, 'main_image_path'||p_seq.currval,'sub_image_path'|| p_seq.currval, p_seq.currval );

INSERT INTO prods VALUES(p_seq.nextval,'프린트스타 헤비 맨투맨',22900,'코튼 100',2);
INSERT INTO prod_colors VALUES(pc_seq.nextval, 'RED', '#FF0000',p_seq.currval );
INSERT INTO prod_colors VALUES(pc_seq.nextval, 'BLUE', '#0000FF' ,p_seq.currval);
INSERT INTO prod_colors VALUES(pc_seq.nextval, 'GREEN', '#00FF00' ,p_seq.currval);
INSERT INTO prod_colors VALUES(pc_seq.nextval, 'YELLOW', '#FFFF00' ,p_seq.currval);
INSERT INTO prod_colors VALUES(pc_seq.nextval, 'PURPLE', '#800080' ,p_seq.currval);
INSERT INTO prod_colors VALUES(pc_seq.nextval, 'BLACK', '#000000' ,p_seq.currval);

INSERT INTO prod_sizes VALUES(ps_seq.nextval, 'S', p_seq.currval);
INSERT INTO prod_sizes VALUES(ps_seq.nextval, 'M', p_seq.currval);
INSERT INTO prod_sizes VALUES(ps_seq.nextval, 'L', p_seq.currval);
INSERT INTO prod_sizes VALUES(ps_seq.nextval, 'XL', p_seq.currval);

INSERT INTO prod_images VALUES(pi_seq.nextval, 'main_image_path'||p_seq.currval,'sub_image_path'|| p_seq.currval, p_seq.currval );

INSERT INTO prods VALUES(p_seq.nextval,'트리플에이 1301 스트릿 티셔츠',9900, '면 100% (모투 그레이: 면60%폴리에스터40%)','resources\assets\common\images\prod_img\admin.png',3);
INSERT INTO prod_colors VALUES(pc_seq.nextval, 'RED', '#FF0000',p_seq.currval );
INSERT INTO prod_colors VALUES(pc_seq.nextval, 'BLUE', '#0000FF' ,p_seq.currval);
INSERT INTO prod_colors VALUES(pc_seq.nextval, 'GREEN', '#00FF00' ,p_seq.currval);
INSERT INTO prod_colors VALUES(pc_seq.nextval, 'YELLOW', '#FFFF00' ,p_seq.currval);
INSERT INTO prod_colors VALUES(pc_seq.nextval, 'PURPLE', '#800080' ,p_seq.currval);
INSERT INTO prod_colors VALUES(pc_seq.nextval, 'BLACK', '#000000' ,p_seq.currval);

INSERT INTO prod_sizes VALUES(ps_seq.nextval, 'S', p_seq.currval);
INSERT INTO prod_sizes VALUES(ps_seq.nextval, 'M', p_seq.currval);
INSERT INTO prod_sizes VALUES(ps_seq.nextval, 'L', p_seq.currval);
INSERT INTO prod_sizes VALUES(ps_seq.nextval, 'XL', p_seq.currval);

INSERT INTO prod_images VALUES(pi_seq.nextval, 'main_image_path'||p_seq.currval,'sub_image_path'|| p_seq.currval, p_seq.currval );

-- phone case
INSERT INTO prods VALUES(p_seq.nextval,'아이폰 14 젤리케이스', 15300,'TPU(폴리우레탄)','resources\assets\common\images\prod_img\admin.png',4);
INSERT INTO prod_colors VALUES(pc_seq.nextval, 'BLUE', '#0000FF' ,p_seq.currval);
INSERT INTO prod_colors VALUES(pc_seq.nextval, 'GREEN', '#00FF00' ,p_seq.currval);
INSERT INTO prod_colors VALUES(pc_seq.nextval, 'YELLOW', '#FFFF00' ,p_seq.currval);
INSERT INTO prod_colors VALUES(pc_seq.nextval, 'PURPLE', '#800080' ,p_seq.currval);

INSERT INTO prod_sizes VALUES(ps_seq.nextval, '아이폰14', p_seq.currval);

INSERT INTO prod_images VALUES(pi_seq.nextval, 'main_image_path'||p_seq.currval,'sub_image_path'|| p_seq.currval, p_seq.currval );

INSERT INTO prods VALUES(p_seq.nextval,'아이폰 13 범퍼케이스', 18900,'겉 - 폴리카보네이트, 안 - 실리콘','resources\assets\common\images\prod_img\admin.png',4);
INSERT INTO prod_colors VALUES(pc_seq.nextval, 'BLUE', '#0000FF' ,p_seq.currval);
INSERT INTO prod_colors VALUES(pc_seq.nextval, 'GREEN', '#00FF00' ,p_seq.currval);
INSERT INTO prod_colors VALUES(pc_seq.nextval, 'YELLOW', '#FFFF00' ,p_seq.currval);
INSERT INTO prod_colors VALUES(pc_seq.nextval, 'PURPLE', '#800080' ,p_seq.currval);

INSERT INTO prod_sizes VALUES(ps_seq.nextval, '아이폰13', p_seq.currval);

INSERT INTO prod_images VALUES(pi_seq.nextval, 'main_image_path'||p_seq.currval,'sub_image_path'|| p_seq.currval, p_seq.currval );


INSERT INTO prods VALUES(p_seq.nextval,'갤럭시 Z 플립4 하드케이스', 15300, '폴리카보네이트', 'resources\assets\common\images\prod_img\admin.png',5);
INSERT INTO prod_colors VALUES(pc_seq.nextval, 'BLUE', '#0000FF' ,p_seq.currval);
INSERT INTO prod_colors VALUES(pc_seq.nextval, 'GREEN', '#00FF00' ,p_seq.currval);
INSERT INTO prod_colors VALUES(pc_seq.nextval, 'YELLOW', '#FFFF00' ,p_seq.currval);
INSERT INTO prod_colors VALUES(pc_seq.nextval, 'PURPLE', '#800080' ,p_seq.currval);

INSERT INTO prod_sizes VALUES(ps_seq.nextval, '갤럭시Z 플립4', p_seq.currval);

INSERT INTO prod_images VALUES(pi_seq.nextval, 'main_image_path'||p_seq.currval,'sub_image_path'|| p_seq.currval, p_seq.currval );



INSERT INTO prods VALUES(p_seq.nextval,'갤럭시 S22 울트라 하드케이스' , 15300, '폴리카보네이트','resources\assets\common\images\prod_img\admin.png', 5);

INSERT INTO prod_colors VALUES(pc_seq.nextval, 'BLUE', '#0000FF' ,p_seq.currval);
INSERT INTO prod_colors VALUES(pc_seq.nextval, 'GREEN', '#00FF00' ,p_seq.currval);
INSERT INTO prod_colors VALUES(pc_seq.nextval, 'YELLOW', '#FFFF00' ,p_seq.currval);
INSERT INTO prod_colors VALUES(pc_seq.nextval, 'PURPLE', '#800080' ,p_seq.currval);

INSERT INTO prod_sizes VALUES(ps_seq.nextval, '갤럭시 S22 울트라', p_seq.currval);

INSERT INTO prod_images VALUES(pi_seq.nextval, 'main_image_path'||p_seq.currval,'sub_image_path'|| p_seq.currval, p_seq.currval );



SELECT * FROM prods;
SELECT * FROM prod_colors;
SELECT * FROM prod_sizes;
SELECT * FROM prod_details;
SELECT * FROM prod_images;

-- insert prod details      -- prod details 부분 select 문으로 insert
INSERT INTO 
prod_details
SELECT 
pd_seq.nextval as pd_num,
p.p_num as p_num,
pc.pc_num as pc_num, 
ps.ps_num as ps_num,
pi.pi_num as pi_num,
10 as p_stock
FROM 
prods p, 
prod_colors pc,
prod_sizes ps,
prod_images pi
WHERE 
p.p_num = pc.p_num
AND p.p_num = ps.p_num
AND p.p_num = pi.p_num;

-- join table main_ctgr, sub_ctgr, prods, prod_colors, prod_sizes, prod_images, prod_details
SELECT 
    mc.m_ctgr_name,
    sc.s_ctgr_name,
    pd.pd_num,
    p.p_num,
    p.p_name,
    pc.pc_name,
    ps.ps_name,
    p.p_price,
    pi.pi_main_path,
    pi.pi_thumb_path
FROM prod_details pd, prods p, sub_ctgr sc, main_ctgr mc, prod_colors pc, prod_sizes ps, prod_images pi
WHERE 
    pd.p_num = p.p_num
    AND p.s_ctgr_num = sc.s_ctgr_num
    AND sc.m_ctgr_num = mc.m_ctgr_num
    AND pd.pc_num = pc.pc_num
    AND pd.ps_num = ps.ps_num
    AND pd.pi_num = pi.pi_num
ORDER BY pd_num;
    
SELECT * FROM 
    prod_details pd
JOIN
    prods p
ON
    pd.p_num = p.p_num
JOIN
    prod_images pi
ON
    pi.pi_num = pd.pi_num
JOIN
    prod_colors pc
ON
    pc.pc_num = pd.pc_num
JOIN
    sub_ctgr sc
ON
    p.s_ctgr_num = sc.s_ctgr_num
JOIN
    main_ctgr mc
ON 
    sc.m_ctgr_num = mc.m_ctgr_num
WHERE
    m_ctgr_name = '의류' AND s_ctgr_name = '후드티';
    
SELECT * FROM prods p, sub_ctgr sc , main_ctgr mc WHERE p.s_ctgr_num = sc.s_ctgr_num AND sc.m_ctgr_num = mc.m_ctgr_num AND m_ctgr_name = '의류' ORDER BY p_num;


-- members

INSERT INTO members VALUES(mem_num_seq.nextval, 'duhaduha@naver.com', 1234, '뚜비두하', '560204','이두하','010-2006-5975',null,default);
INSERT INTO member_addresses VALUES(mem_num_seq.currval, default,default,default,default);
UPDATE member_addresses SET mem_zipcode = 12345, mem_addr1 = '경기도 구리시', mem_addr2 = '이젠컴퓨터 4층', addr_save = '1' WHERE mem_num = 1;

-- insert faq
-- 카테고리 = 0; 주문/결제
INSERT INTO faqs VALUES(faq_num_seq.nextval, '비회원도 주문이 가능한가요?',
'마플의 제품은 100% 주문 제작으로 만들어지므로,
보다 정확한 의견 반영을 위해 회원의 경우에만 주문하실 수 있도록 하고 있습니다.

회원가입은 무료이며, 마플의 회원이 되시면 각종 이벤트 참여, 포인트 적립 등 다양한 혜택이 제공됩니다.',0);
INSERT INTO faqs VALUES(faq_num_seq.nextval, '주문 제작 과정이 궁금합니다.',
'당신의 디자인이 접수되어 제작, 배송되기까지 마플의 전문가들이 최선을 다하고 있습니다.',0);
INSERT INTO faqs VALUES(faq_num_seq.nextval, '주문 내역을 확인하고 싶어요.',
'주문 접수가 정상적으로 완료되면 이메일과 연락처로 주문 완료 문자가 전송됩니다.
또한 마플 웹사이트 [마이페이지] → [주문내역 / 배송조회] 에서도 주문내역을 확인하실 수 있습니다.',0);
INSERT INTO faqs VALUES(faq_num_seq.nextval, '주문하고 제품을 받기까지 얼마나 걸리나요?',
'상품마다 제작 기간이 다를 수 있는 점 참고 부탁드립니다.

결제 완료 후 영업일 기준(주말 / 공휴일 제외) 3~7일 정도 소요됩니다.
대량 주문 건의 경우 영업일 기준(주말 / 공휴일 제외) 7~10일 정도 소요될 수 있습니다.

택배사로 상품 출고 후 영업일 기준 1~2일 이내 수령 가능합니다.
단, 도서 산간 지역 및 해당 지역의 택배사 물량에 따라 기간이 좀 더 소요될 수 있습니다.',0);
INSERT INTO faqs VALUES(faq_num_seq.nextval, '주문의 진행 상태는 어떻게 알 수 있나요?',
'[마이페이지] → [주문 / 배송조회] 에서 확인 가능합니다.

주문 접수 : 주문은 했으나 미입금(무통장) 상태로 7일 이내 미결제 시 주문이 자동으로 취소됩니다.
제작 준비 중 : 결제가 완료되었으며, 제작을 위한 담당자 배정중입니다.
제작 중 : 제작을 진행합니다. 이 단계부터는 디자인 수정 및 취소 요청이 불가합니다
제작 완료 : 제작 완료한 후, 검수 및 포장을 진행합니다.
출고 완료 : 주문하신 제품이 택배사로 전달된 상태로 운송장 번호는 문자로 발송됩니다.
출고 다음날부터 송장번호 조회를 통한 배송 현황이 확인 가능합니다.

본사 수령 및 퀵 출고 요청 시 출고 완료 상태에서 고객님께 연락 후 수령 가능 상태를 안내드립니다.',0);


-- 카테고리 = 1; 배송
INSERT INTO faqs VALUES(faq_num_seq.nextval, '배송 확인은 어디서 하나요?',
'로그인 후 [마이페이지] → [주문 / 배송 조회] 메뉴를 통해 주문 상태 확인 및 배송 추적이 가능합니다.',1);
INSERT INTO faqs VALUES(faq_num_seq.nextval, '상품 출고 후 배송 기간이 어떻게 되나요?',
'택배사로 상품 출고 후 영업일 기준 1~2일 이내 수령 가능합니다.
단, 도서 산간 지역 및 해당 지역의 택배사 물량에 따라 기간이 좀 더 소요될 수 있습니다.',1);
INSERT INTO faqs VALUES(faq_num_seq.nextval, '어느 택배사로 발송되나요?',
'CJ 택배사를 통해 발송됩니다.
출고 후 고객님께 운송장 번호가 문자로 자동 발송되며, [CJ 택배 홈페이지] 를 통해 운송장 조회가 가능합니다.
https://www.cjlogistics.com/ko/main

대표번호 : 1588-1255',1);
INSERT INTO faqs VALUES(faq_num_seq.nextval, '마플의 배송비는 얼마인가요?',
'마플의 배송비는 주문 건 당 3,000원이며, 도서산간지역은 추가금이 발생합니다.',1);
INSERT INTO faqs VALUES(faq_num_seq.nextval, '묶음 배송이 가능한가요?',
'기존 주문 건이 출고되기 전이라면 가능합니다.
추가 주문 시 주문 요청 사항에 묶음 배송을 남겨주시거나, 1:1 상담 및 카톡 또는 고객 센터(1566-9437)로 문의하시면
확인 후 묶음 배송이 가능합니다.

단, 묶음 배송의 경우 추가 주문 건의 제작 완료 시점에 묶음으로 발송되기 때문에 출고일이 늦어질 수 있음을 유의해주세요.

이미 상품이 출고되었거나, 추가 주문 시 요청사항에 별도로 묶음 배송을 요청하지 않은 경우 묶음 배송이 불가합니다.',1);


-- 카테고리 = 2; 취소/환불
INSERT INTO faqs VALUES(faq_num_seq.nextval, '주문 취소를 하고 싶어요.',
'[제작 준비 중] 상태까지는 주문취소가 가능하지만, 제작이 시작되는 [제작 중] 이후에는 주문 취소가 불가능합니다.

마플 웹사이트의 주문내역 또는 1:1 상담 및 카톡, 고객센터(1566-9437)를 통해 주문 취소가 가능합니다.',2);
INSERT INTO faqs VALUES(faq_num_seq.nextval, '주문의 부분 취소를 하고 싶습니다.',
'주문 완료 후 주문의 일부만 취소하는 것은 불가합니다.',2);
INSERT INTO faqs VALUES(faq_num_seq.nextval, '주문 취소 내역은 어떻게 확인할 수 있나요?',
'로그인 후 [마이페이지] 를 통해 주문 취소 내역을 확인하실 수 있습니다.',2);
INSERT INTO faqs VALUES(faq_num_seq.nextval, '제작 전 취소 시 환불은 얼마나 걸리나요?',
'결제 방법에 따른 환불 처리 기간이 다릅니다.

무통장 입금 : 취소 접수일 기준 익일 내로 환불이 완료됩니다.
카드 결제 및 실시간 계좌이체 : PG 사의 승인이 필요하므로, 취소 접수일 기준으로 주말 /공휴일 제외 3~7일 정도 소요될 수 있습니다.',2);
INSERT INTO faqs VALUES(faq_num_seq.nextval, '입금자명과 다른 명의의 계좌로 환불 받을 수 있나요?',
'다른 명의로의 환불은 어려우며, 주문 시 등록하셨던 입금자명의 계좌로만 환불이 가능합니다.',2);
INSERT INTO faqs VALUES(faq_num_seq.nextval, '환불받을 금액을 마플 포인트로 적립할 수 있나요?',
'네. 가능합니다.

무통장 입금이나 실시간 이체로 결제하신 경우 환불받을 금액을 포인트로 적립할 수 있습니다.
신용카드 결제 후 부분 취소한 경우에도 차액을 현금으로 돌려받는 대신 포인트로 적립할 수 있습니다.
전체 취소 또는 부분 취소의 경우에도 포인트로 적립이 가능합니다.',2);


-- 카테고리 = 3; 반품/교환
INSERT INTO faqs VALUES(faq_num_seq.nextval, '주문 제작한 상품을 교환 / 반품을 할 수 있나요?',
'마플의 주문 제작 상품은 고객 주문에 따라 개별 제작되는 상품으로 재판매가 불가하므로, 변심에 의한 교환 / 반품이 불가능합니다.

상품의 문제가 있는 경우 수령 후 7일 이내에 1:1 상담 및 카톡 또는 고객 센터(1566-9437)로 사유와 함께 접수 신청을 해 주시면 CJ 택배로 반송 예약을 진행합니다.

주문하셨던 상품이 아닌 다른 상품으로의 교환 / 반품은 불가합니다.
동일 상품, 동일 사이즈, 동일한 색상으로 재제작 및 AS만 가능하며, 이때 발생되는 배송비는 마플에서 부담합니다.',3);
INSERT INTO faqs VALUES(faq_num_seq.nextval, '샘플 무지로 주문한 제품은 교환 / 반품을 할 수 있나요?',
'화이트 색상의 무지 상품은 색상 특성상 변심에 의한 교환 / 반품이 불가합니다.

착용 흔적, 세탁 흔적, 냄새, 오염, 임의 수선 흔적 등이 있는 경우 교환 / 반품이 불가합니다.

상품 수령 후 7일 이내에 1:1 상담 및 카톡 또는 고객 센터(1566-9437)로 교환 또는 반품 의사를 접수해주셔야 가능합니다.',3);
INSERT INTO faqs VALUES(faq_num_seq.nextval, '반품 비용은 얼마인가요?',
'무지 상품의 단순 변심 교환 / 반품 시 왕복 배송비 5,000원이 부과됩니다.
(반품 : 초도 배송비 + 반송 배송비 / 교환 : 반송 배송비 + 재배송비)

무료배송의 경우에도 교환 / 반품 시에는 왕복 배송비가 부과됩니다.
상품의 하자, 오배송 등으로 인한 교환 / 반품은 배송비 전액을 마플에서 부담합니다.
CJ 택배가 아닌 타 택배사를 통한 반송의 경우 택배비를 선불로 결제 후 보내주셔야 합니다.
임의로 착불로 보내주신 경우, 정상적으로 접수가 불가하며 반송될 수 있는 점 양해 부탁드립니다.',3);
INSERT INTO faqs VALUES(faq_num_seq.nextval, '반품 주소지는 어떻게 되나요?',
'서울 금천구 가산디지털1로 75-24 아이에스비즈타워 10층 (주)마플코퍼레이션
고객센터: 1566-9437',3);
INSERT INTO faqs VALUES(faq_num_seq.nextval, '청약 철회 안내',
'수신확인의 통지를 받은 날부터 7일 이내에는 청약의 철회를 할 수 있습니다.

[가능한 경우]

무지 상품에 문제가 있는 경우, 판매자의 실수로 인한 교환, 반품이 필요한 경우
(제품이 불량인 경우 동일 상품, 동일 사이즈, 동일한 색상으로 교환 및 환불이 가능합니다.)

[불가능한 경우]

주문 제작 상품의 경우 다른 고객에게 재판매가 불가능하기 때문에 단순 변심으로 인한 청약 철회가 불가능합니다.
무지 상품의 경우 착용 흔적, 세탁 흔적, 냄새, 오염, 임의 수선 흔적 등 상품이 훼손된 경우
(다만, 내용을 확인하기 위하여 포장 등을 훼손한 경우에는 청약철회가 가능합니다.)
시간의 경과에 의하여 재판매가 곤란할 정도로 상품의 가치가 현저히 감소한 경우
청약 철회가 가능한 경우에 해당되어도 마플 고객센터로 교환 / 반품 접수 후 7일 이내에 상품이 도착해야 합니다.
무지 상품의 단순 변심에 의한 교환 / 반품은 고객님께서 택배 요금 전액을 부담해 주셔야 하며, 반품 시에는 CJ 택배를 이용해주셔야 합니다.
타 택배를 이용해서 반송하시는 경우 택배비를 선불로 지불해주셔야 하며 착불로 반송하신 택배는 정상적으로 접수 처리되지 않습니다.

소비자 피해 보상의 처리 및 상품 문의처
마플 고객센터: 1566-9437
A/S 및 소비자 상담실: 0502-707-8888',3);
INSERT INTO faqs VALUES(faq_num_seq.nextval, '품질 보증 기준 안내',
'본 제품은 철저한 품질관리와 공정관리를 거쳐 생산되었으며 외관, 규격, 물성 검사에서 합격한 제품입니다.
본 제품의 수명을 연장시키기 위하여 제품에 부착된 취급 주의사항과 세탁 방법을 필히 확인해주시기 바랍니다.
본 제품의 품질에 이상이 있을 경우 소비자 상담실로 연락 주시기 바랍니다.
본 제품의 품질에 이상이 있을 경우 제품 수령일로부터 7일 이내 반품/환불 가능합니다.',3);


-- 카테고리 = 4; 기타

INSERT INTO faqs VALUES(faq_num_seq.nextval, '회원 가입 시 어떠한 혜택이 있나요?',
'마플의 회원가입은 무료이며,
회원으로 가입하는 경우 마플 포인트, 마플 쿠폰, 메일링 서비스(새로 나온 콘텐츠, 인기 있는 콘텐츠, 새로나온 기본 상품 등 마플의 새로운 소식) 및 이벤트 참여 등 회원님의 기분 좋은 쇼핑을 위한 다양한 서비스를 제공합니다.',4);

INSERT INTO faqs VALUES(faq_num_seq.nextval, '회원 가입에 나이 제한이 있나요?','마플은 개인정보 취급방침에 따라 만 14세 이상 회원 가입이 가능합니다.',4);

INSERT INTO faqs VALUES(faq_num_seq.nextval, '여러 아이디의 정보를 합치고 싶어요.','동일 명의라고 해도 ID(이메일)마다 개별로 인식되어 정보(포인트 및 주문 내역)의 통합은 불가합니다.',4);

INSERT INTO faqs VALUES(faq_num_seq.nextval, '회원 정보를 수정하고 싶어요.','[마이페이지] → [회원정보] → [개인 정보 수정하기] 에서 수정 가능합니다.',4);

INSERT INTO faqs VALUES(faq_num_seq.nextval, '회원 아이디와 비밀번호 변경이 가능한가요?','아이디(이메일)과 비밀번호는 로그인 후 [회원 정보 수정] 을 통해 변경 가능합니다.',4);

-- 카테고리 = 5; 제작문의

INSERT INTO faqs VALUES(faq_num_seq.nextval, '상품 제작 기간이 어떻게 되나요?',
'상품마다 제작 기간이 다를 수 있는 점 참고 부탁드립니다.

평균적으로 결제 완료 후 영업일 기준(주말/공휴일 제외) 3~7일 정도 소요됩니다.
대량 주문 건의 경우 영업일 기준(주말/공휴일 제외) 7~10일 정도 소요될 수 있습니다.',5);

INSERT INTO faqs VALUES(faq_num_seq.nextval, '1장 또는 소량도 제작 가능한가요?',
'마플은 주문 제작(Print-On-Demand) 방식으로 모든 제품이 1장부터 높은 퀄리티로 소량 제작이 가능합니다.',5);

INSERT INTO faqs VALUES(faq_num_seq.nextval, '내가 만든 이미지로 상품 제작이 가능한가요?',
'네. 가능합니다.
직접 제작한 이미지 파일이 있다면 [원하시는 상품 클릭] - [내 이미지 넣기] ? [내 이미지 업로드하기] 에서 JPG, PNG, AI 형식의 파일을 업로드 후 주문 가능하며, 그 외 마플이 무료로 제공하는 [꾸미기 디자인] 을 통해 다양한 이미지로 제작이 가능합니다.',5);

INSERT INTO faqs VALUES(faq_num_seq.nextval, '내 디자인으로 어떤 상품을 만들 수 있나요?',
'앞으로도 고퀄리티의 다양한 상품군이 추가될 예정입니다.
다양한 상품에 고객님의 디자인을 더해 세상에 단 하나뿐인 제품을 만들어 보세요.',5);

INSERT INTO faqs VALUES(faq_num_seq.nextval, '인터넷에 있는 이미지로 제작할 수 있나요?',
'이미지의 저작권자 또는 원작자가 공공으로 쓸 수 있는 이미지라고 명시했거나, 저작권이 만료된 이미지에 한해 사용이 가능합니다.

그 외의 경우 무단 도용으로 간주되어 저작권법 관련 조항에 의거 처벌받을 수 있습니다.',5);


-- 카테고리 = 6; 단체문의
INSERT INTO faqs VALUES(faq_num_seq.nextval, '여러 장을 주문(단체 구매) 할 경우 할인의 기준은 어떻게 되나요?',
'마플은 최소 5장부터 할인이 적용됩니다.

할인적용 기준
동일한 상품(상품의 사이즈나 컬러는 달라도 무관)
동일한 디자인, 동일한 인쇄크기, 동일한 인쇄위치, 동일한 인쇄색상

단체구매 할인율 확인

https://www.marpple.com/kr/group

기타 추가 할인 관련 문의는 1:1 상담및 카톡, 고객센터(1566-9437) 또는 help@marpple.com 을 통해 문의 부탁드립니다.',6);

INSERT INTO faqs VALUES(faq_num_seq.nextval, '단체 구매의 경우 제품을 받기 까지 얼마나 걸리나요?',
'상품마다 제작 기간이 다를 수 있는 점 참고 부탁드립니다.

대량 주문 건의 경우 영업일 기준(주말 / 공휴일 제외) 5~7일 정도 소요될 수 있습니다.

택배사로 상품 출고 후 영업일 기준 1~2일 이내 수령 가능합니다.
단, 도서 산간 지역 및 해당 지역의 택배사 물량에 따라 기간이 좀 더 소요될 수 있습니다.',6);

INSERT INTO faqs VALUES(faq_num_seq.nextval, '단체 구매 시 한 장(한 개)만 먼저 인쇄해 볼 수 있나요?',
'가능합니다.
결제 완료 후, 한 장(한 개)만 선 제작 후 고객님과 컨펌 후 본 상품 진행 가능합니다.

자세한 문의는 1:1 상담 및 카톡, 고객센터(1566-9437) 또는 help@marpple.com를 통해 확인 부탁드립니다.',6);

INSERT INTO faqs VALUES(faq_num_seq.nextval, '단체 주문 시 개별 배송이 가능한가요?',
'가능합니다.

주문 시 개별 배송 선택 후, 주문 주시면 확인 후 별도로 연락드려 안내드리고 있습니다.
단, 개별 배송 시 각 배송지마다 3,000원의 배송비가 부과됩니다.

자세한 문의는 1:1 상담 및 카톡, 고객센터(1566-9437) 또는 help@marpple.com를 통해 확인 부탁드립니다.',6);

INSERT INTO faqs VALUES(faq_num_seq.nextval, '단체 주문 시 개별 포장이 가능한가요?',
'수량 및 견적에 따라 상이 할 수 있습니다.

자세한 문의는 1:1 상담 및 카톡, 고객센터(1566-9437) 또는 help@marpple.com를 통해 확인 부탁드립니다.',6);





SELECT * FROM faqs;
DELETE faqs WHERE faq_ctgr = 3;
