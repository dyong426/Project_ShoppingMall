const memberDetail = document.getElementById('member-detail');

function viewDetail(event) {

    var url = '../member/admin_member_detail.html';
    var name = '회원상세정보';
    var option = 'width = 400, height = 500, top = 100, left = 200, location = no, nofullscreen = no';

    window.open(url, name, 'width = 400, height = 500');
};