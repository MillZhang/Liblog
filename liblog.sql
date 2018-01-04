/*
Navicat MySQL Data Transfer

Source Server         : liblog
Source Server Version : 50717
Source Host           : 127.0.0.1:3306
Source Database       : liblog

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-01-04 13:26:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for li_article
-- ----------------------------
DROP TABLE IF EXISTS `li_article`;
CREATE TABLE `li_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `abstract` text,
  `content` text NOT NULL,
  `picurl` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `view` bigint(20) DEFAULT '1',
  `totop` smallint(6) DEFAULT '0',
  `torecom` smallint(6) DEFAULT '0',
  `topicrecom` smallint(6) DEFAULT '0',
  `tag` int(11) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `allowcomment` int(11) DEFAULT '1',
  `ispublished` int(11) DEFAULT '0',
  `from` varchar(255) DEFAULT NULL,
  `item` int(11) DEFAULT NULL,
  `like` int(11) DEFAULT '0' COMMENT '喜欢',
  `flag_a` smallint(255) DEFAULT '0',
  `flag_b` smallint(255) DEFAULT '0',
  `flag_c` smallint(255) DEFAULT '0',
  `flag_d` smallint(255) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=423 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of li_article
-- ----------------------------
INSERT INTO `li_article` VALUES ('420', 'Javascript Patterns[Stoyan stefanov]', 'javascript模式阅读笔记', '<h3 id=\"-\">模式</h3>\n<ul>\n<li>设计模式</li>\n<li>编码模式</li>\n<li>反模式</li>\n</ul>\n<h3 id=\"-\">面向对象</h3>\n<p>首先，<code>javascript</code>一切皆对象。</p>\n<p>对象的两种类型：</p>\n<ul>\n<li>原生的（Native）</li>\n</ul>\n<blockquote>\n<p>[info] 独立与宿主环境的<code>ECMAScript</code>实现提供的对象</p>\n</blockquote>\n<ul>\n<li>主机的（Host）</li>\n</ul>\n<blockquote>\n<p>[info] 在主机环境中（如：浏览器）定义的对象</p>\n</blockquote>\n<h3 id=\"-prototype-\">原型（prototype）</h3>\n<p>当我们创建一个函数时，<code>javascript</code>默认给它创建了一个对象属性<code>prototype</code>。<br>这个<code>prototype</code>的属性值是一个对象，默认只有一个<code>constructor</code>的属性，指向所创建的函数本身。</p>\n<pre><code class=\"lang-js\">let Apple = function(){\n\n}\nlet app = new Apple();\nconsole.log(app.__proto__.constructor == Apple);//true\n</code></pre>\n<p>每个对象都有一个隐藏的属性——<code>“__proto__”</code>，这个属性引用了创建这个对象的函数的<code>prototype</code>。</p>\n<h3 id=\"-\">函数声明和函数表达式</h3>\n<ul>\n<li>表达式</li>\n</ul>\n<pre><code class=\"lang-js\">//又名匿名函数\nvar add = function(a,b){\n    return a+b;\n}\nadd.name;// \"\"\n//命名函数表达式，是函数表达式的一种\nvar add = function add(a,b){\n}\n\nadd.name; // \"add\"\n</code></pre>\n<ul>\n<li>函数声明<pre><code class=\"lang-js\">function foo(){\n  //函数主体\n}\nfoo.name; // \"foo\"\n</code></pre>\n</li>\n</ul>\n<h3 id=\"apply-call\">apply与call</h3>\n<h4 id=\"apply\">apply</h4>\n<p>带有两个参数，第一个参数是指定将要绑定到该函数内部<code>this</code>的一个对象；<br>第二个参数是一个数组或多个变量参数，这些参数将变成可用于该函数内部的类似数组的<code>arguments</code>对象。<br>如果第一个参数为<code>null</code>，那么<code>this</code>将指向全局对象。</p>\n<pre><code class=\"lang-js\">Function.apply(obj,args)\n</code></pre>\n<blockquote>\n<p>[info] <code>apply</code>方法能劫持另外一个对象的方法，继承另外一个对象的属性.  </p>\n</blockquote>\n<p>eg:</p>\n<pre><code class=\"lang-js\">//定义一个函数\nfunction App(name){\n  this.name = name;\n  this.created();\n}\n\n//扩展原型\nApp.prototype={\n  created:function(){\n    console.log(`${this.name} has been created!`);\n  },\n  destroy:function(reason){\n    let re = reason || \"no reason\";\n    this.destroy_time = new Date().getTime();\n    console.log(`${this.name} has been destroyed at ${this.destroy_time} for ${re}!`);\n  }\n}\n\nlet app = new App(\'app\');\nconsole.log(app.destroy());//app has been destroyed at 1514355097846 for no reason!\n\nlet test = {\n  name:\'test\'\n}\napp.destroy.apply(test,[\"it is test simple\"]);//test has been destroyed at 1514355097847 for it is test simple!\n</code></pre>\n<p><strong>简单概括就是</strong>：</p>\n<blockquote>\n<p>[danger]  将<code>app.destroy</code>的方法，应用到<code>test</code>对象上，使得<code>test</code>也具有<code>destroy</code>的功能。<br>换句话说，就是为了改变函数体内部 <code>this</code> 的指向</p>\n</blockquote>\n<h4 id=\"call\">call</h4>\n<p><code>call</code>的用法和功能与<code>apply</code>完全一样，只是接收参数不一样。</p>\n<pre><code class=\"lang-js\">Function.call(obj,[param1[,param2[,…[,paramN]]]])\n</code></pre>\n<p>没有参数数量的限制，参数已参数列表的形式传递过来。</p>\n<h4 id=\"-\">应用</h4>\n<ul>\n<li>继承</li>\n</ul>\n<pre><code class=\"lang-js\">function Parent(){\n  this.name = \"parent\";\n  this.age = 18;\n  this.infomation = \"this is a girl\";\n}\n\nlet child = {};\nParent.apply(child);\nconsole.log(child.name)// \"parent\"\n</code></pre>\n<ul>\n<li>获取数组中的最大值</li>\n</ul>\n<pre><code class=\"lang-js\">let array = [1,2,3,3,10,0];\nlet maxVal = Math.max.apply(null,array);\nconsole.log(maxVal);//10\n</code></pre>\n<h4 id=\"-bind\">还有个bind</h4>\n<pre><code class=\"lang-js\">obj.bind(thisObj, arg1, arg2, ...);\n</code></pre>\n<p>把obj绑定到thisObj，这时候thisObj具备了obj的属性和方法。与call和apply不同的是，bind绑定后不会立即执行。</p>\n<pre><code class=\"lang-js\">function add(j, k){\n    return j+k;\n}\n\n\nfunction sub(j, k){\n    return j-k;\n}\n\nadd.bind(sub, 5, 3); //不再返回8\nadd.bind(sub, 5, 3)(); //8\n</code></pre>\n<h3 id=\"curry-\">Curry化（柯里化）</h3>\n<blockquote>\n<p>[info] 柯里化（Currying），又称部分求值（Partial Evaluation），是把接受多个参数的函数变换成接受一个单一参数（最初函数的第一个参数）的函数，并且返回接受余下的参数而且返回结果的新函数的技术。</p>\n</blockquote>\n<p>一个通用柯里化函数：</p>\n<pre><code class=\"lang-js\">let currying = function(fn){\n  let stored_args = [].slice.call(arguments,1);\n  console.log(stored_args);//截取第一个参数\n  return function(){\n    let args = stored_args.concat([].slice.call(arguments));\n    return fn.apply(null,args);\n  }\n}\n\nfunction add(x,y){\n  return x+y;\n}\n\nlet result = currying(add,5)(2);\nconsole.log(result);//7\n</code></pre>\n<blockquote>\n<p>[warning] <code>arguments</code>这个对象还有一个名叫 callee 的属性，该属性是一个指针，指向拥有这个 arguments 对象的函数。</p>\n</blockquote><p><br></p>', '', 'MillZhang', '2018-01-03 18:42:24', '35', '0', '1', '0', '1', 'javascript', '0', '1', '', '3', '0', '0', '0', '0', '0');
INSERT INTO `li_article` VALUES ('421', '备忘（持续更新）', '', '<h3 id=\"-object-freeze-\"><code>Object.freeze()</code></h3>\n<p><code>Object.freeze()</code> 方法可以冻结一个对象，冻结指的是不能向这个对象添加新的属性，不能修改其已有属性的值，不能删除已有属性，以及不能修改该对象已有属性的可枚举性、可配置性、可写性。也就是说，这个对象永远是不可变的。该方法返回被冻结的对象。</p>\n<ul>\n<li>浅冻结</li>\n<li>深冻结</li>\n</ul>\n<blockquote>\n<p><a href=\"https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Object/freeze\">https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Object/freeze</a></p>\n</blockquote>\n<h3 id=\"-object-defineproperty-obj-prop-descriptor-\"><code>Object.defineProperty(obj,prop,descriptor)</code></h3>\n<blockquote>\n<p>直接在一个对象上定义一个新的属性,或者修改一个对象的现有属性,并返回这个对象.</p>\n</blockquote>\n<h4 id=\"-\">参数</h4>\n<ul>\n<li><code>obj</code>:目标对象</li>\n<li><code>prop</code>:待定义或修改的属性名称</li>\n<li><code>descriptor</code>:待定义或修改属性的描述符</li>\n</ul>\n<h4 id=\"-\">示例</h4>\n<pre><code class=\"lang-js\">var bValue;\nvar o = {}; // 创建一个新对象\nObject.defineProperty(o, \"b\", {\n  get : function(){\n    return bValue;\n  },\n  set : function(newValue){\n    bValue = newValue;\n  },\n  enumerable : true,\n  configurable : true,\n  writable:true//为false时代表属性\"不可写\"\n});\n</code></pre>\n<h3 id=\"-iife-\"><code>IIFE</code></h3>\n<p>即<strong>立即执行函数表达式</strong></p>\n<h3 id=\"how-to-convert-a-set-to-an-array-\">How to convert a <code>Set</code> to an <code>Array</code>?</h3>\n<pre><code>let setVal = new Set([\'b\',\'c\',\'b\',\'a\']);\n//1.Array.from\nconsole.log(Array.from(setVal));//[b,c,a]\n//2.spread \nconsole.log([...setVal])\n</code></pre><h3 id=\"js-\">js取随机数</h3>\n<pre><code class=\"lang-js\">Math.random()\n</code></pre>\n<h3 id=\"-arguments-\">函数列表参数<code>arguments</code></h3>\n<p>首先,它是一个类数组对象<code>Array-Like Object</code>,就是拥有<code>length</code>属性,但不能使用数组方法(<code>forEach</code>,<code>map</code>);</p>\n<ul>\n<li>将<code>arguments</code>对象转换为数组对象</li>\n</ul>\n<pre><code>//1\narguments = [].slice.call(arguments);\n//2\narguments = Array.from(arguments)\n//3\n[..arguments]\n</code></pre><ul>\n<li><a href=\"https://segmentfault.com/a/1190000008620953\">链接</a></li>\n</ul>\n<h3 id=\"-commonjs-exports-module-exports-\"><code>commonjs</code>中<code>exports</code>与<code>module.exports</code>的区别</h3>\n<p><code>exports</code>对象是通过形参的方式传入的,直接赋值形参会改变形参的引用,但不能改变作用域外的值.<br>而<code>module.exports</code>不改变形参的</p>\n<hr>', '', '', '2018-01-04 11:15:50', '1', '1', '1', '0', '1', '', '0', '1', '', '1', '0', '0', '0', '0', '0');
INSERT INTO `li_article` VALUES ('422', 'vue集成pdf阅读器', 'pdf.js可以实现在html下直接浏览pdf文档，是一款开源的pdf文档读取解析插件', '<h3 id=\"-\">介绍</h3>\n<p><code>pdf.js</code>可以实现在<code>html</code>下直接浏览pdf文档，是一款开源的<code>pdf</code>文档读取解析插件</p>\n<p><code>pdf.js</code>主要包含两个库文件，一个<code>pdf.js</code>和一个<code>pdf.worker.js</code>，，一个负责<code>API</code>解析，一个负责核心解析</p>\n<ul>\n<li><a href=\"http://oritfw5nq.bkt.clouddn.com/pdf.zip\">下载地址</a></li>\n<li><a href=\"https://github.com/rkusa/pdfjs\">github</a></li>\n</ul>\n<h3 id=\"-\">使用步骤</h3>\n<p>将文件解压到<code>static</code>目录下,在预览页面中使用,使用<code>iframe</code>访问<code>static中web内的viewer.html</code>文件,<code>pdf</code>路径通过参数传递,即可使用该插件访问<code>pdf</code>文件</p>\n<pre><code class=\"lang-html\">   &lt;iframe class=\"pdf-viewer\" :src=\'\"/static/pdf/web/viewer.html?file=http://image.cache.timepack.cn/nodejs.pdf\"\' width=\"50%\" height=\"800\" scrolling=\"no\"&gt;\n      您的浏览器不支持PDF阅读\n    &lt;/iframe&gt;\n</code></pre>\n<h3 id=\"-\">问题</h3>\n<p><code>pdf</code>兼容<code>ie,firefox,chrome</code>等主流的浏览器,故浏览器兼容方面无需担心.然后主要注意的是:</p>\n<ol>\n<li>源码必须放在<code>static</code>目录下作为静态资源引入项目,不然会影响<code>webpack</code>编译;</li>\n<li>访问网络<code>pdf</code>文件存在跨域问题,目前暂时是这样配置:<code>Access-Control-Allow-Origin:*</code></li>\n</ol>\n<h3 id=\"-\">参考</h3>\n<ol>\n<li><a href=\"https://www.cnblogs.com/jacksoft/p/5302587.html\">https://www.cnblogs.com/jacksoft/p/5302587.html</a></li>\n<li><a href=\"https://github.com/lewiscutey/PDF/tree/gh-pages\">https://github.com/lewiscutey/PDF/tree/gh-pages</a></li>\n<li><a href=\"https://github.com/rkusa/pdfjs\">https://github.com/rkusa/pdfjs</a></li>\n<li><a href=\"http://blog.csdn.net/xiao_bin_shen/article/details/77778514\">http://blog.csdn.net/xiao_bin_shen/article/details/77778514</a></li>\n</ol>\n<p>&lt;p class=\"over\"&gt;Over!&lt;/p&gt;</p><p><br></p>', '/static/upload/pics/2018/1/4pBa3zCo0Ey-1UqlmFwLh9KpN.jpg', 'MillZhang', '2018-01-04 12:18:24', '2', '1', '1', '0', '5', '', '0', '1', '', '1', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for li_comment
-- ----------------------------
DROP TABLE IF EXISTS `li_comment`;
CREATE TABLE `li_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) DEFAULT NULL COMMENT '文章id',
  `author` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `qq` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `belongid` int(11) DEFAULT '0' COMMENT '回复的评论id',
  `dig` int(11) DEFAULT '0',
  `tipoff` int(11) DEFAULT '0' COMMENT '举报',
  `createtime` datetime DEFAULT NULL,
  `pic` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '头像',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of li_comment
-- ----------------------------

-- ----------------------------
-- Table structure for li_guest
-- ----------------------------
DROP TABLE IF EXISTS `li_guest`;
CREATE TABLE `li_guest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `contact` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `guest` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of li_guest
-- ----------------------------

-- ----------------------------
-- Table structure for li_item
-- ----------------------------
DROP TABLE IF EXISTS `li_item`;
CREATE TABLE `li_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of li_item
-- ----------------------------
INSERT INTO `li_item` VALUES ('1', '原创');
INSERT INTO `li_item` VALUES ('2', '转载');
INSERT INTO `li_item` VALUES ('3', '笔记');
INSERT INTO `li_item` VALUES ('9', '总结');
INSERT INTO `li_item` VALUES ('10', '资源');

-- ----------------------------
-- Table structure for li_links
-- ----------------------------
DROP TABLE IF EXISTS `li_links`;
CREATE TABLE `li_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `link` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `qq` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `notice` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `flag` varchar(255) COLLATE utf8_bin DEFAULT '0' COMMENT '是否通过',
  `orders` int(255) DEFAULT '0' COMMENT '顺序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of li_links
-- ----------------------------
INSERT INTO `li_links` VALUES ('4', 'IM极客小站', 'www.imenger.cn', 'http://www.imenger.cn/images/favicon.ico', '1193288577', '', '0', '0');
INSERT INTO `li_links` VALUES ('5', 'Magento', 'www.maijindou.com', 'http://www.maijindou.com/sites/all/themes/blend/logo.png', '936100558', '', '0', '0');
INSERT INTO `li_links` VALUES ('13', '前端汇', 'https://www.jsout.com', '', '', null, '1', '0');
INSERT INTO `li_links` VALUES ('16', 'Yii中文网', 'http://www.yii-china.com/', '', '', null, '1', '1');
INSERT INTO `li_links` VALUES ('17', 'laravel学院', 'http://laravelacademy.org/', '', '', null, '1', '2');
INSERT INTO `li_links` VALUES ('18', 'wangEditor', 'http://wangeditor.github.io/', '', '', null, '1', '3');
INSERT INTO `li_links` VALUES ('19', 'Drupal中国', 'http://www.drupalchina.cn/', '', '', null, '1', '4');
INSERT INTO `li_links` VALUES ('20', '麦锐尔', 'http://www.mairuier.com/', '', '', null, '1', '5');
INSERT INTO `li_links` VALUES ('21', '百思伯乐', 'http://blog.bestbole.com/', '', '', null, '1', '6');
INSERT INTO `li_links` VALUES ('22', '爱圈快站', 'http://iquan.kuaizhan.com/', '', '', null, '1', '7');
INSERT INTO `li_links` VALUES ('23', 'IM极客小站', 'http://www.imenger.cn/', '', '', null, '1', '8');
INSERT INTO `li_links` VALUES ('24', '知识林', 'http://www.zslin.com/', '', '', null, '1', '9');
INSERT INTO `li_links` VALUES ('25', 'I/OTechie技术社区', 'http://iotechie.info/', '', '', null, '1', '10');
INSERT INTO `li_links` VALUES ('26', '一起开源', 'http://www.17ky.net/', '', '', null, '1', '11');
INSERT INTO `li_links` VALUES ('27', '猿天地', 'http://www.cxytiandi.com/', '', '', null, '1', '12');
INSERT INTO `li_links` VALUES ('28', 'Falost的小窝', 'http://www.fedte.cc/', '', '', null, '1', '13');
INSERT INTO `li_links` VALUES ('29', '小松博客', 'https://www.phpsong.com/', '', '', null, '1', '14');

-- ----------------------------
-- Table structure for li_manage_permission
-- ----------------------------
DROP TABLE IF EXISTS `li_manage_permission`;
CREATE TABLE `li_manage_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pername` varchar(255) DEFAULT NULL,
  `permission` text,
  `tag` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of li_manage_permission
-- ----------------------------
INSERT INTO `li_manage_permission` VALUES ('1', '新建/编辑文章', 'admin/content/article', '1');
INSERT INTO `li_manage_permission` VALUES ('2', '添加markdown', 'admin/content/addmarkdown', '1');
INSERT INTO `li_manage_permission` VALUES ('3', '文章列表', 'admin/content/index', '1');
INSERT INTO `li_manage_permission` VALUES ('7', '后台首页', 'admin/index/index', '4');
INSERT INTO `li_manage_permission` VALUES ('8', '后台欢迎页', 'admin/index/welcome', '4');
INSERT INTO `li_manage_permission` VALUES ('9', '草稿箱文章列表', 'admin/content/draftlist', '1');
INSERT INTO `li_manage_permission` VALUES ('10', '新增/编辑文章提交接口', 'admin/content/doadd', '1');
INSERT INTO `li_manage_permission` VALUES ('11', '草稿箱发布接口', 'admin/content/updatestatus', '1');
INSERT INTO `li_manage_permission` VALUES ('12', '删除/批量删除文章接口', 'admin/content/delsome', '1');
INSERT INTO `li_manage_permission` VALUES ('13', '上传文章缩略图接口', 'admin/content/upload', '1');
INSERT INTO `li_manage_permission` VALUES ('14', '上传编辑器图片接口', 'admin/content/uploadeditor', '1');
INSERT INTO `li_manage_permission` VALUES ('15', '上传markdown文件及解析接口/内容分页', 'admin/content/uploadfile', '1');
INSERT INTO `li_manage_permission` VALUES ('16', '留言列表', 'admin/guest/index', '5');
INSERT INTO `li_manage_permission` VALUES ('17', '删除/批量留言接口', 'admin/guest/delsome', '5');
INSERT INTO `li_manage_permission` VALUES ('18', '退出后台接口', 'admin/index/logout', '4');
INSERT INTO `li_manage_permission` VALUES ('19', '栏目列表', 'admin/item/index', '6');
INSERT INTO `li_manage_permission` VALUES ('20', '新增/编辑栏目', 'admin/item/item', '6');
INSERT INTO `li_manage_permission` VALUES ('21', '新增/编辑栏目接口', 'admin/item/save', '6');
INSERT INTO `li_manage_permission` VALUES ('22', '删除/批量删除栏目接口', 'admin/item/delsome', '6');
INSERT INTO `li_manage_permission` VALUES ('23', '申请列表', 'admin/links/index', '14');
INSERT INTO `li_manage_permission` VALUES ('24', '删除/批量删除友情链接接口', 'admin/links/delsome', '14');
INSERT INTO `li_manage_permission` VALUES ('25', '导航列表', 'admin/menu/index', '2');
INSERT INTO `li_manage_permission` VALUES ('26', '新增/编辑导航', 'admin/menu/item', '2');
INSERT INTO `li_manage_permission` VALUES ('27', '编辑/新增导航接口', 'admin/menu/save', '2');
INSERT INTO `li_manage_permission` VALUES ('28', '删除/批量删除导航接口', 'admin/menu/delsome', '2');
INSERT INTO `li_manage_permission` VALUES ('29', '权限列表', 'admin/permission/index', '10');
INSERT INTO `li_manage_permission` VALUES ('30', '新增/编辑权限', 'admin/permission/item', '10');
INSERT INTO `li_manage_permission` VALUES ('31', '编辑/新增权限接口', 'admin/permission/save', '10');
INSERT INTO `li_manage_permission` VALUES ('32', '删除/批量删除权限接口', 'admin/permission/delsome', '10');
INSERT INTO `li_manage_permission` VALUES ('33', '权限分类列表', 'admin/pertag/index', '10');
INSERT INTO `li_manage_permission` VALUES ('34', '新增/编辑权限分类', 'admin/pertag/item', '10');
INSERT INTO `li_manage_permission` VALUES ('35', '编辑/新增权限分类接口', 'admin/pertag/save', '10');
INSERT INTO `li_manage_permission` VALUES ('36', '删除/批量删除权限分类接口', 'admin/pertag/delsome', '10');
INSERT INTO `li_manage_permission` VALUES ('37', '角色列表', 'admin/role/index', '10');
INSERT INTO `li_manage_permission` VALUES ('38', '新增/编辑角色', 'admin/role/item', '10');
INSERT INTO `li_manage_permission` VALUES ('39', '新增/编辑角色接口', 'admin/role/save', '10');
INSERT INTO `li_manage_permission` VALUES ('40', '删除/批量删除角色接口', 'admin/role/delsome', '10');
INSERT INTO `li_manage_permission` VALUES ('41', '角色分配权限页', 'admin/role/perlist', '10');
INSERT INTO `li_manage_permission` VALUES ('42', '角色分配权限保存接口', 'admin/role/rolesave', '10');
INSERT INTO `li_manage_permission` VALUES ('43', '标签列表', 'admin/tag/index', '9');
INSERT INTO `li_manage_permission` VALUES ('44', '新增/编辑标签', 'admin/tag/item', '9');
INSERT INTO `li_manage_permission` VALUES ('45', '新增/编辑标签接口', 'admin/tag/save', '9');
INSERT INTO `li_manage_permission` VALUES ('46', '删除/批量删除标签接口', 'admin/tag/delsome', '9');
INSERT INTO `li_manage_permission` VALUES ('47', '用户列表', 'admin/user/index', '8');
INSERT INTO `li_manage_permission` VALUES ('48', '新增/编辑用户', 'admin/user/item', '8');
INSERT INTO `li_manage_permission` VALUES ('49', '新增/编辑用户接口', 'admin/user/save', '8');
INSERT INTO `li_manage_permission` VALUES ('50', '删除/批量删除用户接口', 'admin/user/delsome', '8');
INSERT INTO `li_manage_permission` VALUES ('51', '常规设置', 'admin/system/index', '11');
INSERT INTO `li_manage_permission` VALUES ('52', '常规设置保存接口', 'admin/system/edit', '11');
INSERT INTO `li_manage_permission` VALUES ('53', '评论设置', 'admin/system/setcomment', '11');
INSERT INTO `li_manage_permission` VALUES ('54', '评论设置保存接口', 'admin/system/commentedit', '11');
INSERT INTO `li_manage_permission` VALUES ('55', '管理员列表', 'admin/user/adminlist', '8');
INSERT INTO `li_manage_permission` VALUES ('56', '评论列表', 'admin/comment/index', '12');
INSERT INTO `li_manage_permission` VALUES ('57', '举报列表', 'admin/comment/tiplist', '12');
INSERT INTO `li_manage_permission` VALUES ('58', '主题列表', 'admin/topic/index', '13');
INSERT INTO `li_manage_permission` VALUES ('59', '显示/隐藏主题', 'admin/topic/update', '13');
INSERT INTO `li_manage_permission` VALUES ('60', '主题标签管理', 'admin/topictag/index', '13');
INSERT INTO `li_manage_permission` VALUES ('61', '新增/编辑主题分类', 'admin/topictag/item', '13');
INSERT INTO `li_manage_permission` VALUES ('62', '新增/编辑主题分类接口', 'admin/topictag/save', '13');
INSERT INTO `li_manage_permission` VALUES ('63', '删除/批量删除主题标签接口', 'admin/topictag/delsome', '13');
INSERT INTO `li_manage_permission` VALUES ('64', '链接管理', 'admin/links/list', '14');
INSERT INTO `li_manage_permission` VALUES ('65', '新增/编辑友情链接	', 'admin/links/item', '14');
INSERT INTO `li_manage_permission` VALUES ('66', '新增/编辑友情链接接口', 'admin/links/save', '14');
INSERT INTO `li_manage_permission` VALUES ('67', '显示/隐藏友情链接接口', 'admin/links/upstatus', '14');

-- ----------------------------
-- Table structure for li_manage_role
-- ----------------------------
DROP TABLE IF EXISTS `li_manage_role`;
CREATE TABLE `li_manage_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(255) DEFAULT NULL,
  `rolename` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `pid` text,
  `permission` longtext CHARACTER SET utf8 COLLATE utf8_bin,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of li_manage_role
-- ----------------------------
INSERT INTO `li_manage_role` VALUES ('1', 'superadmin', '超级管理员', '1,2,3,9,10,11,12,13,14,15,25,26,27,28,7,8,18,16,17,19,20,21,22,47,48,49,50,55,43,44,45,46,29,30,31,32,33,34,35,36,37,38,39,40,41,42,51,52,53,54,56,57,58,59,60,61,62,63,23,24,64,65,66,67', 0x61646D696E2F636F6E74656E742F61727469636C652C61646D696E2F636F6E74656E742F6164646D61726B646F776E2C61646D696E2F636F6E74656E742F696E6465782C61646D696E2F636F6E74656E742F64726166746C6973742C61646D696E2F636F6E74656E742F646F6164642C61646D696E2F636F6E74656E742F7570646174657374617475732C61646D696E2F636F6E74656E742F64656C736F6D652C61646D696E2F636F6E74656E742F75706C6F61642C61646D696E2F636F6E74656E742F75706C6F6164656469746F722C61646D696E2F636F6E74656E742F75706C6F616466696C652C61646D696E2F6D656E752F696E6465782C61646D696E2F6D656E752F6974656D2C61646D696E2F6D656E752F736176652C61646D696E2F6D656E752F64656C736F6D652C61646D696E2F696E6465782F696E6465782C61646D696E2F696E6465782F77656C636F6D652C61646D696E2F696E6465782F6C6F676F75742C61646D696E2F67756573742F696E6465782C61646D696E2F67756573742F64656C736F6D652C61646D696E2F6974656D2F696E6465782C61646D696E2F6974656D2F6974656D2C61646D696E2F6974656D2F736176652C61646D696E2F6974656D2F64656C736F6D652C61646D696E2F757365722F696E6465782C61646D696E2F757365722F6974656D2C61646D696E2F757365722F736176652C61646D696E2F757365722F64656C736F6D652C61646D696E2F757365722F61646D696E6C6973742C61646D696E2F7461672F696E6465782C61646D696E2F7461672F6974656D2C61646D696E2F7461672F736176652C61646D696E2F7461672F64656C736F6D652C61646D696E2F7065726D697373696F6E2F696E6465782C61646D696E2F7065726D697373696F6E2F6974656D2C61646D696E2F7065726D697373696F6E2F736176652C61646D696E2F7065726D697373696F6E2F64656C736F6D652C61646D696E2F7065727461672F696E6465782C61646D696E2F7065727461672F6974656D2C61646D696E2F7065727461672F736176652C61646D696E2F7065727461672F64656C736F6D652C61646D696E2F726F6C652F696E6465782C61646D696E2F726F6C652F6974656D2C61646D696E2F726F6C652F736176652C61646D696E2F726F6C652F64656C736F6D652C61646D696E2F726F6C652F7065726C6973742C61646D696E2F726F6C652F726F6C65736176652C61646D696E2F73797374656D2F696E6465782C61646D696E2F73797374656D2F656469742C61646D696E2F73797374656D2F736574636F6D6D656E742C61646D696E2F73797374656D2F636F6D6D656E74656469742C61646D696E2F636F6D6D656E742F696E6465782C61646D696E2F636F6D6D656E742F7469706C6973742C61646D696E2F746F7069632F696E6465782C61646D696E2F746F7069632F7570646174652C61646D696E2F746F7069637461672F696E6465782C61646D696E2F746F7069637461672F6974656D2C61646D696E2F746F7069637461672F736176652C61646D696E2F746F7069637461672F64656C736F6D652C61646D696E2F6C696E6B732F696E6465782C61646D696E2F6C696E6B732F64656C736F6D652C61646D696E2F6C696E6B732F6C6973742C61646D696E2F6C696E6B732F6974656D2C61646D696E2F6C696E6B732F736176652C61646D696E2F6C696E6B732F7570737461747573);
INSERT INTO `li_manage_role` VALUES ('2', 'admin', '管理员', '1,2,3,9,10,11,12,13,14,15,25,26,27,28,7,8,18,16,17,19,20,21,22,23,24,47,43,44,45,46', 0x61646D696E2F636F6E74656E742F61727469636C652C61646D696E2F636F6E74656E742F6164646D61726B646F776E2C61646D696E2F636F6E74656E742F696E6465782C61646D696E2F636F6E74656E742F64726166746C6973742C61646D696E2F636F6E74656E742F646F6164642C61646D696E2F636F6E74656E742F7570646174657374617475732C61646D696E2F636F6E74656E742F64656C736F6D652C61646D696E2F636F6E74656E742F75706C6F61642C61646D696E2F636F6E74656E742F75706C6F6164656469746F722C61646D696E2F636F6E74656E742F75706C6F616466696C652C61646D696E2F6D656E752F696E6465782C61646D696E2F6D656E752F6974656D2C61646D696E2F6D656E752F736176652C61646D696E2F6D656E752F64656C736F6D652C61646D696E2F696E6465782F696E6465782C61646D696E2F696E6465782F77656C636F6D652C61646D696E2F696E6465782F6C6F676F75742C61646D696E2F67756573742F696E6465782C61646D696E2F67756573742F64656C736F6D652C61646D696E2F6974656D2F696E6465782C61646D696E2F6974656D2F6974656D2C61646D696E2F636F6E74656E742F736176652C61646D696E2F6974656D2F64656C736F6D652C61646D696E2F6C696E6B732F696E6465782C61646D696E2F6C696E6B732F64656C736F6D652C61646D696E2F757365722F696E6465782C61646D696E2F7461672F696E6465782C61646D696E2F7461672F6974656D2C61646D696E2F7461672F736176652C61646D696E2F7461672F64656C736F6D65);
INSERT INTO `li_manage_role` VALUES ('3', 'editor', '编辑', '1,2,3,9,10,11,12,13,14,15,7,8,18', 0x61646D696E2F636F6E74656E742F61727469636C652C61646D696E2F636F6E74656E742F6164646D61726B646F776E2C61646D696E2F636F6E74656E742F696E6465782C61646D696E2F636F6E74656E742F64726166746C6973742C61646D696E2F636F6E74656E742F646F6164642C61646D696E2F636F6E74656E742F7570646174657374617475732C61646D696E2F636F6E74656E742F64656C736F6D652C61646D696E2F636F6E74656E742F75706C6F61642C61646D696E2F636F6E74656E742F75706C6F6164656469746F722C61646D696E2F636F6E74656E742F75706C6F616466696C652C61646D696E2F696E6465782F696E6465782C61646D696E2F696E6465782F77656C636F6D652C61646D696E2F696E6465782F6C6F676F7574);
INSERT INTO `li_manage_role` VALUES ('4', 'visitor', '访客', '3,9,25,7,8,18,16,19,23,47,43', 0x61646D696E2F636F6E74656E742F696E6465782C61646D696E2F636F6E74656E742F64726166746C6973742C61646D696E2F6D656E752F696E6465782C61646D696E2F696E6465782F696E6465782C61646D696E2F696E6465782F77656C636F6D652C61646D696E2F696E6465782F6C6F676F75742C61646D696E2F67756573742F696E6465782C61646D696E2F6974656D2F696E6465782C61646D696E2F6C696E6B732F696E6465782C61646D696E2F757365722F696E6465782C61646D696E2F7461672F696E646578);

-- ----------------------------
-- Table structure for li_manage_tag
-- ----------------------------
DROP TABLE IF EXISTS `li_manage_tag`;
CREATE TABLE `li_manage_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of li_manage_tag
-- ----------------------------
INSERT INTO `li_manage_tag` VALUES ('1', '文章管理');
INSERT INTO `li_manage_tag` VALUES ('2', '导航管理');
INSERT INTO `li_manage_tag` VALUES ('4', '基础页面');
INSERT INTO `li_manage_tag` VALUES ('5', '留言管理');
INSERT INTO `li_manage_tag` VALUES ('6', '栏目管理');
INSERT INTO `li_manage_tag` VALUES ('8', '用户管理');
INSERT INTO `li_manage_tag` VALUES ('9', '标签管理');
INSERT INTO `li_manage_tag` VALUES ('10', '权限管理');
INSERT INTO `li_manage_tag` VALUES ('11', '系统设置');
INSERT INTO `li_manage_tag` VALUES ('12', '评论管理');
INSERT INTO `li_manage_tag` VALUES ('13', '社区管理');
INSERT INTO `li_manage_tag` VALUES ('14', '友情链接');

-- ----------------------------
-- Table structure for li_menu
-- ----------------------------
DROP TABLE IF EXISTS `li_menu`;
CREATE TABLE `li_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menuname` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '菜单名',
  `url` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '导航链接',
  `info` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注',
  `appear` int(11) DEFAULT '1',
  `orders` int(255) DEFAULT '0' COMMENT '排序',
  `target` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of li_menu
-- ----------------------------
INSERT INTO `li_menu` VALUES ('1', '首页', '/', '', '0', '1', '1');
INSERT INTO `li_menu` VALUES ('8', '资源下载', '/download.html', null, '0', '3', '0');

-- ----------------------------
-- Table structure for li_system
-- ----------------------------
DROP TABLE IF EXISTS `li_system`;
CREATE TABLE `li_system` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sitename` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `author` char(50) DEFAULT NULL,
  `copyright` varchar(255) DEFAULT NULL,
  `links` text,
  `allowcomment` int(11) DEFAULT '1',
  `tongji` text,
  `theme` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT 'default',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of li_system
-- ----------------------------
INSERT INTO `li_system` VALUES ('1', '前端小阳', '/', '前端，Javascript，CSS，Node，Vue', '前端个人博客', 'MillZhang', '@2018 copyright', '<li><a href=\"http://www.jsout.com\" target=\"_blank\">前端汇</a></li>\n<li><a href=\"http://www.yii-china.com\" target=\"_blank\">Yii中文网</a></li>\n<li><a href=\"http://laravelacademy.org\" target=\"_blank\">laravel学院</a></li>\n<li><a href=\"http://wangeditor.github.io\" target=\"_blank\">wangEditor</a></li>\n<li><a href=\"http://www.drupalchina.cn\" target=\"_blank\">Drupal中国</a></li>\n<li><a href=\"http://www.mairuier.com/\" target=\"_blank\">麦锐尔</a></li>\n<li><a href=\"http://blog.bestbole.com\" target=\"_blank\">百思伯乐</a></li>\n<li><a href=\"http://iquan.kuaizhan.com\" target=\"_blank\">爱圈快站</a></li>\n<li><a href=\"http://www.imenger.cn\" target=\"_blank\">IM极客小站</a></li>\n<li><a href=\"http://www.zslin.com\" target=\"_blank\">知识林</a></li>\n<li><a href=\"http://iotechie.info\" target=\"_blank\">I/OTechie技术社区</a></li>\n<li><a href=\"http://www.17ky.net\" target=\"_blank\">一起开源</a></li>\n<li><a href=\"http://www.cxytiandi.com\" target=\"_blank\">猿天地</a></li>', '0', '<script>\n    var _hmt = _hmt || [];\n    (function() {\n        var hm = document.createElement(\"script\");\n        hm.src = \"//hm.baidu.com/hm.js?8c04fc9ebc7d286e7c03911b6affb970\";\n        var s = document.getElementsByTagName(\"script\")[0];\n        s.parentNode.insertBefore(hm, s);\n    })();\n</script>', 'liblog');

-- ----------------------------
-- Table structure for li_system_comment
-- ----------------------------
DROP TABLE IF EXISTS `li_system_comment`;
CREATE TABLE `li_system_comment` (
  `clientid` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `appcode` text CHARACTER SET utf8,
  `appkey` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `appid` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`,`appid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of li_system_comment
-- ----------------------------
INSERT INTO `li_system_comment` VALUES ('clientId', '<!--高速版-->\n<div id=\"SOHUCS\"></div>\n<script charset=\"utf-8\" type=\"text/javascript\" src=\"http://changyan.sohu.com/upload/changyan.js\" ></script>\n<script type=\"text/javascript\">\n    window.changyan.api.config({\n        appid: \'cysoRJNxO\',\n        conf: \'prod_1fbcbcaf3589e576afe2785fe80d6684\'\n    });\n</script>', 'ce46948884ce9504641c9c97d3171bce', 'cysoRJNxO', '1');

-- ----------------------------
-- Table structure for li_tags
-- ----------------------------
DROP TABLE IF EXISTS `li_tags`;
CREATE TABLE `li_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tagname` varchar(255) DEFAULT NULL,
  `appear` int(11) DEFAULT '1',
  `orders` int(255) DEFAULT '0' COMMENT '显示顺序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of li_tags
-- ----------------------------
INSERT INTO `li_tags` VALUES ('1', 'Javascript', '1', '0');
INSERT INTO `li_tags` VALUES ('2', 'css', '1', '1');
INSERT INTO `li_tags` VALUES ('3', 'html', '1', '2');
INSERT INTO `li_tags` VALUES ('4', 'jquery', '1', '3');
INSERT INTO `li_tags` VALUES ('5', 'vue', '1', '4');
INSERT INTO `li_tags` VALUES ('6', 'webpack', '1', '5');
INSERT INTO `li_tags` VALUES ('7', 'nodejs', '1', '6');
INSERT INTO `li_tags` VALUES ('8', 'http', '1', '7');
INSERT INTO `li_tags` VALUES ('9', '面试', '1', '0');
INSERT INTO `li_tags` VALUES ('10', '前端工具', '1', '8');

-- ----------------------------
-- Table structure for li_topic
-- ----------------------------
DROP TABLE IF EXISTS `li_topic`;
CREATE TABLE `li_topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item` varchar(255) DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin COMMENT '内容',
  `author` varchar(255) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '标题',
  `view` bigint(20) DEFAULT '1' COMMENT '点击数',
  `updatetime` datetime DEFAULT NULL,
  `updateauthor` varchar(255) DEFAULT NULL,
  `updatepic` varchar(255) DEFAULT NULL,
  `replycount` int(11) DEFAULT '0' COMMENT '回复数',
  `show` smallint(255) DEFAULT '1' COMMENT '是否显示',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of li_topic
-- ----------------------------

-- ----------------------------
-- Table structure for li_topic_comment
-- ----------------------------
DROP TABLE IF EXISTS `li_topic_comment`;
CREATE TABLE `li_topic_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(255) NOT NULL,
  `tid` bigint(20) DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '主题标题',
  `createtime` datetime DEFAULT NULL,
  `pic` varchar(255) DEFAULT '' COMMENT '回复者头像',
  `like` bigint(20) DEFAULT '0',
  `comment` longtext CHARACTER SET utf8 COLLATE utf8_bin,
  `likers` text,
  `oldcomment` longtext CHARACTER SET utf8 COLLATE utf8_bin,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of li_topic_comment
-- ----------------------------

-- ----------------------------
-- Table structure for li_topic_item
-- ----------------------------
DROP TABLE IF EXISTS `li_topic_item`;
CREATE TABLE `li_topic_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `comment` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of li_topic_item
-- ----------------------------

-- ----------------------------
-- Table structure for li_user
-- ----------------------------
DROP TABLE IF EXISTS `li_user`;
CREATE TABLE `li_user` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `role` int(255) DEFAULT '4',
  `openid` varchar(255) DEFAULT NULL COMMENT '第三方登录标识',
  `pic` varchar(255) DEFAULT '' COMMENT '头像',
  `way` varchar(255) DEFAULT 'site' COMMENT '登录方式',
  `point` varchar(255) DEFAULT '10' COMMENT '积分',
  `sign` text COMMENT '个性签名',
  `createtime` datetime DEFAULT NULL,
  `level` int(11) DEFAULT '1' COMMENT '等级',
  `vip` int(11) DEFAULT '0' COMMENT 'vip',
  `isverify` int(11) DEFAULT '0' COMMENT '是否已验证邮箱',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of li_user
-- ----------------------------
INSERT INTO `li_user` VALUES ('56', 'admin', 'admin', 'f6e39087993c9038e6bd16c6506d6c1c', '876753183@qq.com', '1', null, 'common/images/pic/avatar_7.jpg', 'site', '15', null, '2016-08-22 14:44:32', '1', '0', '0');

-- ----------------------------
-- Table structure for li_user_collect
-- ----------------------------
DROP TABLE IF EXISTS `li_user_collect`;
CREATE TABLE `li_user_collect` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL COMMENT '类型',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `aid` int(11) DEFAULT NULL COMMENT '文章id',
  `iscollect` int(11) DEFAULT '1' COMMENT '是否收藏',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of li_user_collect
-- ----------------------------
