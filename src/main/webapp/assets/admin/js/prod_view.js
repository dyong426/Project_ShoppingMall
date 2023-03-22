function prodViewDetail(e, pNum) {
	
    var p_num = pNum;
    console.log(p_num);
    var url = '/jhc/admin/prod/view/detail?p_num='+p_num;
    var name = '제품 상세 보기';
    var option = 'width = 800, height = 1000, top = 100, left = 200, location = no, nofullscreen = no';

    window.open(url, name, option);
};


var colorNum = 1;
var sizeNum = 1;

var colorTable_view = document.getElementById('prod-view-color-table-body');
var sizeTable_view = document.getElementById('prod-view-size-table-body');

function addColor_view(evt) {
    var tableRow = colorTable_view.rows;
    const newColor = colorTable_view.insertRow();
    newColor.id = `prodColors[${tableRow.length-1}]`;

    const newColorName = newColor.insertCell(0);
    const newColorCode = newColor.insertCell(1);
    const newColorPath = newColor.insertCell(2);
    const newColorBtn = newColor.insertCell(3);

    newColorName.innerHTML += `<input type="text" class="form-control" name="prodColors[${tableRow.length-1}].pc_name"/>`
    newColorCode.innerHTML += `<input type="color" class="form-control" name="prodColors[${tableRow.length-1}].pc_code">`;
    newColorPath.innerHTML += `<input type="file" class="form-control" name="prodColors[${tableRow.length-1}].pc_img_filename" onchange="inputColorImg(this)">`;
    newColorBtn.innerHTML += `<button type="button" class="btn btn-plus fa-solid fa-circle-plus btn-primary" onclick="addColorBtn_view(event)"></button>
    <button type="button" class="btn btn-minus fa-solid fa-circle-minus btn-danger" style='display: none;' onclick="removeColorBtn_view(event)"></button>`;

    colorNum++;
};

function plusToMinus_view(evt) {
    const evtPe = evt.target.parentElement;

    evt.target.style.display = 'none';

    evtPe.children[1].style.display = 'block';
}

function addColorBtn_view(evt) {    
    plusToMinus_view(evt);
    addColor_view(evt);
}

function removeColorBtn_view(evt) {

    var removeTarget = evt.target.parentElement.parentElement;
    console.log(removeTarget);
    var row = document.getElementById(removeTarget.id);

    colorTable_view.deleteRow((row.rowIndex - 1));
}

//사이즈 추가/제거 버튼
function addSize_view(evt) {
	console.log(sizeTable_view);
    const newSize = sizeTable_view.insertRow();
    var tableRow = sizeTable_view.rows;

    newSize.id = `prodSize[${tableRow.length-1}]`;

    const newSizeName = newSize.insertCell(0);
    const newSizeBtn = newSize.insertCell(1);

    newSizeName.innerHTML += `<input type="text" class="form-control" name="prodSize[${tableRow.length-1}].ps_name">`;
    newSizeBtn.innerHTML += `<button type="button" class="btn btn-plus fa-solid fa-circle-plus btn-primary" onclick="addSizeBtn_view(event)"></button>
    <button type="button" class="btn btn-minus fa-solid fa-circle-minus btn-danger" style='display: none;' onclick="removeSizeBtn_view(event)"></button>`;
    
    sizeNum++;
};


function addSizeBtn_view(evt) {    
    plusToMinus(evt);
    addSize_view(evt);
}

function removeSizeBtn_view(evt) {

    var removeTarget = evt.target.parentElement.parentElement;
    console.log(removeTarget);
    var row = document.getElementById(removeTarget.id);

    sizeTable_view.deleteRow((row.rowIndex - 1));
}