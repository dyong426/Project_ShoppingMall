const memberDetail = document.getElementById('member-detail');

function viewDetail(member_num) {

    var url = '../admin/member/detail?mem_num=' + member_num;
    var name = '회원상세정보';
    var option = 'width = 800px, height = 800, top = 200, left = 600, location = no, nofullscreen = no';

    window.open(url, name, option);
};