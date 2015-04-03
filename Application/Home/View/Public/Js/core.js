var levelArray = new Array();
var coreClass;


/*function init()
{
	setPulldownMenu();
	//setFieldFocus();
	//coreClass = new setCore();
}*/

function setCore()
{
	var contentW = 980;
	var limitY = 90;
	
	var mainContainer = d.getElementById('mainContainer');
	var sectionContainer = d.getElementById('sectionContainer');
	var header = d.getElementById('header');
	var containerList = getElementsByClassName(sectionContainer, 'section');
	
	var navList = [];
	var startScroll = true;
	var section;
	var total = containerList.length;
	var screenW;
	var screenH;
	var resizeEventArray = [];
	var scrollBody;
	var isScrolling = false;
	var directGoPage;
	var directGoSection;
	
	var self = this;
	
	this.init = function()
	{
		if (!d.getElementById('subnav')) return;
		
		//Set ScrollBody
		var t = d.documentElement.scrollTop;
		d.documentElement.scrollTop = Math.round((t + 10) / 10);
		scrollBody = ((d.documentElement.scrollTop != t)?	d.documentElement:d.body);
		d.documentElement.scrollTop = t;
		
		this.setNav();
		this.checkAddress();
		
		addEvent(window, 'scroll', function(e)
		{
			self.setScroll();
		});
		
		/*addEvent(window, 'resize', function()
		{
			self.setResize();
			self.setScroll();
		});
		self.setResize();*/
		
		/*if (!(isIE && isIELower9))
		{
			addEvent(d.body, 'mousewheel', self.setWheel);
			addEvent(d.body, 'DOMMouseScroll', self.setWheel);
		}*/
	};
	
	this.setWheel = function(e)
	{
		e.preventDefault();
		
		e = e ? e : event;
		var dir = 0;
		
		if (typeof e.wheelDelta == 'undefined')
		{
			if (e.detail > 0) dir = 1;
			if (e.detail < 0) dir = -1;
		}
		else
		{
			if (e.wheelDelta >= 120) dir = -1;
			if (e.wheelDelta <= -120) dir = 1;
		}
		
		d.body.scrollTop += (30 * dir);
		d.documentElement.scrollTop += (30 * dir);
		//d.title = d.documentElement.scrollTop;
	};
	
	this.setResize = function()
	{
		screenW = d.documentElement.offsetWidth;
		screenH = d.documentElement.offsetHeight;
		
		for (var i=0; i<resizeEventArray.length; i++)
		{
			resizeEventArray[i]();
		}
	};
	
	this.setScroll = function()
	{
		var t = scrollBody.scrollTop;
		var num = 0;
		
		for (var i=0; i<containerList.length; i++)
		{
			if (i == containerList.length - 1)
			{
				num = i;
				break;
			}
			
			var div = containerList[i];
			var nextDiv = containerList[i + 1];
			
			var divT = div.offsetTop - limitY;
			var nextDivT = nextDiv.offsetTop - limitY;
			
			if (t >= divT && t < nextDivT)
			{
				num = i;
				break;
			}
		};
		
		//Set Last Section
		if (t == (scrollBody.scrollHeight - screenH) && !isMobile)
		{
			num = total - 1;
		}
		
		if (isScrolling)	return;
		
		if (section != num)
		{
			this.navHighlight(navList[num]);
			if (containerList[num].subSection)
			{
				addSectionHash(navList[num].address, containerList[num].subSection);
			}
			else
			{
				addSectionHash(navList[num].address);
			}
			section = num;
		}
	};
	
	/**************************** Navigation starts  ****************************/
	
	this.setNav = function()
	{
		var subNav = d.getElementById('subnav');
		var a = subNav.getElementsByTagName('a');
		
		for (var i=0; i<a.length; i++)
		{
			a[i].num = i;
			a[i].address = (a[i].href.toString().split('#/'))[1];
			a[i].href = 'javascript:;';
			a[i].onclick = function()
			{
				//if (this.num == section)	return;
				if (isScrolling)	return;
				
				self.navHighlight(this);
				self.navClick(this);
			};
			
			navList.push(a[i]);
		}
		
		//this.navClick(navList[0], true);
		//this.navHighlight(navList[0]);
	};
	
	this.navHighlight = function(btn)
	{
		if (!isNaN(section))
		{
			navList[section].className = navList[section].className.replace(/active/g, '');
		}
		btn.className += ' active';
	};
	
	this.navClick = function(btn, isDirectGo, action)
	{
		var content = containerList[btn.num];
		if (!content)	return;
		
		if (btn.num != section)
		{
			if (isDirectGo)
			{
				directGoPage = true;
			}
			else
			{
				//Add hash
				//alert(section + '  :  ' + btn.num);
				if (section != btn.num || btn.num == 0)
				{
					levelArray[0] = btn.address;
					while (levelArray.length > 1)	levelArray.pop();
					
					if (!isScrolling)
					{
						if (content.subSection)
						{
							addSectionHash(levelArray[0], content.subSection);
						}
						else
						{
							addSectionHash(levelArray[0]);
						}
					}
				}
			}
			
			isScrolling = true;
		}
		
		//var y = content.offsetTop - limitY;
		var y = content.offsetTop;
		if (btn.num > 0)	y -= limitY;
		if (isMobile)	$('.devicefix').css({height:1});
		$(scrollBody).stop().animate({'scrollTop':y}, 500, 'easeInOutQuad', function()
		{
			setTimeout(function()
			{
				//About
				if (btn.num == 1)
				{
					$(containerList[btn.num].content).delay(500).stop().animate({'left':0}, 500, 'easeInOutQuad');
				}
				
				if (action)	action();
				isScrolling = false;
			}, ((isMobile)?	100:10));
			if (isMobile)	$('.devicefix').css({height:0});
		});
		
		section = btn.num;
		isScrolling = true;
	};

	this.checkAddress = function ()
	{
		var id = 0;
		var subSection;
		var hash = location.hash.toString();
		
		if (hash != '')
		{
			hash = hash.replace('#/', '');
			levelArray = hash.split('/');
			
			//Check Level 1
			for (var i=0; i<navList.length; i++)
			{
				if (navList[i].address != levelArray[0])	continue;
				id = i;
				
				//Check Level 2
				/*if (sitemap[i].section)
				{
					for (var j=0; j<sitemap[i].section.length; j++)
					{
						if (sitemap[i].section[j].id != levelArray[1])	continue;
						subSection = sitemap[i].section[j].id;
						containerList[id].subSection = subSection;
					};
				}*/
				if (levelArray.length > 1)	subSection = levelArray[1];
				
				break;
			};
		}
		
		setTimeout(function()
		{
			self.navHighlight(navList[id]);
			self.navClick(navList[id], true);
			
			if (subSection)
			{
				self.goToAnchor(subSection);
				addSectionHash(navList[id].address, subSection);
				//self.loadPage(subSection);
				
				subSection = null;
			}
			else
			{
				addSectionHash(navList[id].address);
			}
			//section = id;
		}, 500);
		
		directGoSection = id;
	};
	
	this.goDirectSection = function(id, address)
	{
		var num = null;
		
		//Check Level 1
		for (var i=0; i<navList.length; i++)
		{
			if (navList[i].address != id)	continue;
			num = i;
			
			if (!address)	address = navList[i].address;
			
			break;
		};
		
		if (num == null)	return;
		if (!address)	return;
		
		var btn = navList[num];
		if (!btn)	return;
		
		self.navHighlight(btn);
		self.navClick(btn, false, function()
		{
			
		});
	};
	
	this.goToAnchor = function(id)
	{
		var target = $('#' + id);
		var y = target.offset().top - limitY;
		
		setTimeout(function()
		{
			$(scrollBody).animate({'scrollTop':y}, 300);
		}, 100);
	};
	
	/**************************** Navigation ends  ****************************/
	
	setTimeout(function(){self.init();}, 200);
}

function addHash(address)
{
	var topUrl = top.location.href.replace(top.location.hash, '');
	top.location.href = topUrl + address;
}

function addSectionHash(section, subSection)
{
	if (section && !subSection)
	{
		addHash('#/' + section);
	}
	else if (!section && subSection)
	{
		addHash('#/' + levelArray[0] + '/' + subSection);
	}
	else if (section && subSection)
	{
		addHash('#/' + section + '/' + subSection);
	}
	
	if (section)	levelArray[0] = section;
	if (subSection)
	{
		levelArray[1] = subSection;
	}
	else
	{
		levelArray.length = 1;
	}
}