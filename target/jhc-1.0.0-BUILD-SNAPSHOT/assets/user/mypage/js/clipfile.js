/* 첨부파일 추가 */
//초기화된 값을 배열에 추가
var fileTR = document.getElementsByClassName('fileTR')[0];
var list_clones = [];
for(let i=0; i<10; i++){
    var clone_fileTR = fileTR.cloneNode(true);
    list_clones.push(clone_fileTR);
}//for

var fileNums = 0;

function add_fileTR(){
    if(fileNums >= 10){
        alert('첨부파일은 10개 까지만 추가 됩니다.');
        return false;
    }else{
        let table_write = document.getElementsByClassName('table_write')[0];
        table_write.getElementsByTagName('TBODY')[0].appendChild(list_clones[fileNums]);
        fileNums++;
    }
}//add_fileTR



/* ★ upload-name 에 파일명을 불러옵니다 */ /* https://webdir.tistory.com/435 */
function uploadName(e){
    var files = e.files;
    var filename = files[0].name;  //console.log(filename);
    // 추출한 파일명 삽입 
    var upload_name = e.parentNode.previousElementSibling;
    upload_name.value = filename;
}//uploadName


/* 첨부파일 삭제 */
function delFile(e){
    var this_fileTR = e.parentNode.parentNode.parentNode;
    if(fileNums < 1){
        return false;
    }else{
        this_fileTR.parentNode.removeChild(this_fileTR);
        fileNums--;
    }//if,else
}//delFile




