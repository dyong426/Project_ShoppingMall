SELECT s_ctgr_name, s_ctgr_num FROM sub_ctgr WHERE m_ctgr_num = 1;

select * from prods inner join (select * from main_ctgr inner join sub_ctgr using(m_ctgr_num)) using(s_ctgr_num) where s_ctgr_num = 1;

select m_ctgr_num from sub_ctgr where s_ctgr_num =1;

select m_ctgr_name from (select * from main_ctgr inner join sub_ctgr using (m_ctgr_num)) where s_ctgr_num =1;

SELECT s_ctgr_name, s_ctgr_num FROM sub_ctgr WHERE m_ctgr_num = 1;

SELECT * from sub_ctgr where m_ctgr_num = (select m_ctgr_num from sub_ctgr where s_ctgr_num = 1);

select m_ctgr_num from sub_ctgr where s_ctgr_num = 5;

select * from (select * from sub_ctgr where s_ctgr_num = 1), sub_ctgr ;

select m_ctgr_num from sub_ctgr where s_ctgr_num = 3;



alter table main_ctgr add m_ctgr_icon_path VARCHAR2(500);
alter table sub_ctgr drop column s_ctgr_icon_path;
update main_ctgr set m_ctgr_icon_path ='assets\common\images\prod_img\admin.png';










