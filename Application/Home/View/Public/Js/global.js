var isIE = (navigator.appName.indexOf("Microsoft") > -1);
var isIE6 = false /*@cc_on || @_jscript_version < 5.7 @*/;
var isIE7 = false /*@cc_on || @_jscript_version == 5.7 @*/;
var isIE8 = false /*@cc_on || @_jscript_version == 5.8 @*/;
var isIELower9 = false /*@cc_on || @_jscript_version <= 5.8 @*/;
//var isAndroid = (navigator.userAgent.toLowerCase().search('android') > -1);
var isIpad = checkIsIphoneIpad();
var isAndroid = checkIsAndroid();
var isMobile = (isIE)?	false:checkMobile();
var isTablet = Boolean(window.navigator.msPointerEnabled);
var ieVersion;
var screenW;
var screenH;
if (/MSIE (\d+\.\d+);/.test(navigator.userAgent))	ieVersion = new Number(RegExp.$1);
var d = document;
var isParent = false;
var linkIsClicked = false;
//if (!basePath)	var basePath = 'index.html';

//if (isMobile)	addIpadCSS();
if (isAndroid)	addAndroidViewport();

//Check is Parent?
//checkIsParent();

function init()
{
	//setFieldFocus();
	setPulldownMenu();
	setBridalNav();
		
	/* onload = function()
	{
		//Hide address bar
		setTimeout(function()
		{
			window.scrollTo(0, 1);
		}, 100);
	}; */
}

function checkIsParent()
{
	setTimeout(function()
	{
		if (isParent)									return;
		if (self != window)								return;
		if (parent.document.location.hash != '')		return;
		if (window.location != window.parent.location)	return;
		
		//$.getScript(basePath + 'js/sitemap.js', function()
		//{
			loadComplete();
		//});
	}, 10);
	
	function loadComplete()
	{
		var url = location.pathname;
		var search = location.search;
		
		for (var i=0; i<sitemap.length; i++)
		{
			for (var j=0; j<sitemap[i].length; j++)
			{
				if (sitemap[i][j].url == '')				continue;
				//alert(url + '  :  ' + sitemap[i].url);
				if (url.indexOf(sitemap[i][j].url) < 0)	continue;
				
				//alert(basePath + search + '#/' + sitemap[i].id);
				location.href = basePath + search + '#/' + sitemap[i][j].id;
				break;
			};
		};
	}
}

function NewWindow(mypage, myname, w, h, scroll,resizable)
{
	var winl = (screen.width - w) / 2;
	var wint = (screen.height - h) / 2;
	winprops = 'height='+h+',width='+w+',top='+wint+',left='+winl+',scrollbars='+scroll+',resizable='+resizable+','
	win = window.open(mypage, myname, winprops)
	win.self.focus()
	if (parseInt(navigator.appVersion) >= 4) { win.window.focus(); }
}

function createImg(src, alt, w, h, link, t, className)
{
	var img = d.createElement('img');
	if (src)	img.setAttribute('src', src);
	if (alt)	img.setAttribute('alt', alt);
	if (w)	img.setAttribute('width', w);
	if (h)	img.setAttribute('height', h);
	if (className)	img.className = className;

	if (link)
	{
		img.setAttribute('border', 0);

		var a = d.createElement('a');
		a.setAttribute('href', link);
		if (t && typeof(t) != 'undefined')	a.setAttribute('target', t);
		a.appendChild(img);
		return a;
	}
	else
	{
		return img;
	}
}

function createA(link, t, txt, id, className)
{
	var a = d.createElement('a');
	if (link)	a.setAttribute('href', link);
	if (t && typeof(t) != 'undefined')	a.setAttribute('target', t);

	//if (txt)	a.appendChild(d.createTextNode(txt));
	if (txt)	a.innerHTML = txt;
	if (id)	a.setAttribute('id', id);
	if (className)	a.className = className;

	return a;
}

function createDiv(id, className, txt)
{
	var div = d.createElement('div');
	if (id)	div.setAttribute('id', id);
	if (className)	div.className = className;
	//if (txt)	div.appendChild(d.createTextNode(txt));
	if (txt)	div.innerHTML = txt;
	return div;
}

function createTag(tag, id, className)
{
	var div = d.createElement(tag);
	if (id)	div.setAttribute('id', id);
	if (className)	div.className = className;
	return div;
}

function createInput(name, type, value, className)
{
	var input = d.createElement('input');
	if (name)	input.setAttribute('name', name);
	if (type)	input.setAttribute('type', type);
	if (value)	input.setAttribute('value', value);
	if (className)	input.className = className;
	return input;
}

function setChildNodes(obj, tagName)
{
	var array = new Array();

	for (var i=0; i<obj.childNodes.length; i++)
	{
		if (tagName)
		{
			//alert(obj.childNodes[i].tagName)
			if (obj.childNodes[i].tagName != tagName)	continue;
		}
		if (obj.childNodes[i].toString().toLowerCase().indexOf('text') >= 0)	continue;
		array.push(obj.childNodes[i]);
	}

	return array;
}

function getElementsByClassName(p, c, selected)
{
	var array = new Array();
	var tags = p.getElementsByTagName('*');

	for (var i=0; i<tags.length; i++)
	{
		if (!tags[i].className)	continue;
		if (selected)
		{
			if (tags[i].className.indexOf(c) >= 0)	array.push(tags[i]);
		}
		else
		{
			if (tags[i].className == c)	array.push(tags[i]);
		}
	}

	return array;
}

function getElementByRel(parent, obj)
{
	var a = parent.getElementsByTagName('a');
	for (var i=0; i<a.length; i++)
	{
		if (a[i].rel == obj)
		{
			return a[i];
		}
	}
}

function GetParam(name)
{
	var start=location.search.indexOf("?"+name+"=");
	if (start<0) start=location.search.indexOf("&"+name+"=");
 	if (start<0) return '';
 	start += name.length+2;
 	var end=location.search.indexOf("&",start)-1;
 	if (end<0) end=location.search.length;
 	var result=location.search.substring(start,end);
 	var result='';
 	for(var i=start;i<=end;i++)
 	{
 		var c=location.search.charAt(i);
 		result=result+(c=='+'?' ':c);
 	}
 	//alert(unescape(result));
 	return unescape(result);
}

function addEvent (o, t, f)
{
	removeEvent (o, t, f);
	if (o.attachEvent) o.attachEvent('on'+ t, f);
	else o.addEventListener(t, f, false);
};

function removeEvent (o, t, f)
{
	if (o.detachEvent) o.detachEvent('on'+ t, f);
	else o.removeEventListener(t, f, false);
};

function addZero(num)
{
	if (num < 10)	num = '0' + num;
	return	num;
}

function setFieldFocus()
{
	var input = d.getElementsByTagName('input');

	for (var i=0; i<input.length; i++)
	{
		if (input[i].type != 'text')		continue;
		if (input[i].defaultValue == '')	continue;

		input[i].onfocus = function()
		{
			if (this.value == this.defaultValue)	this.value = '';
		}

		input[i].onblur = function()
		{
			if (this.value == '')	this.value = this.defaultValue;
		}
	}
}

function checkIsIphoneIpad()
{
	var pda_user_agent_list = new Array("iPhone", "iPod", "iPad"/*, "GTB"*/);

	var user_agent = navigator.userAgent.toString();
	for (var i=0; i<pda_user_agent_list.length; i++) {
		if (user_agent.indexOf(pda_user_agent_list[i]) >= 0) {
			return true;
		}
	}

	return false;
}

function checkIsAndroid()
{
	var pda_user_agent_list = new Array("Android");

	var user_agent = navigator.userAgent.toString();
	for (var i=0; i<pda_user_agent_list.length; i++) {
		if (user_agent.indexOf(pda_user_agent_list[i]) >= 0) {
			return true;
		}
	}

	return false;
}

function checkMobile()
{
	var pda_user_agent_list = new Array("2.0 MMP", "240320", "AvantGo","BlackBerry", "Blazer",
			"Cellphone", "Danger", "DoCoMo", "Elaine/3.0", "EudoraWeb", "hiptop", "IEMobile", "KYOCERA/WX310K", "LG/U990",
			"MIDP-2.0", "MMEF20", "MOT-V", "NetFront", "Newt", "Nintendo Wii", "Nitro", "Nokia",
			"Opera Mini", "Opera Mobi",
			"Palm", "Playstation Portable", "portalmmm", "Proxinet", "ProxiNet",
			"SHARP-TQ-GX10", "Small", "SonyEricsson", "Symbian OS", "SymbianOS", "TS21i-10", "UP.Browser", "UP.Link",
			"Windows CE", "WinWAP", "Android", "iPhone", "iPod", "iPad", "Windows Phone", "HTC"/*, "GTB"*/, "Tablet PC");
	var pda_app_name_list = new Array("Microsoft Pocket Internet Explorer");

	var user_agent = navigator.userAgent.toString();
	for (var i=0; i<pda_user_agent_list.length; i++) {
		if (user_agent.indexOf(pda_user_agent_list[i]) >= 0) {
			return true;
		}
	}
	var appName = navigator.appName.toString();
	for (var i=0; i<pda_app_name_list.length; i++) {
		if (user_agent.indexOf(pda_app_name_list[i]) >= 0) {
			return true;
		}
	}

	return false;
}

function addIpadCSS()
{
	var cssLink = document.createElement('link');
	cssLink.setAttribute('rel', 'stylesheet');
	cssLink.setAttribute('type', 'text/css');
	cssLink.setAttribute('href', 'css/ipad.css');
	d.getElementsByTagName('head')[0].appendChild(cssLink);

	//d.body.className += ' iPad';
}

function addAndroidViewport()
{
	var viewport = document.createElement('meta');
	viewport.setAttribute('name', 'viewport');
	viewport.setAttribute('content', 'width=1330;');
	d.getElementsByTagName('head')[0].appendChild(viewport);
}

function changeLanguage(target)
{
	var array = new Array('en', 'tc', 'sc');
	var lang;
	var url = top.location.href;
	//if (top.location.hash)	url = top.location.href.replace(top.location.hash, '');
	
	for (var i=0; i<array.length; i++)
	{
		if (url.indexOf('/' + array[i] + '/') < 0)	continue;
		url = url.replace('/' + array[i] + '/', '/' + target + '/');
		break;
	}
	
	window.top.location.href = url;
}

function detectTouch(obj, config)
{
    if (!config)	config =
	{
		min_move_x: 20,
		wipeLeft: function(x) {},
		wipeRight: function(x) {},
		min_move_y: 20,
		wipeTop: function(y) {},
		wipeBottom: function(y) {},
		preventDefaultEvents: true
	};

	var startX;
	var startY;
	var isMoving = false;

	function cancelTouch()
	{
		if (!isMobile)
		{
			removeEvent(obj, 'mousemove', onTouchMove);
		}
		else
		{
			this.removeEventListener('touchmove', onTouchMove);
		}
		startX = null;
		startY = null;
		isMoving = false;
	}

	function onTouchMove(e)
	{
		if (config.preventDefaultEvents)
		{
			if (!isIE)	e.preventDefault();
		}
		
		if (isMoving)
		{
			var x = (isMobile)?	e.touches[0].pageX:e.clientX;
			if (startX)	var dx = startX - x;
			if (Math.abs(dx) >= config.min_move_x)
			{
				cancelTouch();
				if (dx > 0)
				{
					config.wipeLeft(dx);
				}
				else
				{
					config.wipeRight(dx);
				}
			}
			var y = (isMobile)?	e.touches[0].pageY:e.clientY;
			if (startY)	var dy = startY - y;
			if (Math.abs(dy) >= config.min_move_y)
			{
				cancelTouch();
				if (dy > 0)
				{
					config.wipeTop(dy);
				}
				else
				{
					config.wipeBottom(dy);
				}
			}
		}
	}

	function onTouchStart(e)
	{
		if (isMobile)
		{
			if (e.touches.length > 1)	return;
		}
		if (config.preventDefaultEvents)
		{
			if (!isIE && !isMobile)	e.preventDefault();
		}
		
		startX = (isMobile)?	e.touches[0].pageX:e.clientX;
		startY = (isMobile)?	e.touches[0].pageY:e.clientY;
		isMoving = true;
		if (!isMobile)
		{
			addEvent(obj, 'mousemove', onTouchMove);
		}
		else
		{
			this.addEventListener('touchmove', onTouchMove, false);
		}
	}
	
	if (!isMobile)
	{
		addEvent(obj, 'mousedown', onTouchStart);
		addEvent(obj, 'mouseup', cancelTouch);
	}
	else
	{
		obj.addEventListener('touchstart', onTouchStart, false);
	}
 }

function setFieldFocus()
{
  var input = d.getElementsByTagName('input');
  
  for (var i=0; i<input.length; i++)
  {
    if (input[i].type != 'text')      continue;
    //if (input[i].className == 'routeField')  continue;
    
    input[i].onfocus = function()
    {
      if (this.value == this.defaultValue)  this.value = '';
    }
    
    input[i].onblur = function()
    {
      if (this.value == '')  this.value = this.defaultValue;
    }
  }
}

function tabs(trigger,content,defaultItem){
	$(trigger).each(function(i){
		$(this).click(function(e){
			if ($(this)[0].className.indexOf('active') >= 0)	return;
			e.preventDefault();
			$(trigger).removeClass('active');
			$(this).addClass('active');
			$(content).fadeOut().eq(i).fadeIn();
		});
	});
	
	if(defaultItem!=null)
		$(trigger).eq(defaultItem).click();
}

function setPulldownMenu()
{
	$('#mainNav > div').each(function(i){
		$(this).bind({
			mouseenter: function() {
				$(this).addClass('active');
				$(this).find('ul').show();
			},
			mouseleave: function() {
				$(this).removeClass('active');
				$(this).find('ul').hide();
			}
		});
	});
}
function setAboutGallery(imgs,path,num){
	var contentW = 472;
	var contentH = 360;
	var bgImgW = 472;
	var bgImgH = 360;
	var self = this;
	var mainContainer = d.getElementById('leftCol');
	var footer = d.getElementById('footer');
	var containerList = [];
	var svgList = [];
	var count = 0;
	this.init = function()
	{
		var html='';
		for(var i=0;i<num;i++){
			html+='<a href="javascript:;"> </a>';
		}	
        var wid=12*num;
		$('.aboutNav').css({'width':wid}).html('').append(html);
		this.setResize();		
		this.genContents();	
	
		addEvent(window, 'resize', function()
		{
			self.setResize();
			self.genContents();
		});
		tabs('.aboutNav > a','.svgContainer',0);
		
		setInterval(function(){
			if (count == $('.aboutNav > a').length){
				$('.aboutNav > a').first().click();
				count = 0;
			} else {
				$('.aboutNav > a.active').next().click();
				count++;
			}
		},5000);
		
		if (isMobile)
		{
			
			var container = $('#contentContainer')[0];
			new detectTouch(container,
			{
					min_move_x: 50,
					wipeLeft: function (x) {
						$('.aboutNav a.active').next().click();
					},
					wipeRight: function (x) {
						$('.aboutNav a.active').prev().click();	
					},
					preventDefaultEvents: true
			});
		}
	}

	this.setResize = function()
	{
		screenW = d.documentElement.offsetWidth;
		screenH = d.documentElement.offsetHeight;
		if (screenW < contentW)	screenW = contentW;
		if (screenH < contentH)	screenH = contentH;
	};		

	this.genContents = function()
	{
		$.each(imgs,function(i,item){
			var banner=path+'Uploads/'+item['pic'];
			
		/*for (var i=0; i<5; i++)
		{*/
			//alert(containerList);
			if (!containerList[i])
			{
				var svgContainer = createDiv('home'+i+'Svg', 'svgContainer');
				var tagline = createDiv('', 'tagline'+i);
				
				if(item['tag']!=''){
				var tagImg=path+'Uploads/'+item['tag'];
				
				var taglineImg = createImg(tagImg);
				//createImg(src, alt, w, h, link, t, className)
				tagline.appendChild(taglineImg, ' ');
				svgContainer.appendChild(tagline);
				}

				mainContainer.appendChild(svgContainer);
				mainContainer.svg = Raphael('home'+i+'Svg', '100%', '100%');
				mainContainer.imgW =472;
				mainContainer.imgH =360;	
				mainContainer.img = mainContainer.svg.image(banner, 0, 0, mainContainer.imgW, mainContainer.imgH);
				
				svgList.push(mainContainer.img);
				
				containerList.push(svgContainer);
				
			}
				
			//Set Style
		
			var w = bgImgW;
			var h = bgImgH;
			
			if (w < contentW)	w = contentW;
			if (h < contentH)	h = contentH;
			//w -= 20;
			if (screenH < screenW || !isMobile)
			{
				h -= footer.offsetHeight + 100;
				$('#mainWrapper').css({'padding-top':100});
			}
			else
			{
				//h -= footer.offsetHeight + 100;
				$('#mainWrapper').css({'padding-top':((screenH+footer.offsetHeight)-h)/2});
			}
			
			$('#mainContainer').css({'width':w, 'height':h});
			if (mainContainer.img)
			{
				var x = 0;
				
				//Resize Bg Img
				var screenRatio = w / h;
				var imgRatio = mainContainer.imgW / mainContainer.imgH;
				var resizeMode = (screenRatio > imgRatio)?	'W':'H';
				var imgW;
				var imgH;
				var imgX;
				var imgY;
				
				if (resizeMode == 'W')
				{
					imgW = w;
					imgH = mainContainer.imgH * (imgW / mainContainer.imgW);
					imgX = 0;
					imgY = (h - imgH) / 2;
				}
				else
				{
					imgH = h;
					imgW = mainContainer.imgW * (imgH / mainContainer.imgH);
					imgX = (w - imgW) / 2;
					imgY = 0;
				}
				
				svgList[i].attr(
				{
					width:Math.round(imgW),
					height:Math.round(imgH),
					x:Math.round(imgX),
					y:Math.round(imgY)
				});
				//console.log(imgW);
				
				if (mainContainer.addedImg)
				{
					mainContainer.addedImg.attr(
					{
						width:Math.round(imgW),
						height:Math.round(imgH),
						x:Math.round(imgX),
						y:Math.round(imgY)
					});
				}
				
				mainContainer.imgPos = {w:imgW, h:imgH, x:imgX, y:imgY};
			}
		});
	}
	
	this.init();	
}
function setHomeGallery(imgs,path,num){
	var contentW = 960;
	var contentH = 475;
	var bgImgW = 1080;
	var bgImgH = 475;
	var self = this;
	var mainContainer = d.getElementById('mainContainer');
	var footer = d.getElementById('footer');
	var containerList = [];
	var svgList = [];
	var count = 0;
	this.init = function()
	{
		var html='';
		for(var i=0;i<num;i++){
			html+='<a href="javascript:;"> </a>';
		}	
        var wid=12*num;
		$('.homeNav').css({'width':wid}).html('').append(html);
		this.setResize();		
		this.genContents();	
	
		addEvent(window, 'resize', function()
		{
			self.setResize();
			self.genContents();
		});
		tabs('.homeNav > a','#mainContainer > .svgContainer',0);
		
		setInterval(function(){
			if (count == $('.homeNav > a').length){
				$('.homeNav > a').first().click();
				count = 0;
			} else {
				$('.homeNav > a.active').next().click();
				count++;
			}
		},5000);
		
		if (isMobile)
		{
			
			var container = $('#contentContainer')[0];
			new detectTouch(container,
			{
					min_move_x: 50,
					wipeLeft: function (x) {
						$('.homeNav a.active').next().click();
					},
					wipeRight: function (x) {
						$('.homeNav a.active').prev().click();	
					},
					preventDefaultEvents: true
			});
		}
	}

	this.setResize = function()
	{
		screenW = d.documentElement.offsetWidth;
		screenH = d.documentElement.offsetHeight;
		if (screenW < contentW)	screenW = contentW;
		if (screenH < contentH)	screenH = contentH;
	};		

	this.genContents = function()
	{
		$.each(imgs,function(i,item){
			var banner=path+'Uploads/'+item['pic'];
			
		/*for (var i=0; i<5; i++)
		{*/
			//alert(containerList);
			if (!containerList[i])
			{
				var svgContainer = createDiv('home'+i+'Svg', 'svgContainer');
				var tagline = createDiv('', 'tagline'+i);
				
				if(item['tag']!=''){
				var tagImg=path+'Uploads/'+item['tag'];
				
				var taglineImg = createImg(tagImg);
				//createImg(src, alt, w, h, link, t, className)
				tagline.appendChild(taglineImg, ' ');
				svgContainer.appendChild(tagline);
				}

				mainContainer.appendChild(svgContainer);
				mainContainer.svg = Raphael('home'+i+'Svg', '100%', '100%');
				mainContainer.imgW = bgImgW;
				mainContainer.imgH = bgImgH;	
				mainContainer.img = mainContainer.svg.image(banner, 0, 0, mainContainer.imgW, mainContainer.imgH);
				
				svgList.push(mainContainer.img);
				
				containerList.push(svgContainer);
				
			}
				
			//Set Style
			if (screenH >= screenW && isMobile)
			{
				var w = bgImgW;
				var h = bgImgH;
			}
			else
			{
				var w = screenW;
				var h = screenH;
			}
			if (w < contentW)	w = contentW;
			if (h < contentH)	h = contentH;
			//w -= 20;
			if (screenH < screenW || !isMobile)
			{
				h -= footer.offsetHeight + 100;
				$('#mainWrapper').css({'padding-top':100});
			}
			else
			{
				//h -= footer.offsetHeight + 100;
				$('#mainWrapper').css({'padding-top':((screenH+footer.offsetHeight)-h)/2});
			}
			
			$('#mainContainer').css({'width':w, 'height':h});
			//if (sitemap[i].bgImg)		$(containerList[i]).css({'background-image':'url(' + sitemap[i].bgImg + ')'});
			//if (sitemap[i].bgRepeat)	$(containerList[i]).css({'background-repeat':'repeat'});
			if (mainContainer.img)
			{
				var x = 0;
				
				//Resize Bg Img
				var screenRatio = w / h;
				var imgRatio = mainContainer.imgW / mainContainer.imgH;
				var resizeMode = (screenRatio > imgRatio)?	'W':'H';
				var imgW;
				var imgH;
				var imgX;
				var imgY;
				
				if (resizeMode == 'W')
				{
					imgW = w;
					imgH = mainContainer.imgH * (imgW / mainContainer.imgW);
					imgX = 0;
					imgY = (h - imgH) / 2;
				}
				else
				{
					imgH = h;
					imgW = mainContainer.imgW * (imgH / mainContainer.imgH);
					imgX = (w - imgW) / 2;
					imgY = 0;
				}
				
				svgList[i].attr(
				{
					width:Math.round(imgW),
					height:Math.round(imgH),
					x:Math.round(imgX),
					y:Math.round(imgY)
				});
				//console.log(imgW);
				
				if (mainContainer.addedImg)
				{
					mainContainer.addedImg.attr(
					{
						width:Math.round(imgW),
						height:Math.round(imgH),
						x:Math.round(imgX),
						y:Math.round(imgY)
					});
				}
				
				mainContainer.imgPos = {w:imgW, h:imgH, x:imgX, y:imgY};
			}
		});
	}
	
	this.init();	
}

function setNews(){
	$('.newsList').jScrollPane();
	$('.newsGallery').jcarousel({
		scroll:1
	});
	
	if ($('.newsGallery img').length <= 1) {
		$('.jcarousel-prev, .jcarousel-next').hide();
	}
	
	if (isMobile)
	{
		var container = $('.news #sectionContainer')[0];
		new detectTouch(container,
		{
				min_move_x: 50,
				wipeLeft: function (x) { $('.jcarousel-next').click(); },
				wipeRight: function (x) { $('.jcarousel-prev').click(); },
				preventDefaultEvents: true
		});
	}
}

function setPrevNext(){
	
	var btnNext = '.btnNext';
	var btnPrev = '.btnPrev';
	
	this.init = function()
	{
		this.setPos();
		
		$('.vertContainer').cycle({
			fx: 'scrollVert',
			rev:1,
			timeout: 0,
			nowrap: 1,
			speed: 500,
			next: btnNext,
			prev: btnPrev,
			after: onAfter,
			onPrevNextEvent:prevNext,
			slideResize: 0
		});
		
		setSubnav();
		
		$('#mainNav > div.programmes ul li a, #mainNav > div.tutors ul li a, #mainNav > div.artists ul li a').click(function(){
			var a = $(this).attr('href');
			var num = a[a.length-1];			
			setSubnav(num);
		});
		
		$(window).resize(function() {
			this.setPos();
		});
	
		/* if (isMobile)
		{
			var container = $('.vertContainer')[0];
			new detectTouch(container,
			{
					min_move_y: 100,
					wipeBottom: function (y) { $('.btnNext').click(); },
					wipeTop: function (y) { $('.btnPrev').click(); },
					preventDefaultEvents: true
			});
		} */
		
		onload = function()
		{
			//Hide address bar
			window.scrollTo(0, 1);
			setTimeout(function()
			{
				this.setPos();
			}, 100);
			
		};
		
	}
	
	this.setPos = function()
	{
		var minH = 880;
		var h = $(window).outerHeight() - $('#header').outerHeight() - $('#footer').outerHeight();
		//console.log(h);
		if (h <= minH){
			$('.vertContainer, .vertItem').css({height:minH});
		} else {
			$('.vertContainer, .vertItem').css({height:h});
		}
		
		$('.btns').css({
			top:0//($('.vertContent').outerHeight() + ((($(window).outerHeight() - $('#header').outerHeight() - $('#footer').outerHeight()) - $('.vertContent').outerHeight()) / 2)) - 38
		});
	}
	
	function setSubnav(num)
	{
		//var curIndex = GetParam('vertitem');
		if (num){
			$('.vertContainer').cycle((num-1));
		} else {
			var curIndex = top.location.hash.replace('#vertitem','');
			$('.vertContainer').cycle((curIndex-1));			
		}
	}
	
	function onAfter(curr, next, opts) {
    var index = opts.currSlide;
    $(btnPrev)[index == 0 ? 'addClass' : 'removeClass']('dim');
    $(btnNext)[index == opts.slideCount - 1 ? 'addClass' : 'removeClass']('dim');
	}
	
	function prevNext(isNext, index, slideElement) {
		addHash('#vertitem'+(index+1));
	}
	
	this.init();
}
function setPrevNext2(){
	var btnNext = '.btnNext';
	var btnPrev = '.btnPrev';
	
	this.init = function()
	{
		this.setPos();
		
		$('.vertContainer').cycle({
			fx: 'scrollVert',
			rev:1,
			timeout: 0,
			nowrap: 1,
			speed: 500,
			next: btnNext,
			prev: btnPrev,
			after: onAfter,
			onPrevNextEvent:prevNext,
			slideResize: 0
		});
		
		setSubnav();
		
		$('#mainNav > div.programmes ul li a, #mainNav > div.tutors ul li a, #mainNav > div.artists ul li a').click(function(){
			var a = $(this).attr('href');
			var num = a[a.length-1];			
			setSubnav(num);
		});
		
		$(window).resize(function() {
			this.setPos();
		});
	
		/* if (isMobile)
		{
			var container = $('.vertContainer')[0];
			new detectTouch(container,
			{
					min_move_y: 100,
					wipeBottom: function (y) { $('.btnNext').click(); },
					wipeTop: function (y) { $('.btnPrev').click(); },
					preventDefaultEvents: true
			});
		} */
		
		onload = function()
		{
			//Hide address bar
			window.scrollTo(0, 1);
			setTimeout(function()
			{
				this.setPos();
			}, 100);
			
		};
		
	}
	
	this.setPos = function()
	{
		var minH =704;
		var h = $(window).outerHeight() - $('#header').outerHeight() - $('#footer').outerHeight();
		if (h <= minH){
			$('.vertContainer, .vertItem').css({height:minH});
		} else {
			console.log('111');
			$('.vertContainer, .vertItem').css({height:h});
		}
		
		/*$('.btns').css({
			top:($('.vertContent').outerHeight() + ((($(window).outerHeight() - $('#header').outerHeight() - $('#footer').outerHeight()) - $('.vertContent').outerHeight()) / 2)) -18
		});*/
	}
	
	function setSubnav(num)
	{
		//var curIndex = GetParam('vertitem');
		if (num){
			$('.vertContainer').cycle((num-1));
		} else {
			var curIndex = top.location.hash.replace('#vertitem','');
			$('.vertContainer').cycle((curIndex-1));			
		}
	}
	
	function onAfter(curr, next, opts) {
    var index = opts.currSlide;
    $(btnPrev)[index == 0 ? 'addClass' : 'removeClass']('dim');
    $(btnNext)[index == opts.slideCount - 1 ? 'addClass' : 'removeClass']('dim');
	}
	
	function prevNext(isNext, index, slideElement) {
		addHash('#vertitem'+(index+1));
	}
	
	this.init();
}
function setPhotoGallery(){
	var btnNext = '.btnGalleryNext';
	var btnPrev = '.btnGalleryPrev';
	
	$('.photoGallery').each(function(i){
		$(this).cycle({
			fx: 'scrollHorz',
			timeout: 0,
			speed: 500,
			next: $(this).parent().find(btnNext),
			prev: $(this).parent().find(btnPrev),
			pager: $(this).parent().find('.photoGalleryBtns .galleryPager'),
			activePagerClass: 'active',
			after: onAfter,
			pagerAnchorBuilder: pagerFactory
		});
	
		function pagerFactory(idx, slide) {
			return '<a href="#">'+idx+'</a>';
		};
		
		function onAfter(curr,next,opts) {
			var msg = (opts.currSlide + 1) + ' / ' + opts.slideCount;
			$('.photoGallery').parent().find('.caption').eq(i).html(msg);
		};
	});
	
	if (isMobile)
	{
		$('.photoGallery').each(function(i){
			var container = $('.photoGallery').eq(i)[0];
			new detectTouch(container,
			{
					min_move_x: 50,
					wipeLeft: function (x) { $('.btnGalleryNext').eq(i).click(); },
					wipeRight: function (x) { $('.btnGalleryPrev').eq(i).click(); },
					preventDefaultEvents: true
			});
		});
	}
}

function setTabs(){
	$('.vertItem').each(function(){
		tabs($(this).find('.jobsNav > a'),$(this).find('.jobsList > div'),0);
	});
}

function genLocationMap() {
	
	var myLatlng = new google.maps.LatLng(22.2808367460213, 114.15604948997498);
	var myOptions = {
		zoom: 19,
		center: myLatlng,
		mapTypeId: google.maps.MapTypeId.ROADMAP
	}
	
	var map = new google.maps.Map(document.getElementById("myMap"), myOptions);	
	
	var academy = ['MOD Makeup Academy', 22.2808367460213,114.15604948997498, 100, 'Public/images/contact/icon.png'];
	
	// Set Icons function
	function setMarkers(map, locations) {
		var sites = locations;
		var image = new google.maps.MarkerImage(
			sites[4], 
			null, 
			new google.maps.Point(0, 0), 
			new google.maps.Point(27, 70),
			null
		);
		var myLatLng = new google.maps.LatLng(sites[1], sites[2]);
		var marker = new google.maps.Marker({
			position: myLatLng,
			map: map,
			icon: image,
			title: sites[0],
			zIndex: sites[3]
		});
	}
	
	setMarkers(map, academy);
}
function validateRegForm(myform)
{
	$('form.'+myform).validate({
		success: function(label) {
			label.addClass("valid");
		},
		showErrors: function() {
			this.defaultShowErrors();
		},
		submitHandler: function() {
			var data;
			data = {
				'name': d.getElementById("name").value, 
				'phone':  d.getElementById("telephone").value,
				'email':  d.getElementById("email").value,
				'password':  d.getElementById("password").value
			};
			$.ajax({
				url: myform+"_submit.php",
				type: "POST",
				data: data, 
				async: false,
				success: function(data)
				{
					if (data == 'Sent')
					{
						$.colorbox({
							html:'<div class="freeClassTrial"><p class="thank">Thank You!<br />We will get back to you as soon as possible.</p></div>',
							width:480,
							opacity:0.8,
							transition:'fade'
						});
					}
				}
			});
		}
	});
	
	$('form.'+myform+' .btnSend').click(function(){
		$('.'+myform).submit();
	});
}
function validateForm(myform)
{
	$('form.'+myform).validate({
		success: function(label) {
			label.addClass("valid");
		},
		showErrors: function() {
			this.defaultShowErrors();
		},
		submitHandler: function() {
			
			/*var yourname = document.getElementById('yourname');
			var telephone = document.getElementById('telephone');
			var email = document.getElementById('email');
			var comments = document.getElementById('comments');*/
			
			//var data = "yourname=" + yourname.value + "&telephone=" + telephone.value + "&email=" + email.value + "&comments=" + comments.value;
			
			var data;
			
			data = {
				'name': d.getElementById("yourname").value, 
				'contactNo':  d.getElementById("telephone").value,
				'email':  d.getElementById("email").value,
				'message':  d.getElementById("comments").value
			};
			
			$.ajax({
				url: myform + "_submit.php",
				//url: "send.php",
				type: "POST",
				data: data, 
				async: false,
				success: function(data)
				{
					//alert(data);
					if (data == 'Sent')
					{
						$.colorbox({
							html:'<div class="freeClassTrial"><p class="thank">Thank You!<br />We will get back to you as soon as possible.</p></div>',
							width:480,
							opacity:0.8,
							transition:'fade'
						});
					}
				}
			});
		}
	});
	
	$('form.'+myform+' .btnSend').click(function(){
		$('.'+myform).submit();
	});
	
	/*$('form.'+myform+' .btnReset').click(function(){
		$('form.'+myform).validate().resetForm();
		document.forms[myform].reset();
	});*/
}

function validateFreeForm(myform)
{
	$('.trial a').colorbox({
		inline:true,
		href:'.freeClassTrial',
		width:480,
		opacity:0.8,
		transition:'fade'
	});
	
	$('form.'+myform).validate({
		success: function(label) {
			label.addClass("valid");
		},
		showErrors: function() {
			this.defaultShowErrors();
		},
		submitHandler: function() {
			
			/*var yourname = document.getElementById('yourname');
			var telephone = document.getElementById('telephone');
			var email = document.getElementById('email');
			
			var data = "yourname=" + yourname.value + "&telephone=" + telephone.value + "&email=" + email.value;*/
			
			var data;
			
			data = {
				'name': d.getElementById("yourname").value, 
				'contactNo':  d.getElementById("telephone").value,
				'email':  d.getElementById("email").value
			};
			
			$.ajax({
				url: myform + "_submit.php",
				//url: "send_free.php",
				type: "POST",
				data: data, 
				async: false,
				success: function(data)
				{
					if (data == 'Sent')
					{
						$('.freeClassTrial').html('<p class="thank">Thank You!<br />We will get back to you as soon as possible.</p>');
					}
				}
			});
		}
	});
	
	$('form.'+myform+' .btnSend').click(function(){
		$('.'+myform).submit();
	});
	
	$('form.'+myform+' .btnReset').click(function(){
		$('form.'+myform).validate().resetForm();
		document.forms[myform].reset();
	});
}

function setBridalNav(){
		if ($('body').hasClass('bridal')){
			$('#mainNav ul img').each(function(){
				var img = $(this).attr('src').split('/');
				//console.log(img);
				var imgPath = img[0] + '/' + img[1] + '/' + img[2] + '/'+ 'bridal' + '/' + img[3];
				$(this).attr('src', imgPath);
			});
		}
}

function setBridalGallery(){
	$('.bridalGalleryContent').jcarousel({
		scroll:1
	});
	
	if ($('.bridalGalleryContent img').length <= 1) {
		$('.jcarousel-prev, .jcarousel-next').hide();
	}
	
	if (isMobile)
	{
		var container = $('.bridal .bridalContainer')[0];
		new detectTouch(container,
		{
				min_move_x: 50,
				wipeLeft: function (x) { $('.jcarousel-next').click(); },
				wipeRight: function (x) { $('.jcarousel-prev').click(); },
				preventDefaultEvents: true
		});
	}
}


/*jQuery.cookie = function(name, value, options)
{
	if (typeof value != 'undefined') { // name and value given, set cookie
		options = options ||
		{};
		if (value === null) {
			value = '';
			options.expires = -1;
		}
		if (typeof value == 'object' && jQuery.toJSON) {
			value = jQuery.toJSON(value);
		}
		var expires = '';
		if (options.expires && (typeof options.expires == 'number' || options.expires.toUTCString)) {
			var date;
			if (typeof options.expires == 'number') {
				date = new Date();
				date.setTime(date.getTime() + (options.expires * 24 * 60 * 60 * 1000));
			}
			else {
				date = options.expires;
			}
			expires = '; expires=' + date.toUTCString(); // use expires attribute, max-age is not supported by IE
		}
		// CAUTION: Needed to parenthesize options.path and options.domain
		// in the following expressions, otherwise they evaluate to undefined
		// in the packed version for some reason...
		var path = options.path ? '; path=' + (options.path) : '';
		var domain = options.domain ? '; domain=' + (options.domain) : '';
		var secure = options.secure ? '; secure' : '';
		document.cookie = [name, '=', encodeURIComponent(value), expires, path, domain, secure].join('');
	}
	else { // only name given, get cookie
		var cookieValue = null;
		if (document.cookie && document.cookie != '') {
			var cookies = document.cookie.split(';');
			for (var i = 0; i < cookies.length; i++) {
				var cookie = jQuery.trim(cookies[i]);
				// Does this cookie string begin with the name we want?
				if (cookie.substring(0, name.length + 1) == (name + '=')) {
					cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
					break;
				}
			}
		}
		if (jQuery.evalJSON && cookieValue && cookieValue.match(/^\s*\{/)) {
			try {
				cookieValue = jQuery.evalJSON(cookieValue);
			}
			catch (e) {
			}
		}
		return cookieValue;
	}
};*/