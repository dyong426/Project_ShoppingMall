-- product tables

-- 메인 카테고리 테이블
CREATE TABLE main_ctgr (
    m_ctgr_num NUMBER(2) CONSTRAINT m_ctgr_pk PRIMARY KEY,
    m_ctgr_name VARCHAR2(100),
    m_ctgr_icon_path VARCHAR2(500)
);

-- 서브 카테고리 테이블
CREATE TABLE sub_ctgr (
    s_ctgr_num NUMBER(2) CONSTRAINT s_ctgr_pk PRIMARY KEY,
    s_ctgr_name VARCHAR2(100),
    m_ctgr_num NUMBER(2) CONSTRAINT sc_m_ctgr_fk REFERENCES main_ctgr(m_ctgr_num)
);

select * from main_ctgr;
select * from sub_ctgr;
alter table main_ctgr add m_ctgr_icon_path VARCHAR2(500);
alter table sub_ctgr drop column s_ctgr_icon_path;
select prods.* from prods;
select * from prods inner join (select * from main_ctgr inner join sub_ctgr using(m_ctgr_num)) using(s_ctgr_num) where m_ctgr_num =1;



-- 제품 테이블
CREATE TABLE prods(
    p_num NUMBER(10) CONSTRAINT p_num_pk PRIMARY KEY, -- 제품번호
    p_name VARCHAR2(255),                             -- 제품 명
    p_price NUMBER(10),                               -- 가격
    p_material VARCHAR2(255),                         -- 소재
    p_info_img_path VARCHAR2(255),                    -- 상세설명 이미지
    s_ctgr_num NUMBER(2) CONSTRAINT p_sc_fk REFERENCES sub_ctgr(s_ctgr_num)
);


-- 제품 색상 테이블
CREATE TABLE prod_colors (
    pc_num NUMBER(10) CONSTRAINT pc_num_pk PRIMARY KEY,
    pc_name VARCHAR2(255),
    pc_code VARCHAR2(255),
    p_num NUMBER(10) CONSTRAINT pc_p_num REFERENCES prods(p_num)
);

-- 제품 사이즈 테이블
CREATE TABLE prod_sizes (
    ps_num NUMBER(5) CONSTRAINT ps_num_pk PRIMARY KEY,
    ps_name VARCHAR2(255),
    p_num NUMBER(10) CONSTRAINT ps_p_num REFERENCES prods(p_num)
);

-- 제품 사이즈 정보 목록 테이블
CREATE TABLE prod_size_info(
    psi_num NUMBER(10) CONSTRAINT psi_num_pk PRIMARY KEY,
    psi_list_name VARCHAR2(255),
    p_num NUMBER(10) CONSTRAINT psi_p_num_fk REFERENCES prods(p_num)
);

-- 제품 이미지 테이블
CREATE TABLE prod_images (
    pi_num NUMBER(10) CONSTRAINT pi_num_pk PRIMARY KEY,
    pi_main_path VARCHAR2(2000),
    pi_thumb_path VARCHAR2(2000),
    p_num NUMBER(10) CONSTRAINT pi_p_num REFERENCES prods(p_num)
);

-- 제품 상세 테이블
CREATE TABLE prod_details (
    pd_num NUMBER(10) CONSTRAINT pd_num_pk PRIMARY KEY,
    p_num NUMBER(10) CONSTRAINT pd_p_num_fk REFERENCES prods(p_num),
    pc_num NUMBER(10) CONSTRAINT pd_pc_num_fk REFERENCES prod_colors(pc_num),
    ps_num NUMBER(5) CONSTRAINT pd_ps_num_fk REFERENCES prod_sizes(ps_num), 
    pi_num NUMBER(10) CONSTRAINT pd_pi_num_fk REFERENCES prod_images(pi_num),
    pd_stock NUMBER(10)
);

-- 제품 사이즈 정보 상세
CREATE TABLE prod_size_info_details(
    psid_num NUMBER(10) CONSTRAINT psid_num_pk PRIMARY KEY,
    psi_num NUMBER(10) CONSTRAINT psid_psi_num_fk REFERENCES prod_size_info(psi_num),
    ps_num NUMBER(10) CONSTRAINT psid_ps_num_fk REFERENCES prod_sizes(ps_num),
    p_num NUMBER(10) CONSTRAINT psid_p_num_fk REFERENCES prods(p_num),
    psid_list_item VARCHAR(50)
);

-- 제품 상세 번호 시퀀스
CREATE SEQUENCE pd_seq
    INCREMENT BY 1;
-- 제품 번호 시퀀스
CREATE SEQUENCE p_seq
    INCREMENT BY 1;
-- 제품 색상 번호 시퀀스
CREATE SEQUENCE pc_seq
    INCREMENT BY 1;
-- 제품 사이즈 번호 시퀀스
CREATE SEQUENCE ps_seq
    INCREMENT BY 1;
-- 제품 이미지 시퀀스
CREATE SEQUENCE pi_seq
    INCREMENT BY 1;
-- 제품 사이즈 정보 상세 시퀀스
CREATE SEQUENCE psid_seq
    INCREMENT BY 1;
-- 제품 사이즈 정보 목록
CREATE SEQUENCE psi_seq
    INCREMENT BY 1;
    

-- 회원 테이블

CREATE TABLE members (
    mem_num NUMBER(10) CONSTRAINT m_m_num_pk PRIMARY KEY,
    mem_email VARCHAR2(50),
    mem_pw  VARCHAR2(30),
    mem_nick VARCHAR2(30),
    mem_birth VARCHAR2(6),
    mem_name  VARCHAR2(30),
    mem_phone  VARCHAR2(13),
    mem_note VARCHAR2(1000),
    mem_regdate DATE default sysdate
);

-- 회원 주소 테이블
CREATE TABLE member_addresses (
    mem_num NUMBER(10) CONSTRAINT m_adr_m_num_pk PRIMARY KEY,
    mem_zipcode NUMBER(5),
    mem_addr1 VARCHAR2(2000),
    mem_addr2 VARCHAR2(2000),
    addr_save CHAR(1) default 0
);

-- 회원번호 시퀀스
CREATE SEQUENCE mem_num_seq
    INCREMENT BY 1;

-- 결제 방식 테이블
CREATE TABLE payments (
    payment_num NUMBER(2) CONSTRAINT pay_pay_num_pk PRIMARY KEY,
    payment_name VARCHAR2(30)
);

-- 결제방식 번호 시퀀스
CREATE SEQUENCE payment_num_seq
    INCREMENT BY 1;

-- 회원 커스터마이징 테이블
CREATE TABLE member_cstms (
    mem_cstm_num NUMBER(10) CONSTRAINT mc_mc_num_pk PRIMARY KEY,
    mem_num NUMBER(10) CONSTRAINT mc_m_num_fk REFERENCES members(mem_num),
    mem_cstm_path VARCHAR2(2000)
);

-- 회원 커스터마이징 번호 시퀀스
CREATE SEQUENCE mem_cstm_num_seq
    INCREMENT BY 1;

-- 주문 테이블
CREATE TABLE orders (
    ord_num NUMBER(10) CONSTRAINT o_o_num_pk PRIMARY KEY,
    mem_num NUMBER(10) CONSTRAINT o_m_num_fk REFERENCES members(mem_num),
    ord_date DATE default sysdate,
    ord_zipcode NUMBER(5),
    ord_addr1 VARCHAR2(2000),
    ord_addr2 VARCHAR2(2000),
    receiver_name  VARCHAR2(30),
    receiver_phone VARCHAR2(13),
    total_amount NUMBER(10),
    ord_status VARCHAR2(30) default '결제대기중',
    ord_request VARCHAR2(2000),
    payment_num NUMBER(2) CONSTRAINT o_payment_num_fk REFERENCES payments(payment_num)
);

-- 주문번호 시퀀스
CREATE SEQUENCE ord_num_seq
    INCREMENT BY 1;


-- 주문 상세 테이블
CREATE TABLE order_details (
    od_num NUMBER(10) CONSTRAINT od_od_num_pk PRIMARY KEY,
    ord_num NUMBER(10) CONSTRAINT od_ord_num_fk REFERENCES orders(ord_num),
    pd_num NUMBER(10) CONSTRAINT od_pd_num_fk REFERENCES prod_details(pd_num),
    mem_cstm_num NUMBER(10) CONSTRAINT od_mem_cstm_num_fk REFERENCES member_cstms(mem_cstm_num),
    od_quantity NUMBER(10),
    od_amount NUMBER(10)
);
-- 주문 상세 번호 시퀀스
CREATE SEQUENCE od_num_seq
    INCREMENT BY 1;

-- 장바구니 테이블
CREATE TABLE carts (
    cart_num NUMBER(10) CONSTRAINT cart_cart_num_pk PRIMARY KEY,
    mem_num NUMBER(10) CONSTRAINT cart_mem_num_fk REFERENCES members(mem_num),
    pd_num NUMBER(10) CONSTRAINT cart_pd_num_fk REFERENCES prod_details(pd_num),
    mem_cstm_num NUMBER(10) CONSTRAINT cart_m_cstm_num_fk REFERENCES member_cstms(mem_cstm_num),
    cart_quantity NUMBER(10),
    cart_amount NUMBER(10)
);

-- 장바구니 번호 시퀀스
CREATE SEQUENCE cart_num_seq
    INCREMENT BY 1;


-- 자주하는 질문 테이블
CREATE TABLE faqs (
    faq_num NUMBER(10) CONSTRAINT faq_num_pk PRIMARY KEY,
    faq_title VARCHAR2(500),
    faq_content VARCHAR2(3000),
    faq_ctgr NUMBER(1)
);

-- 질문 번호 시퀀스
CREATE SEQUENCE faq_num_seq
    INCREMENT BY 1;
    
-- 문의 게시판 테이블
CREATE TABLE contact(
    contact_num NUMBER(10) CONSTRAINT cont_cont_num_pk PRIMARY KEY,
    mem_num NUMBER(10) CONSTRAINT cont_mem_num_fk REFERENCES members(mem_num),
    contact_ctgr NUMBER(1),
    contact_title VARCHAR2(500),
    contact_content VARCHAR2(3000),
    contact_image_path VARCHAR2(500),
    contact_regdate DATE,
    admin_reply VARCHAR2(3000)
);

CREATE SEQUENCE contact_num_seq
    INCREMENT BY 1;


-- 리뷰 테이블
CREATE TABLE reviews (
    review_num NUMBER(10) CONSTRAINT rev_num_pk PRIMARY KEY,
    p_num NUMBER(10) CONSTRAINT rev_p_num_fk REFERENCES prods,
    mem_num NUMBER(10) CONSTRAINT rev_m_num_fk REFERENCES members(mem_num),
    review_content VARCHAR2(2000),
    review_image_path VARCHAR2(500),
    review_star NUMBER(1),
    review_regdate DATE
);

CREATE SEQUENCE review_num_seq    INCREMENT BY 1;



DROP TABLE faqs;
DROP TABLE member_addresses;
DROP TABLE members;
DROP TABLE prod_colors;
DROP TABLE prod_details;
DROP TABLE prod_sizes;
DROP TABLE prods;    
DROP TABLE prod_images;