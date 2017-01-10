
var config = {},
    _files = {};

var upImage = {

	Base64convertFile : function (urlData){
	  var bytes = window.atob(urlData.split(',')[1]);
	  var ab = new ArrayBuffer(bytes.length);
	  var ia = new Uint8Array(ab);
	  for (var i = 0; i < bytes.length; i++) {
	      ia[i] = bytes.charCodeAt(i);  
	  }
	  return new Blob( [ab] , {type : 'image/png'});
	} ,readFile : function(obj,view,cb){//添加照片到手机
	  //el.eLoading.addClass('on').show();
	  var file = obj.files[0],
	    reader = new FileReader();
	    reader.onload = (function(theFile){
	    return function(e){
	      var html = '<div class="i">\
	                    <a class="icolse" href="javascript:;"></a>\
	                    <div class="picv"><img src="{img}" /></div>\
	                  </div>';
	      var imgItem = new Image();
	          imgItem.src = e.target.result;
	          imgItem.onload = function(){
	            var cPic = upImage.compress(imgItem,10,undefined,cb).src;
	            view.append(html.replace('{img}',cPic));
	            config.ISCHANGE = 1;
	            _files = upImage.Base64convertFile(cPic)
	          }
	    }
	  })(file);
	  reader.readAsDataURL(file);
	}, compress: function(img, quality, opf,cb){//compress image
	    var itype = "image/jpeg";
	    if( opf != undefined && opf == "png" ) itype = "image/png";
	    var cvs = document.createElement('canvas');
	    cvs.width = img.naturalWidth;
	    cvs.height = img.naturalHeight;
	    var ctx = cvs.getContext("2d").drawImage(img, 0, 0);
	    var newImageData = cvs.toDataURL(itype, quality / 100);
	    var resimg = new Image();
	        resimg.src = newImageData;
	    resimg.onload = function(){
	      if(cb)cb();
	    }
	    return resimg;
	}
};//upImage

module.exports = upImage;