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

const colorTable_view = document.getElementById('prod_view_color_table_body');
const sizeTable_view = document.getElementById('prod-size-table-body');

function addColor_view(evt) {
    const newColor = colorTable_view.insertRow();

    newColor.id = `color${colorNum}`;

    const newColorName = newColor.insertCell(0);
    const newColorCode = newColor.insertCell(1);
    const newColorPath = newColor.insertCell(2);
    const newColorBtn = newColor.insertCell(3);

    newColorName.innerHTML += `<input type="text" class="form-control" name="prodColors[${indexStatus.index + colorNum}].pc_name"></input>`
    newColorCode.innerHTML += `<input type="color" class="form-control" name="prodColors[${indexStatus.index + colorNum}].pc_code">`;
    newColorPath.innerHTML += `<input type="file" class="form-control" name="prodColors[${indexStatus.index + colorNum}].pc_img_path">`;
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

    colorTable.deleteRow((row.rowIndex - 1));
}

//사이즈 추가/제거 버튼
function addSize(evt) {
    
    ++sizeNum;

    const newSize = sizeTable_view.insertRow();

    newSize.id = `size${sizeNum}`;

    const newSizeName = newSize.insertCell(0);
    const newSizeBtn = newSize.insertCell(1);

    newSizeName.innerHTML += `<input type="text" class="form-control" id="size-name${sizeNum}">`;
    newSizeBtn.innerHTML += `<button type="button" class="btn btn-plus fa-solid fa-circle-plus btn-primary" onclick="addSizeBtn(event)"></button>
    <button type="button" class="btn btn-minus fa-solid fa-circle-minus btn-danger" style='display: none;' onclick="removeSizeBtn(event)"></button>`;
};


function addSizeBtn(evt) {    
    plusToMinus(evt);
    addSize(evt);
}

function removeSizeBtn(evt) {

    var removeTarget = evt.target.parentElement.parentElement;
    console.log(removeTarget);
    var row = document.getElementById(removeTarget.id);

    sizeTable.deleteRow((row.rowIndex - 1));
}