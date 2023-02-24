const sameBtn = document.getElementById('sameWithOrderer');

const recipient = document.getElementById('recipient').children[1];
const recipientPhone = document.getElementById('recipientPhone').children[1];

const ordererName = document.getElementById('ordererName');
const ordererPhone = document.getElementById('ordererPhone');

sameBtn.onchange = (e) => {
    console.log('체크');
    if (ordererName.value != null && ordererPhone.value != null) {
        recipient.value = ordererName.value;
        recipientPhone.value = ordererPhone.value;
    }
}