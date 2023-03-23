const deleteBtn = document.getElementById('delete-button');
const container = document.getElementById('container-top');
const fileInput = document.getElementById('fileInput');

let url = null;

// fileInput의 value를 null로 바꾸지 않으면 같은 이미지를 연속으로 업로드할 때 onchange 인식이 안됨
fileInput.onclick = (e) => {
  e.target.value = null;
}

// 이미지 업로드
fileInput.onchange = (e) => {
  // image 업로드 이벤트
  const fi = e.target.files[0];
  const reader = new FileReader();

  reader.readAsDataURL(fi);

  reader.onload = function () {
    addImage(reader.result);
  };
}


// add 버튼 누르면 새로운 텍스트 생성
const textAddBtn = document.getElementById('textIcon');
textAddBtn.addEventListener('click', (e) => {
  addText();
});



var width = container.clientWidth;
var height = container.clientHeight;

var initWidth = 100;
var initHeight = 40;

var stage = new Konva.Stage({
  container: 'container-top',
  width: width,
  height: 700
});

let currentText = null;
let currentImg = null;
let currentTr = null;

// 텍스트 컬러 선택하면 선택된 텍스트 색상 변경
const textColor = document.getElementById('color');

textColor.onchange = (e) => {
  currentText.fill(e.target.value);
}


// textDecoration 이벤트 추가
const textDecoration = document.getElementsByClassName('textDecoration');
textDecoration[0].onclick = (e) => {
  if (currentText.fontStyle() == 'bold') {
    currentText.fontStyle('normal');
  } else {
    currentText.fontStyle('bold');
  }
}
textDecoration[1].onclick = (e) => {
  if (currentText.fontStyle() == 'italic') {
    currentText.fontStyle('normal');
  } else {
    currentText.fontStyle('italic');
  }
}
textDecoration[2].onclick = (e) => {
  if (currentText.textDecoration() == 'underline') {
    currentText.textDecoration('normal');
  } else {
    currentText.textDecoration('underline');
  }
}
textDecoration[3].onclick = (e) => {
  if (currentText.textDecoration() == 'line-through') {
    currentText.textDecoration('normal');
  } else {
    currentText.textDecoration('line-through');
  }
}



const textAlign = document.getElementById('textAlign').children;
textAlign[0].onclick = (e) => {
  currentText.align('left');
}
textAlign[1].onclick = (e) => {
  currentText.align('center');
}
textAlign[2].onclick = (e) => {
  currentText.align('right');
}


// 버튼 누르면 fontSize 변경
const fontUpBtn = document.getElementById('fontUpBtn');
const fontDownBtn = document.getElementById('fontDownBtn');

fontUpBtn.addEventListener('click', (e) => {
  currentText.fontSize(currentText.fontSize() + 5);
  currentText.width(currentText.width() + 20);
  currentText.height(currentText.height() + 5);
});

fontDownBtn.addEventListener('click', (e) => {
  currentText.fontSize(currentText.fontSize() - 5);
  currentText.width(currentText.width() - 20);
  currentText.height(currentText.height() - 5);
});

const layer = new Konva.Layer();
stage.add(layer);

const editLayer = new Konva.Layer();
stage.add(editLayer);


// overflow hidden 해결 못해서 임시방편으로 경고 표시 띄우기
stage.on('dragend', function (e) {
  if ((e.target.className == 'Text' || e.target.className == 'Image') &&
    (e.target.position().x > (rect.position().x + rect.width())) ||
    ((e.target.position().y + e.target.height()) < rect.position().y) ||
    ((e.target.position().x + e.target.width()) < rect.position().x) ||
    (e.target.position().y > (rect.position().y + rect.height()))) {
    alert('범위 초과');
    e.target.position({
      x: 450,
      y: 250
    });
  }
});


// 배경 사각형 생성 및 추가
const rect = new Konva.Rect({
  x: 300,
  y: 200,
  width: 250,
  height: 300,
  stroke: 'white',
  strokeWidth: 2,
  id: 'backgroundRect'
});
editLayer.add(rect);

stage.on('mousedown', function (e) {
  if (e.target.id() !== 'backgroundRect') {
    rect.hide();
  }
  if ((e.target.className == 'Image' && e.target.id() !== 'backgroundImage') || e.target.className == 'Text') {
    rect.show();
  }
});


const colorName = document.getElementById('colorName');

var background = null;
// 배경 이미지 생성 및 추가/변경
function setBackground() {
  var backgroundImg = new Image();
  backgroundImg.onload = function () {
    background = new Konva.Image({
      x: 100,
      y: 0,
      image: backgroundImg,
      width: 650,
      height: 700,
      id: 'backgroundImage'
    });

    // add the shape to the layer
    layer.add(background);
  };

  if (!url) {
    backgroundImg.src = colorName.dataset.imagepath;
  } else {
    backgroundImg.src = url;
  }
}
setBackground();


let ps_name = null;

window.onload = function () {
  // 색상 선택하면 해당 색상 상품으로 이미지 변경
  const productColors = document.getElementById('productColors');

  const child = productColors.children;

  for (i = 0; i < child.length; ++i) {
    child[i].addEventListener('click', (e) => {

      // 색상 누르면 색상명 변경
      colorName.innerText = e.target.dataset.name;

      url = e.target.dataset.imagepath;

      background.remove();
      setBackground();

      // 색상 누르면 밝기 구분해서 어두우면 rect 흰색으로 밝으면 검은색으로 변경
      var rectColor = getLuma(e.target.id) > 150 ? 'black' : 'white';
      rect.stroke(rectColor);
    });
  }

  // 해당 색이 밝으면 테두리 생성, 어두우면 테두리 없애는 설정
  for (i = 0; i < child.length; ++i) {
    child[i].style.border = getLuma(child[i].id) > 180 ? '1px gray solid' : 'none';
  }

  // DB에서 가져온 상품 정보에 따라 자동으로 생성된 색상에 맟줘 div 배경색 지정
  for (i = 0; i < child.length; ++i) {
    child[i].style.backgroundColor = child[i].id;
  }

  const sizes = document.getElementById('productSizes').children;

  // 사이즈가 한가지면 테두리 없애고 width 조정
  if (sizes.length == 1) {
    sizes[0].classList.remove('sizeHover');
    sizes[0].style.width = '300px';
    sizes[0].style.textAlign = 'left';
    sizes[0].style.border = 'none';
    ps_name = sizes[0].innerText;
  } else {
    // 사이즈 버튼 하나만 눌리도록 설정
    for (i = 0; i < sizes.length; ++i) {
      sizes[i].style.width = '55px';
      sizes[i].addEventListener('click', (e) => {
        for (j = 0; j < sizes.length; ++j) {
          sizes[j].style.color = 'black';
          sizes[j].style.border = '1px gray solid';
        }
        e.target.style.color = 'skyblue';
        e.target.style.border = '1px skyblue solid';

        ps_name = e.target.innerText;
      });
    }
  }

  // 상품 이름이 너무 길면 폰트 사이즈 줄이는 설정
  const productName = document.getElementById('productName');
  const length = productName.innerText.length;

  if (length > 18) {
    productName.style.fontSize = 'large';
  } else if (length > 12) {
    productName.style.fontSize = 'x-large';
  }


  // 가격 천 단위로 끊기
  const productPrice = document.getElementById('productPrice');
  productPrice.innerText = (parseInt(productPrice.innerText)).toLocaleString('ko-KR') + '원';
}


// 색상에 따라 어두운지 밝은지 구분하는 함수
function getLuma(colorCode) {

  const c = colorCode.substring(1);
  const rgb = parseInt(c, 16);
  const r = (rgb >> 16) & 0xff;
  const g = (rgb >> 8) & 0xff;
  const b = (rgb >> 0) & 0xff;

  const luma = 0.2126 * r + 0.7152 * g + 0.0722 * b;

  return luma;
}



// 텍스트, 이미지 추가 생성시 기존 좌표와 겹치지 않게 생성
var x = 400;
var y = 200;

var imgx = 400;
var imgy = 200;

var index = 1;

// 텍스트 생성 함수
function addText() {

  initWidth = 110;
  initHeight = 40;
  var textNode = new Konva.Text({
    text: '텍스트',
    x: x += 10,
    y: y += 10,
    fontSize: 30,
    fill: 'yellow',
    draggable: true,
    width: initWidth,
    height: initHeight,
    align: 'center',
    padding: 5,
  });

  // 텍스트에 마우스 올리면 커서 변경
  textNode.on('mouseenter', function (e) {
    stage.container().style.cursor = 'move';
  });

  // 텍스트에서 마우스 나오면 커서 변경
  textNode.on('mouseleave', function () {
    stage.container().style.cursor = 'default';
  });


  stage.on('mousedown', function (e) {
    if (e.target === textNode && e.evt.button != 2) {
      tr.show();
    }

    if (e.target !== textNode) {
      tr.hide();
    } else {
      currentText = textNode;
      currentImg = null;
      currentTr = tr;
      // 클릭한 텍스트에 따라 글꼴 선택 박스값 변경
      if (fonts.includes(textNode.fontFamily())) {
        fontFamilyComboBox.value = textNode.fontFamily();
        fontFamilyComboBox.style.fontFamily = textNode.fontFamily();
      } else {
        // 아직 글꼴 설정을 안한 텍스트라면 글꼴 선택 박스값 없음
        fontFamilyComboBox.value = '';
      }
    }

    if (e.target.className !== 'Text') {
      hideTextSettingPanel();
    } else {
      if (e.evt.button != 2) {
        showTextSettingPanel();
      }
    }
  });

  editLayer.add(textNode);


  // transformer 생성 및 부착
  var tr = new Konva.Transformer({
    // transformer 부착 객체
    node: textNode,
    keepRatio: true,
    // set minimum width of text
    boundBoxFunc: function (oldBox, newBox) {
      newBox.width = Math.max(30, newBox.width);
      initWidth = newBox.width;
      initHeight = newBox.height;
      return newBox;
    },
  });

  textNode.on('transform', function () {
    // reset scale, so only with is changing by transformer
    textNode.setAttrs({
      width: textNode.width() * textNode.scaleX(),
      scaleX: 1,
    });
  });

  editLayer.add(tr);

  textNode.on('contextmenu', (e) => {
    tr.hide();
  });


  // 드래그 하면 zIndex 위로
  textNode.on('dragstart', function (e) {
    textNode.zIndex(100);
    tr.zIndex(100);
  });

  textNode.on('dragend', function (e) {
    textNode.zIndex(index += 1);
    tr.zIndex(index += 1);
  });


  // 텍스트 더블클릭시 편집
  textNode.on('dblclick dbltap', () => {
    // hide text node and transformer:
    textNode.hide();
    // tr.hide();

    // create textarea over canvas with absolute position
    // first we need to find position for textarea
    // how to find it?

    // at first lets find position of text node relative to the stage:
    var textPosition = textNode.absolutePosition();

    // so position of textarea will be the sum of positions above:
    var areaPosition = {
      x: stage.container().offsetLeft + textPosition.x,
      y: stage.container().offsetTop + textPosition.y,
    };

    // create textarea and style it
    var textarea = document.createElement('textarea');
    document.body.appendChild(textarea);

    // apply many styles to match text on canvas as close as possible
    // remember that text rendering on canvas and on the textarea can be different
    // and sometimes it is hard to make it 100% the same. But we will try...
    textarea.value = textNode.text();
    textarea.style.position = 'absolute';
    textarea.style.top = areaPosition.y + 'px';
    textarea.style.left = areaPosition.x + 'px';
    textarea.style.width = textNode.width() + 'px';
    textarea.style.height = textNode.height() + 'px';
    textarea.style.fontSize = textNode.fontSize() + 'px';
    textarea.style.border = 'none';
    textarea.style.padding = '0px';
    textarea.style.margin = '0px';
    textarea.style.overflow = 'hidden';
    textarea.style.background = 'none';
    textarea.style.outline = 'none';
    textarea.style.resize = 'none';
    textarea.style.lineHeight = textNode.lineHeight();
    textarea.style.fontFamily = textNode.fontFamily();
    textarea.style.transformOrigin = 'left top';
    textarea.style.textAlign = textNode.align();
    textarea.style.color = textNode.fill();
    rotation = textNode.rotation();
    var transform = '';
    if (rotation) {
      transform += 'rotateZ(' + rotation + 'deg)';
    }

    // var px = 0;
    // // also we need to slightly move textarea on firefox
    // // because it jumps a bit
    // var isFirefox =
    //   navigator.userAgent.toLowerCase().indexOf('firefox') > -1;
    // if (isFirefox) {
    //   px += 2 + Math.round(textNode.fontSize() / 20);
    // }
    // transform += 'translateY(-' + px + 'px)';

    // textarea.style.transform = transform;

    // // reset height
    // textarea.style.height = 'auto';
    // // after browsers resized it we can set actual value
    // textarea.style.height = textarea.scrollHeight + 3 + 'px';

    textarea.focus();

    function removeTextarea() {
      textarea.parentNode.removeChild(textarea);
      window.removeEventListener('click', handleOutsideClick);
      textNode.show();
      tr.show();
      tr.forceUpdate();
    }

    function setTextareaWidth(newWidth) {
      if (!newWidth) {
        // set width for placeholder
        newWidth = textNode.placeholder.length * textNode.fontSize();
      }
      // // some extra fixes on different browsers
      // var isSafari = /^((?!chrome|android).)*safari/i.test(
      //   navigator.userAgent
      // );
      // var isFirefox =
      //   navigator.userAgent.toLowerCase().indexOf('firefox') > -1;
      // if (isSafari || isFirefox) {
      //   newWidth = Math.ceil(newWidth);
      // }

      // var isEdge =
      //   document.documentMode || /Edge/.test(navigator.userAgent);
      // if (isEdge) {
      //   newWidth += 1;
      // }
      textarea.style.width = newWidth + 'px';
    }

    textarea.addEventListener('keydown', function (e) {
      // hide on enter
      // but don't hide on shift + enter
      // if (e.keyCode === 13 && !e.shiftKey) {
      //   textNode.text(textarea.value);

      //   // 텍스트 수정 후 텍스트 박스 크기 조정
      //   textNode.width(textarea.clientWidth);
      //   textNode.height(textarea.clientHeight);

      //   removeTextarea();
      // }
      // on esc do not set value back to node
      if (e.keyCode === 27) {
        removeTextarea();
      }
    });

    textarea.addEventListener('keydown', function (e) {
      scale = textNode.getAbsoluteScale().x;
      setTextareaWidth(textNode.width() * scale);
      textarea.style.height = 'auto';
      textarea.style.height =
        textarea.scrollHeight + textNode.fontSize() + 'px';
    });

    function handleOutsideClick(e) {
      if (e.target !== textarea) {
        textNode.text(textarea.value);

        // 텍스트 수정 후 텍스트 박스 크기 조정
        textNode.width(textarea.clientWidth);
        textNode.height(textarea.clientHeight);

        removeTextarea();
      }
    }

    setTimeout(() => {
      window.addEventListener('click', handleOutsideClick);
    });
  });
}

// 이미지 생성 함수
function addImage(url) {
  Konva.Image.fromURL(
    url,
    (img) => {
      img.setAttrs({
        width: 100,
        height: 100,
        x: imgx += 10,
        y: imgy += 10,
        name: 'image',
        draggable: true,
      });
      editLayer.add(img);

      const tr = new Konva.Transformer({
        nodes: [img],
        keepRatio: true,
        centeredScaling: true,
        boundBoxFunc: function (oldBox, newBox) {
          newBox.width = Math.max(30, newBox.width);
          initWidth = newBox.width;
          initHeight = newBox.height;
          return newBox;
        },
      });
      editLayer.add(tr);

      // 드래그 하면 zIndex 위로
      img.on('dragstart', function (e) {
        img.zIndex(100);
        tr.zIndex(100);
      });

      img.on('dragend', function (e) {
        img.zIndex(index += 1);
        tr.zIndex(index += 1);
      });


      img.on('transform', function () {
        // reset scale, so only with is changing by transformer
        img.setAttrs({
          width: img.width() * img.scaleX(),
          scaleX: 1,
        });
      });

      // 이미지에 마우스 올라가면 커서 변경
      img.on('mouseenter', function (e) {
        stage.container().style.cursor = 'move';
      });

      // 이미지에서 마우스 나가면 커서 변경
      img.on('mouseleave', function (e) {
        stage.container().style.cursor = 'default';
      });

      // 이미지 우클릭시 transformer hide (transformer가 이미지 생성 코드 내부에 위치해서 삭제시 transformer를 삭제할 수가 없기 때문에)
      img.on('contextmenu', (e) => {
        tr.hide();
      });

      stage.on('mousedown', function (e) {
        // 우클릭이 아니고 이미지를 클릭하면 transformer show
        if (e.target === img && e.evt.button != 2) {
          tr.show();
        }

        // 다른 곳에서 마우스 클릭하면 transformer hide
        if (e.target !== img) {
          tr.hide();
        } else {
          currentImg = img;
          currentText = null;
          currentTr = tr;
        }
      });
    }
  );
}

const textSettingPanel = document.getElementById('textSettingPanel');
const mainSettingPanel = document.getElementById('mainSettingPanel');

function showTextSettingPanel() {
  textSettingPanel.style.display = 'initial';
  mainSettingPanel.style.display = 'none';
}

function hideTextSettingPanel() {
  textSettingPanel.style.display = 'none';
  mainSettingPanel.style.display = 'initial';
}



// setup menu
let currentShape;
var menuNode = document.getElementById('menu');

deleteBtn.addEventListener('click', () => {
  currentShape.destroy();
  hideTextSettingPanel();
});

window.addEventListener('click', () => {
  // hide menu
  menuNode.style.display = 'none';
});


// 우클릭시 삭제 버튼 생성
stage.on('contextmenu', function (e) {
  // prevent default behavior
  e.evt.preventDefault();
  if (e.target === stage) {
    // if we are on empty place of the stage we will do nothing
    return;
  } else if (e.target.id() == 'backgroundImage' || e.target.id() == 'backgroundRect') {
    return;
  }
  currentShape = e.target;
  // container(canvas가 들어있는 div)의 절대 좌표 Y값
  const absoluteTop = window.pageYOffset + container.getBoundingClientRect().top;
  const absoluteLeft = window.pageXOffset + container.getBoundingClientRect().left;

  // show menu
  menuNode.style.display = 'initial';
  menuNode.style.left = currentShape.getPosition().x + (currentShape.getWidth() / 2) + absoluteLeft + 'px';
  menuNode.style.top = currentShape.getPosition().y + (currentShape.getHeight() / 2) + absoluteTop + 'px';
});


// delete 버튼 누르면 삭제
window.addEventListener('keydown', (e) => {
  if (e.keyCode === 46) {
    if (currentText != null) {
      currentText.destroy();
    } else if (currentImg != null) {
      currentImg.destroy();
    }

    if (currentText != null || currentImg != null) {
      currentTr.hide();
      stage.container().style.cursor = 'default';
      hideTextSettingPanel();
    }

    if (menuNode.style.display != 'none') {
      menuNode.style.display = 'none';
    }
  }
});



const fontFamilyComboBox = document.getElementById('fontFamilyComboBox');

const fonts = ['고딕체', '굴림체', '맑은 고딕', '한컴 말랑말랑 Regular', '휴먼 매직체', '휴먼옛체', '휴먼엑스포', '휴먼편지체', 'HY견고딕'];

for (i = 0; i < fonts.length; ++i) {
  fontFamilyComboBox.innerHTML += `<option value="${fonts[i]}">${fonts[i]}</option>`;
}

fontFamilyComboBox.onchange = (e) => {
  fontFamilyComboBox.style.fontFamily = e.target.value;
  currentText.fontFamily(e.target.value, 'sans-serif');
}

for (i = 0; i < fontFamilyComboBox.length; ++i) {
  fontFamilyComboBox.options[i].style.fontFamily = `${fontFamilyComboBox.options[i].value}`;
}



// sampleIconPopUp 설정
const sampleIconBtn = document.getElementById('sampleIcon');
const closeBtn = document.getElementById('sampleIconPopUpCloseBtn');
const hidden = document.getElementById('sampleIconPopUpBackground');
const body = document.getElementsByTagName('body')[0];


sampleIconBtn.addEventListener('click', (e) => {
  hidden.style.display = 'initial';
  body.classList.add('scrollLock');
});

closeBtn.addEventListener('click', (e) => {
  hidden.style.display = 'none';
  body.classList.remove('scrollLock');
});


const sampleIcons = document.getElementById('sampleIcons');

// DB에서 가져온 샘플 아이콘 수만큼 for문 돌려야함
for (i = 1; i < 33; ++i) {
  // 경로 지정되면 변경
  // 관리자 페이지에서 아이콘은 png로 등록
  sampleIcons.innerHTML += `<img class="sampleIconList" id="sampleIcon${i}" src="/assets/common/cstm_img/sampleIcons/${i}.png" />`;
}

const sampleIconList = document.getElementsByClassName('sampleIconList');

for (i = 0; i < sampleIconList.length; ++i) {
  sampleIconList[i].addEventListener('click', (e) => {
    addImage(e.target.src);
    hidden.style.display = 'none';
    body.classList.remove('scrollLock');
  });
}


// 커스텀 이미지 저장 기능 (이미지를 service로 넘겨서 파일 output)

// 구매, 장바구니 버튼 누르면 이미지 저장 후 이동
const buttons = document.getElementsByClassName('buttons');
const orderForm = document.getElementById('orderForm');
const cartPopUp = document.getElementById('cartPopUp');
const cart_num = document.getElementById('cart_num');

let fileName = null;

for (i = 0; i < buttons.length; ++i) {
  buttons[i].addEventListener('click', (e) => {
    // 세션에 member가 없으면 페이지 이동하지 않고 로그인 화면 띄우기
    if (!mem_num) {
      e.preventDefault();
      loginBtn.click();
    } else if (ps_name != null) {
      // 로그인 되어 있고 사이즈를 선택했으면 버튼 상관없이 이미지 저장
      var cstm_img = stage.toDataURL().split(',')[1];
      fileName = 'cstm_img_' + mem_num + '_' + new Date().getMilliseconds() + '.png';

      const xhttp = new XMLHttpRequest();

      xhttp.open('POST', '/saveImage');
      xhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

      xhttp.send(`img=${cstm_img}&fileName=${fileName}`);

      // 사이즈 선택하고 버튼 클릭시
      cartPopUp.style.border = '1px rgba(128, 128, 128, 0.5) solid';
      cartPopUp.children[0].style.color = 'black';
      cartPopUp.children[0].innerText = '상품을 장바구니에 담았습니다.';

      
      // if (e.target.id == 'directPurchase') {
        // 로그인 상태에서 사이즈 선택후 바로구매 버튼 클릭 이벤트
        // const pcInput = document.getElementById('pc_name');
        // const psInput = document.getElementById('ps_name');
        // const cstmInput = document.getElementById('mem_cstm_path');

        // pcInput.value = colorName.innerText;
        // psInput.value = ps_name;
        // cstmInput.value = fileName;

        // const xhttp = new XMLHttpRequest();

        // xhttp.open();

      //   orderForm.onsubmit();
      // }
    } else {
      // 로그인 되어 있지만 사이즈를 선택하지 않으면
      e.preventDefault();
      cartPopUp.style.border = '1px rgba(255, 0, 0, 0.5) solid';
      cartPopUp.children[0].style.color = 'red';
      cartPopUp.children[0].innerText = '사이즈를 선택해주세요.';
    }

    if (!(e.target.id == 'directPurchase' && cartPopUp.children[0].style.color == 'black')) {
      cartPopUp.style.opacity = 1;
      setTimeout(() => {
        cartPopUp.style.opacity = 0;
      }, 1500);
    }
  });
}


const quantity = document.getElementById('quantity');

// 수량 변경 관리
document.querySelector('.plus').addEventListener('click', (e) => {
  if (parseInt(quantity.innerText) < 99) {
    quantity.innerText =  parseInt(quantity.innerText) + 1;
  }
});

document.querySelector('.minus').addEventListener('click', (e) => {
  if (parseInt(quantity.innerText) > 1) {
    quantity.innerText =  parseInt(quantity.innerText) - 1;
  }
});


// 바로구매 버튼
buttons[0].addEventListener('click', (e) => {
  let quantityNum = parseInt(quantity.innerText);
  e.preventDefault();
  // cstm, cart insert
  const xhttp = new XMLHttpRequest();

  xhttp.open('POST', '/insertCstm');
  xhttp.setRequestHeader('Content-Type', 'application/json');

  const jsonObj = {
    mem_num : mem_num,
    mem_cstm_path : `${fileName}`
  };

  xhttp.send(JSON.stringify(jsonObj));

  xhttp.addEventListener('readystatechange', () => {
    if (xhttp.status == 200 && xhttp.readyState == 4) {
      const xhttp2 = new XMLHttpRequest();

      xhttp2.open('POST', '/insertCart');
      xhttp2.setRequestHeader('Content-Type', 'application/json');

      const jsonObj2 = {
        p_num : p_num,
        p_price : p_price,
        pc_name : colorName.innerText,
        ps_name : ps_name,
        p_name : p_name,
        cart_quantity : quantityNum
      };

      xhttp2.send(JSON.stringify(jsonObj2));

      xhttp2.addEventListener('readystatechange', () => {
        if (xhttp2.status == 200 && xhttp2.readyState == 4) {
          cart_num.value = xhttp2.responseText;
          orderForm.submit();
        }
      });
    }
  });
});


// 장바구니 담기 버튼
buttons[1].addEventListener('click', () => {
  let quantityNum = parseInt(quantity.innerText);
  // cstm, cart insert
  const xhttp = new XMLHttpRequest();

  xhttp.open('POST', '/insertCstm');
  xhttp.setRequestHeader('Content-Type', 'application/json');

  const jsonObj = {
    mem_num : mem_num,
    mem_cstm_path : `${fileName}`
  };

  xhttp.send(JSON.stringify(jsonObj));

  xhttp.addEventListener('readystatechange', () => {
    if (xhttp.status == 200 && xhttp.readyState == 4) {
      const xhttp2 = new XMLHttpRequest();

      xhttp2.open('POST', '/insertCart');
      xhttp2.setRequestHeader('Content-Type', 'application/json');

      const jsonObj2 = {
        p_num : p_num,
        p_price : p_price,
        pc_name : colorName.innerText,
        ps_name : ps_name,
        p_name : p_name,
        cart_quantity : quantityNum
      };

      xhttp2.send(JSON.stringify(jsonObj2));
    }
  });
});


// 커스텀 하거나 장바구니, 바로구매 버튼 눌렀을 때 비로그인 상태면 로그인 팝업 띄우기
const loginCheck = document.getElementsByClassName('loginCheck');

for (i = 0; i < loginCheck.length; ++i) {
  loginCheck[i].addEventListener('click', (e) => {
    if (!mem_num) {
      loginBtn.click();
    }
  });
}
