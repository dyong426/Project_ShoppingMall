function orderViewDetail(e, ordNum) {
	
    var ord_num = ordNum;
    console.log(ord_num);
    var url = '/jhc/admin/order/detail?ord_num='+ord_num;
    var name = '주문 상세 보기';
    var option = 'width = 800, height = 1000, top = 100, left = 200, location = no, nofullscreen = no';

    window.open(url, name, option);
};