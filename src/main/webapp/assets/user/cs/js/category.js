$(function() {

  var group = $(".group");

  group.each(function() {
    var _group = new GroupBox(this);
  });

  // 사용자 정의 생성자 함수 정의
  function GroupBox(groupElement) {

    var box = $(groupElement).find(".box");
    var title = $(groupElement).find(".box .title a");

    box.each(function(idx) {
      var newBox = new RootBox(this);
      if (idx > 0) {
        newBox.siblingsClose();
      }
    });
  }

  // 사용자 정의 생성자 함수 정의
  function RootBox(boxElement) {
    var _this = this;
    var boxEl = $(boxElement);
    var target = $(boxEl).find(".title a");
    var cont = $(boxEl).find(".cont");

    // _groupParent = $(boxEl).parent();

    target.on("click", anchorClickEvent);

    function anchorClickEvent() {

      if (cont.is(':hidden')) {
        _this.open();
      } else {
        _this.close();
      }
    }

    _this.siblingsClose = function() {
      cont.css('display', 'none');
    };

    _this.open = function() {
      cont.slideDown();
    };
    _this.close = function() {
      cont.slideUp();
    }
  }
});