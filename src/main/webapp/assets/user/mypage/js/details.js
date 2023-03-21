/* 정수정, 주문 상세내역 */

const cancleOrder = document.querySelector('.order_cancellation');

cancleOrder.addEventListener('click', function () {

    const cancleConfirm = confirm('주문을 취소하시겠습니까?');

    if (cancleConfirm) {

        $.ajax({

            url: '/jhc/order/cancel',
            type: 'POST',
            data: {
                ord_num: ord_num
            },
            success: function (response) {
                console.log('오더번호: ',ord_num);
                alert('주문이 취소되었습니다.');
                location.replace('/jhc/history')
            },
            error: function (xhr, status, error) {
                console.error(error)
            }



        })
    } else{
        location.reload();
    }


});