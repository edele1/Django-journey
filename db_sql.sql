
-- Table: app_category
CREATE TABLE app_category ( 
    id     INTEGER        PRIMARY KEY AUTOINCREMENT
                          NOT NULL,
    name   VARCHAR( 64 )  NOT NULL,
    [desc] TEXT           NOT NULL 
);

INSERT INTO [app_category] ([id], [name], [desc]) VALUES (1, '3A级景点', '3A级景点');
INSERT INTO [app_category] ([id], [name], [desc]) VALUES (2, '4A级景点', '4A级景点');
INSERT INTO [app_category] ([id], [name], [desc]) VALUES (3, '5A级景点', '5A级景点');

-- Table: app_user
CREATE TABLE app_user ( 
    id        INTEGER         PRIMARY KEY AUTOINCREMENT
                              NOT NULL,
    name      VARCHAR( 128 )  NOT NULL
                              UNIQUE,
    password  VARCHAR( 256 )  NOT NULL,
    email     VARCHAR( 254 )  NOT NULL,
    sex       VARCHAR( 30 )   NOT NULL,
    last_time DATETIME,
    crt_time  DATETIME        NOT NULL 
);

INSERT INTO [app_user] ([id], [name], [password], [email], [sex], [last_time], [crt_time]) VALUES (1, 'test', 123456, 'test@163.com', 'male', '2020-04-22 09:51:09.979227', '2020-03-07 02:27:04.982094');
INSERT INTO [app_user] ([id], [name], [password], [email], [sex], [last_time], [crt_time]) VALUES (2, 'test1', 123456, '12345@163.com', 'male', '2020-06-01 09:03:10.200152', '2020-03-07 13:41:19.125938');
INSERT INTO [app_user] ([id], [name], [password], [email], [sex], [last_time], [crt_time]) VALUES (3, 'test2', 123456, 'test2@163.com', 'male', '2020-06-01 09:03:10.200152', '2020-03-08 07:48:21.109186');

-- Table: app_product
CREATE TABLE app_product ( 
    id          INTEGER          PRIMARY KEY AUTOINCREMENT
                                 NOT NULL,
    name        VARCHAR( 100 )   NOT NULL,
    category_id INTEGER          REFERENCES app_category ( id ),
    headImg     VARCHAR( 1000 )  NOT NULL,
    address     VARCHAR( 500 )   NOT NULL,
    price       INTEGER          NOT NULL,
    content     TEXT,
    openTime    VARCHAR( 100 )   NOT NULL 
);

INSERT INTO [app_product] ([id], [name], [category_id], [headImg], [address], [price], [content], [openTime]) VALUES (1, '田子坊', 1, '2020/04/22/tianzifang_.jpg', '上海市黄浦区泰康路210弄', 0, '田子坊简介：
　　唯一特性：无论是招牌还是商品，每家店铺都极力展现只属于自己的风格，目的就是为了突出“唯一”特性。在这里，你可以缓下脚步、放慢节奏，静静地聆听店主跟你叙述每一件得意之作的渊源与故事。 　　泰康路原是打浦桥地区的一条小街，1998年前这里还是一个马路集市，自1998年政府市政改造后，一些艺术家和工作室陆续入驻这里。经过把泰康路的重新铺设，使原来下雨一地泥，天晴一片尘的马路焕然一新。

　　田子坊是由上海特有的石库门建筑群改建后形成的时尚地标性创意产业聚集区，也是不少艺术家的创意工作基地，人们往往将她称为“新天地第二”。实际上，除了同样时尚外，她与新天地有着很多不同之处。

　　田子坊展现给人们的更多的是上海亲切、温暖和嘈杂的一面。只要你在这条如今上海滩最有味道的弄堂里走一走，就不难体会田子坊与众不同的个性了。走在田子坊，迂回穿行在迷宫般的弄堂里，一家家特色小店和艺术作坊就这样在不经意间跳入你的视线。从茶馆、露天餐厅、露天咖啡座、画廊、家居摆设到手工艺品，以及众多沪上知名的创意工作室，可谓应有尽有。', '全天开放，营业时间一般是10:00-21:00左右');
INSERT INTO [app_product] ([id], [name], [category_id], [headImg], [address], [price], [content], [openTime]) VALUES (2, '上海豫园', 2, '2020/04/22/yuyuan.jpg', '上海市黄浦区安仁街132号(城隍庙内)', 135, '"门票·开放时间：
　　豫园园林门票：旺季（每年4月1日至6月30日，9月1日至11月30日）40元。淡季30元。中小学生、1.4米以下儿童每位10元。　　08:45-16:15；16：45清场
交通概况：
　　地铁10号线豫园站、地铁14号线豫园站、11、26、64、66、715、920、926、929、930等公交车可到。
豫园是著名的江南古典园林，全国重点文物保护单位。豫园始建于明嘉靖年间，有明代四川布政使潘允端所建，至今已有400多年的历史。1853年上海小刀会起义时，豫园点春堂曾作为起义军的城北指挥部，现堂内陈列着当年小刀会的武器、自铸的钱币，以及发布的文告等文物。解放后政府对豫园进行了大规模的修缮，1961年正式对外开放。

静观大厅 亦称“晴雪堂”,是内园主要厅堂,造得雕栋画梁,轩昂高敞。堂面阔5间,进深3间,厅前有两尊石狮,厅内有“静观”和“灵沼峙”两块贴金匾额。静观之名,取古语“静观万物皆自得”,“动观流水静观山”之意。大厅对面奇峰林立,堆叠多姿,或如三官献寿,或如白鹿望月,或如蝙蝠飞舞,或如九狮盘球。据说静静观之,能辨出100多种动物形象。石峰间有许多百年古树。静观东面一小院落,中有池水一泓,两侧曲廊回绕,树荫蔽日,修竹潇洒挺拔,环境幽深。

观涛楼 位于静观大厅西南侧,又称“小灵台”,三层全木结构,高10余丈,清时为城东最高建筑物。昔年在此登高可观赏“沪城八景”之一“黄浦秋涛”。

还云楼、延清楼 面对静观大厅,东西相连,为串楼形,并可通向观涛楼和船厅,还云楼内横匾“还云”,为清末上海名绅姚文?题识。还云楼原为上海钱业公所产业,豫园、内园屡遭战火破坏,而此楼却免遭劫,大有“手挥丝桐,目送还云,西山爽气,在我袖中”之感。

耸翠亭 耸立于观涛楼东面假山上,双层亭阁,底层置石桌、石凳,周围林木青翠。亭内一匾“灵木披芳”。

可以观 位于静观大厅东,小型方厅,精致幽静,炎夏时分外凉爽。厅前有砖雕《郭子仪上寿图》,旁有泥塑龙墙,北接“洞天福地”凤凰亭,南连“别有天”,墙上有《重修内园记》等石碑,记载内园历史。"', '08:45-16:15；16：45清场');
INSERT INTO [app_product] ([id], [name], [category_id], [headImg], [address], [price], [content], [openTime]) VALUES (3, '上海欢乐谷', 2, '2020/04/22/huanlegu.jpg', '上海市松江区佘山林湖路888号', 198, '门票·开放时间：
　　豫园园林门票：旺季（每年4月1日至6月30日，9月1日至11月30日）40元。淡季30元。中小学生、1.4米以下儿童每位10元。　　08:45-16:15；16：45清场
交通概况：
　　地铁10号线豫园站、地铁14号线豫园站、11、26、64、66、715、920、926、929、930等公交车可到。
豫园是著名的江南古典园林，全国重点文物保护单位。豫园始建于明嘉靖年间，有明代四川布政使潘允端所建，至今已有400多年的历史。1853年上海小刀会起义时，豫园点春堂曾作为起义军的城北指挥部，现堂内陈列着当年小刀会的武器、自铸的钱币，以及发布的文告等文物。解放后政府对豫园进行了大规模的修缮，1961年正式对外开放。

静观大厅 亦称“晴雪堂”,是内园主要厅堂,造得雕栋画梁,轩昂高敞。堂面阔5间,进深3间,厅前有两尊石狮,厅内有“静观”和“灵沼峙”两块贴金匾额。静观之名,取古语“静观万物皆自得”,“动观流水静观山”之意。大厅对面奇峰林立,堆叠多姿,或如三官献寿,或如白鹿望月,或如蝙蝠飞舞,或如九狮盘球。据说静静观之,能辨出100多种动物形象。石峰间有许多百年古树。静观东面一小院落,中有池水一泓,两侧曲廊回绕,树荫蔽日,修竹潇洒挺拔,环境幽深。

观涛楼 位于静观大厅西南侧,又称“小灵台”,三层全木结构,高10余丈,清时为城东最高建筑物。昔年在此登高可观赏“沪城八景”之一“黄浦秋涛”。

还云楼、延清楼 面对静观大厅,东西相连,为串楼形,并可通向观涛楼和船厅,还云楼内横匾“还云”,为清末上海名绅姚文?题识。还云楼原为上海钱业公所产业,豫园、内园屡遭战火破坏,而此楼却免遭劫,大有“手挥丝桐,目送还云,西山爽气,在我袖中”之感。

耸翠亭 耸立于观涛楼东面假山上,双层亭阁,底层置石桌、石凳,周围林木青翠。亭内一匾“灵木披芳”。

可以观 位于静观大厅东,小型方厅,精致幽静,炎夏时分外凉爽。厅前有砖雕《郭子仪上寿图》,旁有泥塑龙墙,北接“洞天福地”凤凰亭,南连“别有天”,墙上有《重修内园记》等石碑,记载内园历史。', '08:45-16:15；16：45清场');
INSERT INTO [app_product] ([id], [name], [category_id], [headImg], [address], [price], [content], [openTime]) VALUES (4, '犹太难民纪念馆', 1, '2020/04/22/youtai.jpg', '上海市杨浦区长阳路62号', 50, '门票·开放时间：
50元
①免费政策：儿童身1.3米以下免票；离休干部、退役军人、残疾人（凭有效身份证件）免票。
②优惠政策：学生凭学生证购学生票。9:00—17:00（16:30截止入馆）
交通概况：
1. 远洋宾馆→沿霍山路往东→霍山公园→美犹联合救济委员会旧址(霍山公园对面)→沿霍山路向东→保定路→沿保定路向北→长阳路向西→临潼路(石库门住宅)→回长阳路往西→犹太难民收容所旧址→舟山路(昔日犹太人住宅)→返回长阳路→上海犹太难民纪念馆 
2. 上海犹太难民纪念馆→舟山路(昔日犹太人住宅)→美犹联合救济委员会旧址(霍山公园对面)→霍山公园


犹太难民纪念馆简介：
据上海犹太难民纪念馆陈俭介绍，以俄罗斯犹太人为主建立的上海犹太宗教公会是当时上海最大的犹太人社团，长期设在摩西会堂内(1941年迁至拉都路会堂)，为当时的犹太难民提供了重要的精神支柱。另外一个重要的组织犹太复国青年组织“贝塔”总部亦曾设在此处。今天，命名为“犹太难民在上海纪念馆”的摩西会堂已成为整个上海关于犹太难民历史和实物资料最为齐全的地方，成为犹太人到上海的必访之处。

上海犹太难民纪念馆主体建筑为三层青砖墙面，水平向带状红砖作为装饰，门窗上饰有传统式样的拱券，山字形入口具有些许犹太建筑的特色。大门上方则是犹太教的标志“大卫星”。建筑风格朴素稳重，室内楼梯扶手雕饰精美。

摩西会堂旧址是上海仅存的两座犹太会堂旧址之一，二战期间是在沪犹太难民们经常聚会和举行宗教仪式的场所，现已恢复为1928年作为犹太会堂时的建筑风貌，内部结构也根据图纸进行了调整，此建筑图纸的复制品现被安置于一楼。三楼设有游客签名仪、犹太难民数据库和视频节目等。二号展示厅内容丰富的短片配合情景雕塑、圆雕和油画等艺术品，生动再现了犹太难民在上海的这段历史，此外还展有难民护照和上海犹太早报等实物复制品、刻有拉宾题词的大型石片等。历史学家和艺术家的携手努力，使这一展厅令观众流连忘返。三号展示厅经常有各种主题新颖的展览在此展出。', '9:00—17:00（16:30截止入馆');
INSERT INTO [app_product] ([id], [name], [category_id], [headImg], [address], [price], [content], [openTime]) VALUES (5, '东方明珠', 3, '2020/04/22/dongf1.jpg', '中国上海浦东区世纪大道1号', 198, '门票·开放时间：
成人观光B票:160元
旋转餐厅自助午餐+东方明珠上球体+下球体参观+历史陈列馆：300元
A.免票政策：现役军人凭有效证件可免费参观东方明珠上球体+陈列馆；
观光、旋转餐厅儿童1米（含）以下免票；
游船儿童1.2米（含）以下免票
B.优惠政策：70岁以上老人凭有效证件购景区优惠票。8:00-19:30
交通概况：
乘车路线： 
①上海火车站：地铁1号线【上海火车站】 (莘庄方向)坐3站，【人民广场】换乘地铁2号线（浦东国际机场方向）坐2站 ，【陆家嘴】下车1号口出（约30分钟） 
②虹桥火车站：地铁2号线【虹桥火车站】 (浦东国际机场方向)坐12站，【陆家嘴】下车1号口出（约50分钟） 
③虹桥机场：地铁10号线【上海虹桥机场】 (虹桥火车站方向)坐1站，【虹桥2号航站楼】换乘地铁2号线（浦东国际机场方向）坐11站，【陆家嘴】下车1号口出（约1小时10分钟） 
④浦东国际机场：地铁2号线【浦东国际机场】 (徐泾东方向)坐16站，【陆家嘴】下车1号口出（约1小时10分钟）
东方明珠简介：
上海东方明珠广播电视塔座落于上海黄浦江畔、浦东陆家嘴嘴尖，以其468米的绝对高度成为亚洲第一、世界第三之高塔。东方明珠塔卓然秀立于陆家嘴地区现代化建筑楼群，与隔江的外滩万国建筑博览群交相辉映，展现了国际大都市的壮观景色。东方明珠塔集观光餐饮、购物娱乐、浦江游览、会务会展、历史陈列、旅行代理等服务功能于一身，成为上海标志性建筑和旅游热点之一。

东方明珠塔十一个大小不一、错落有致的球体晶莹夺目，从蔚蓝的天空串联到如茵的草地，描绘出一幅“大珠小珠落玉盘”的如梦画卷。东方明珠塔凭借其穿梭于三根直径9米的擎天立柱之中的高速电梯，以及悬空于立柱之间的世界首部360度全透明三轨观光电梯，让每一位游客充分领略现代技术带来的无限风光。

东方明珠塔各观光层柜台里1000多款造型独特、制作精美的各式旅游纪念品琳琅满目，令人目不暇接、留连忘返。东方明珠塔每年接待来自于五洲四海中外宾客 280 多万人次，是集观光、餐饮、购物、娱乐、游船、会展、历史陈列、广播电视发射等多功能于一体的综合性旅游文化景点。东方明珠塔业已成为上海的标志性建筑，荣列上海十大新景观之一。作为全国旅游热点之一，东方明珠塔又以其优质服务，在 2001 年初被 国家旅游局评为全国首批 AAAA 级旅游景点。', '8:00-19:30');
INSERT INTO [app_product] ([id], [name], [category_id], [headImg], [address], [price], [content], [openTime]) VALUES (6, '迪士尼乐园', 3, '2020/04/22/disni.jpg', '上海市浦东新区川沙新镇上海迪士尼度假区', 78, '门票·开放时间：
开放时间：08:00-22:00 
平日门票价格：成人：370元起、儿童：280元起；
高峰期门票价格：成人：499元起、儿童：375元起。
（以上仅供参考，实际以景区当天为准。请于游览当天至景区取乐园时间表）8:00至22:00
交通概况：
地铁：搭乘上海地铁11号线前往目的地迪士尼站——从1号口出距离上海迪士尼乐园、迪士尼小镇约十分钟路程；
公交车：可乘坐公交车前往上海迪士尼度假区，免去了开车寻路和停车找车位这些烦恼；
私家车：驱车前往上海迪士尼度假区，白天可把车停放在位置优越的停车场，距离上海迪士尼乐园、迪士尼小镇和度假区内的酒店仅举步之遥；
出租车：便捷的出租车，能将您送往坐落于上海迪士尼度假区中心地区的交通枢纽。从交通枢纽出发，即可步行前往上海迪士尼乐园、迪士尼小镇及星愿公园', '8:00至22:00');
INSERT INTO [app_product] ([id], [name], [category_id], [headImg], [address], [price], [content], [openTime]) VALUES (7, '大观园', 2, '2020/04/22/daguanyuan.jpg', '上海青浦区青商公路701号', 60, '"门票·开放时间：
欣欣成人门票价：42元起（省18元）；
欣欣学生门票价：28元起（省8元）；
特惠政策：
A.免费政策：1.3米（不含）以下儿童免票；现役军官、残疾人证、老干部证免票。
B.优惠政策：60(含）周岁以上老人持身份证可享优惠（上述优惠政策，需到景区自行购买）。旺季(4月-10月)8:00-17:00；淡季(11月～3月)8:00-16:30
交通概况：
自驾路线：1、上海方向→上海大观园：
上海—G50（沪渝）高速—金泽出口下—右转沿318国道直行—金商公路—大观园 
2、南京方向→上海大观园：
南京—沪宁高速—苏嘉杭高速—G50（沪渝）高速—金泽出口下—右转沿318国道直行—金商公路—大观园 
3、杭州方向→上海大观园：
杭州—沪杭高速—乍嘉苏高速—G50（沪渝）高速—金泽出口下—右转沿318国道直行—金商公路—大观园 
4、苏州方向→上海大观园：
苏州—东方大道—苏同黎公路—同周公路—往周庄方向—秀海路直行——往商塌方向—商周公路—金商公路—大观园 
公共交通： 公交：
1、上海火车站→上海大观园
地铁1号线到人民广场普安路（坐公交）沪朱线到青浦转青商线可到达； 
2、上海机场→上海大观园
地铁2号线到徐泾东乘公交朱徐线到朱家角转青商线可到达； 
3、上海市中心→上海大观园
普安路（坐公交）沪朱线到青浦转青商线可到达。"', '旺季(4月-10月)8:00-17:00；淡季(11月～3月)8:00-16:30');
INSERT INTO [app_product] ([id], [name], [category_id], [headImg], [address], [price], [content], [openTime]) VALUES (8, '上海野生动物园', 3, '2020/04/22/yesheng.jpg', '上海市浦东新区南六公路178号', 198, '门票·开放时间：
欣欣价-成人票价：138元起（省30元）；包含门票和老虎扑食
欣欣价-学生票价：65元起
A.免票政策：
①儿童身高1.3米（含）以下免票；
②残疾人、现役军人、伤残军人、军队离退休干部、烈士家属凭有效证件至景区登记免票。
B.优惠政策：
①全日制大学本科及以下学历学生需凭有效学生证购买学生票；
②60周岁以上（含）老人凭有效证件可至上海野生动物园购买优惠门票。淡季（12月-2月）8:30-16:30（15:30停止换票）； 旺季（3月-11月）8:00-17:00（16:00停止换票）。
交通概况：
一、市内自驾车线路
1、市区--南浦大桥--龙阳路--沪南公路--南六公 路；
2、市区--南浦大桥--龙阳路--罗山路--外环线(A20公路)--迎宾大道(A1公路)--南六公路。
二、外地自驾车推荐线路
1、G42（沪宁高速）或沿江高速--G15--S32（申嘉湖 高速）--南六出入口下，南六公路向南开3.8千米到达上海野生动物园；
2、G42（沪宁高速）或沿 江高速--中环线--翔殷路隧道--五洲大道--S20（外环线）--S1（浦东机场方向），南六出入口下，直走 10公里到达上海野生动物园；
3、自驾车-G60（A8）：松江出口沿嘉松公路向北到沈砖公路向西行百米。
三、最新交通信息：
1、轨交线路：地铁16号线，野生动物园站
沿途停靠：罗山路站、周浦东站、鹤沙航城站、航头东站、新场站、野生动物园站；
2、惠南6路：首班车：06:42 末班车：1 9：00
沿途停靠：地铁16号线野生动物园站、航三路（施桥）、野生动物园；
3、南新线： 首班车：5：30 末班车：1 9：00(每班间隔1 0分钟)
沿途停靠：新客站(西南出口)、南浦大桥、北蔡、周浦、六灶、野生动物园；
4、张南线： 张南线：首班车：6：30 末班车：1 9：00(每班间隔10分钟)
沿途停靠：地铁2号线张江出口、建桥大学、六灶、野生动物园；
5、沪南线（在薛家宅转南新线即到野生动物园）：沪南线：首班车：4：45 末班车：1 9：00(每班间隔1 0分钟)
沿途停靠：东昌路、北蔡、周浦、航头、新场、薛家宅。', '淡季（12月-2月）8:30-16:30');
INSERT INTO [app_product] ([id], [name], [category_id], [headImg], [address], [price], [content], [openTime]) VALUES (9, '鲁迅公园', 1, '2020/04/22/luxun_XOUZcdV.jpg', '中国上海东江湾路146号', 30, '上海鲁迅公园简介：
鲁迅公园，位于上海市虹口区东江湾路146号。

历史

清朝光绪二十二年（1896年），上海公共租界工部局在界外的北四川路底购得农田237.288亩，在此圈地筹建万国商团打靶场，由英国园艺设计师，根据英国格拉斯哥体育公园模式，建成“虹口娱乐场”。1905年改建为虹口体育游戏场和打靶场。1922年改名为“虹口公园”。

虹口公园开了上海乃至中国现代体育运动的风气之先。作为大型综合性体育公园，园内共有1个九孔高尔夫球场，75片草地网球场，8片硬地网球场，3片足球场，5片草地滚球场，还有曲棍球篮球、棒球、田径等场地。根据工部局统计，民国24年（1935年），租界外侨总共才3.8万人，而仅在虹口公园一处直接参加体育活动的就达86103人次，在虹口公园打高尔夫球还要排队。

1932年4月29日，在这里发生了虹口公园爆炸案。日军在虹口公园举行庆祝天皇诞生日的天长节大会。会间，韩国临时政府派独立党党员尹奉吉在主席台旁引爆炸弹，当场炸死日本上海派遣军司令白川义则、居留团团长河端贞次等，日本公使重光葵、总领事村井仓松等均被炸成重伤，极大地震动了日本侵略军。至今园中还有尹奉吉义士的纪念亭。

民国26年（1937年）八一三事变，公园部分建筑遭破坏，工部局面对日本势力的扩张，步步退缩，公园及靶场的建筑物被日军蚕食，到民国31年（1942年）9月，万国商团解散，靶场及公园全部被日军占领作为军用场地。1945年后改名为“中正公园”。1950年改回“虹口公园”。

1927年，鲁迅从广州搬来上海，居住在虹口公园附近的大陆新村，直至去世。鲁迅生前一直来公园散步。1956年，鲁迅的灵枢由万国公墓迁此，并建鲁迅纪念亭、鲁迅纪念馆等。1988年改名为“鲁迅公园”。', '9：00－16：00');
INSERT INTO [app_product] ([id], [name], [category_id], [headImg], [address], [price], [content], [openTime]) VALUES (10, '上海豫园', 2, '2020/04/22/yuyuan.jpg', '上海市黄浦区安仁街132号(城隍庙内)', 70, '门票·开放时间：
　　豫园园林门票：旺季（每年4月1日至6月30日，9月1日至11月30日）40元。淡季30元。中小学生、1.4米以下儿童每位10元。　　08:45-16:15；16：45清场
交通概况：
　　地铁10号线豫园站、地铁14号线豫园站、11、26、64、66、715、920、926、929、930等公交车可到。
豫园是著名的江南古典园林，全国重点文物保护单位。豫园始建于明嘉靖年间，有明代四川布政使潘允端所建，至今已有400多年的历史。1853年上海小刀会起义时，豫园点春堂曾作为起义军的城北指挥部，现堂内陈列着当年小刀会的武器、自铸的钱币，以及发布的文告等文物。解放后政府对豫园进行了大规模的修缮，1961年正式对外开放。

静观大厅 亦称“晴雪堂”,是内园主要厅堂,造得雕栋画梁,轩昂高敞。堂面阔5间,进深3间,厅前有两尊石狮,厅内有“静观”和“灵沼峙”两块贴金匾额。静观之名,取古语“静观万物皆自得”,“动观流水静观山”之意。大厅对面奇峰林立,堆叠多姿,或如三官献寿,或如白鹿望月,或如蝙蝠飞舞,或如九狮盘球。据说静静观之,能辨出100多种动物形象。石峰间有许多百年古树。静观东面一小院落,中有池水一泓,两侧曲廊回绕,树荫蔽日,修竹潇洒挺拔,环境幽深。

观涛楼 位于静观大厅西南侧,又称“小灵台”,三层全木结构,高10余丈,清时为城东最高建筑物。昔年在此登高可观赏“沪城八景”之一“黄浦秋涛”。

还云楼、延清楼 面对静观大厅,东西相连,为串楼形,并可通向观涛楼和船厅,还云楼内横匾“还云”,为清末上海名绅姚文?题识。还云楼原为上海钱业公所产业,豫园、内园屡遭战火破坏,而此楼却免遭劫,大有“手挥丝桐,目送还云,西山爽气,在我袖中”之感。

耸翠亭 耸立于观涛楼东面假山上,双层亭阁,底层置石桌、石凳,周围林木青翠。亭内一匾“灵木披芳”。

可以观 位于静观大厅东,小型方厅,精致幽静,炎夏时分外凉爽。厅前有砖雕《郭子仪上寿图》,旁有泥塑龙墙,北接“洞天福地”凤凰亭,南连“别有天”,墙上有《重修内园记》等石碑,记载内园历史。', '08:45-16:15；16：45清场');
INSERT INTO [app_product] ([id], [name], [category_id], [headImg], [address], [price], [content], [openTime]) VALUES (11, '上海欢乐谷', 2, '2020/04/22/huanlegu.jpg', '上海市松江区佘山林湖路888号', 50, '门票·开放时间：
欣欣价-年卡票价：468元起； 
欣欣价-老年票价：110元起（省10元）。 
日场免票政策： 
①儿童身高1.2米(含)以下的免票；
②70周岁(含)以上老年人凭本人有效证件免票。
日场优惠政策：
①65周岁（含）-69周岁（含）的老人凭本人有效证件购票110元；
②儿童身高1.2米（不含）至1.5米(含)购票110元。
夜场优惠人群：
①儿童身高1.2米(不含)以下免票；
②年龄在70周岁以上（含）的老人凭有效证件或上海市老年优待证免费入园。日场9:00-21:00 ； 夜场17:30-21:00；最晚入园时间：20:00
交通概况：
自驾车线路
自驾车-G60（A8）：松江出口沿嘉松公路向北到沈砖公路向西行百米；
自驾车-G50（A9）：赵巷佘山出口沿嘉松公路向南走到沈砖公路向西行百米；
自驾车-G15（A5）：莘砖公路出口沿莘砖公路向西行至嘉松公路口继续西行百米。
地铁：地铁九号线佘山站下车，过街至欢乐谷接驳站搭乘公园班车。', '日场9:00-21:00 ； 夜场17:30-21:00；最晚入园时间：20:00');
INSERT INTO [app_product] ([id], [name], [category_id], [headImg], [address], [price], [content], [openTime]) VALUES (12, '迪士尼乐园', 3, '2020/04/22/disni.jpg', '中国上海浦东区世纪大道1号', 198, '门票·开放时间：
成人观光B票:160元
旋转餐厅自助午餐+东方明珠上球体+下球体参观+历史陈列馆：300元
A.免票政策：现役军人凭有效证件可免费参观东方明珠上球体+陈列馆；
观光、旋转餐厅儿童1米（含）以下免票；
游船儿童1.2米（含）以下免票
B.优惠政策：70岁以上老人凭有效证件购景区优惠票。8:00-19:30
交通概况：
乘车路线： 
①上海火车站：地铁1号线【上海火车站】 (莘庄方向)坐3站，【人民广场】换乘地铁2号线（浦东国际机场方向）坐2站 ，【陆家嘴】下车1号口出（约30分钟） 
②虹桥火车站：地铁2号线【虹桥火车站】 (浦东国际机场方向)坐12站，【陆家嘴】下车1号口出（约50分钟） 
③虹桥机场：地铁10号线【上海虹桥机场】 (虹桥火车站方向)坐1站，【虹桥2号航站楼】换乘地铁2号线（浦东国际机场方向）坐11站，【陆家嘴】下车1号口出（约1小时10分钟） 
④浦东国际机场：地铁2号线【浦东国际机场】 (徐泾东方向)坐16站，【陆家嘴】下车1号口出（约1小时10分钟）
东方明珠简介：
上海东方明珠广播电视塔座落于上海黄浦江畔、浦东陆家嘴嘴尖，以其468米的绝对高度成为亚洲第一、世界第三之高塔。东方明珠塔卓然秀立于陆家嘴地区现代化建筑楼群，与隔江的外滩万国建筑博览群交相辉映，展现了国际大都市的壮观景色。东方明珠塔集观光餐饮、购物娱乐、浦江游览、会务会展、历史陈列、旅行代理等服务功能于一身，成为上海标志性建筑和旅游热点之一。

东方明珠塔十一个大小不一、错落有致的球体晶莹夺目，从蔚蓝的天空串联到如茵的草地，描绘出一幅“大珠小珠落玉盘”的如梦画卷。东方明珠塔凭借其穿梭于三根直径9米的擎天立柱之中的高速电梯，以及悬空于立柱之间的世界首部360度全透明三轨观光电梯，让每一位游客充分领略现代技术带来的无限风光。

东方明珠塔各观光层柜台里1000多款造型独特、制作精美的各式旅游纪念品琳琅满目，令人目不暇接、留连忘返。东方明珠塔每年接待来自于五洲四海中外宾客 280 多万人次，是集观光、餐饮、购物、娱乐、游船、会展、历史陈列、广播电视发射等多功能于一体的综合性旅游文化景点。东方明珠塔业已成为上海的标志性建筑，荣列上海十大新景观之一。作为全国旅游热点之一，东方明珠塔又以其优质服务，在 2001 年初被 国家旅游局评为全国首批 AAAA 级旅游景点。', '8:00-19:30');
INSERT INTO [app_product] ([id], [name], [category_id], [headImg], [address], [price], [content], [openTime]) VALUES (13, '上海豫园', 2, '2020/04/22/yuyuan.jpg', '上海市黄浦区安仁街132号(城隍庙内)', 198, '门票·开放时间：
　　豫园园林门票：旺季（每年4月1日至6月30日，9月1日至11月30日）40元。淡季30元。中小学生、1.4米以下儿童每位10元。　　08:45-16:15；16：45清场
交通概况：
　　地铁10号线豫园站、地铁14号线豫园站、11、26、64、66、715、920、926、929、930等公交车可到。
豫园是著名的江南古典园林，全国重点文物保护单位。豫园始建于明嘉靖年间，有明代四川布政使潘允端所建，至今已有400多年的历史。1853年上海小刀会起义时，豫园点春堂曾作为起义军的城北指挥部，现堂内陈列着当年小刀会的武器、自铸的钱币，以及发布的文告等文物。解放后政府对豫园进行了大规模的修缮，1961年正式对外开放。

静观大厅 亦称“晴雪堂”,是内园主要厅堂,造得雕栋画梁,轩昂高敞。堂面阔5间,进深3间,厅前有两尊石狮,厅内有“静观”和“灵沼峙”两块贴金匾额。静观之名,取古语“静观万物皆自得”,“动观流水静观山”之意。大厅对面奇峰林立,堆叠多姿,或如三官献寿,或如白鹿望月,或如蝙蝠飞舞,或如九狮盘球。据说静静观之,能辨出100多种动物形象。石峰间有许多百年古树。静观东面一小院落,中有池水一泓,两侧曲廊回绕,树荫蔽日,修竹潇洒挺拔,环境幽深。

观涛楼 位于静观大厅西南侧,又称“小灵台”,三层全木结构,高10余丈,清时为城东最高建筑物。昔年在此登高可观赏“沪城八景”之一“黄浦秋涛”。

还云楼、延清楼 面对静观大厅,东西相连,为串楼形,并可通向观涛楼和船厅,还云楼内横匾“还云”,为清末上海名绅姚文?题识。还云楼原为上海钱业公所产业,豫园、内园屡遭战火破坏,而此楼却免遭劫,大有“手挥丝桐,目送还云,西山爽气,在我袖中”之感。

耸翠亭 耸立于观涛楼东面假山上,双层亭阁,底层置石桌、石凳,周围林木青翠。亭内一匾“灵木披芳”。

可以观 位于静观大厅东,小型方厅,精致幽静,炎夏时分外凉爽。厅前有砖雕《郭子仪上寿图》,旁有泥塑龙墙,北接“洞天福地”凤凰亭,南连“别有天”,墙上有《重修内园记》等石碑,记载内园历史。', '08:45-16:15；16：45清场');
INSERT INTO [app_product] ([id], [name], [category_id], [headImg], [address], [price], [content], [openTime]) VALUES (14, '上海野生动物园', 3, '2020/04/22/yesheng.jpg', '上海市浦东新区南六公路178号', 198, '门票·开放时间：
欣欣价-成人票价：138元起（省30元）；包含门票和老虎扑食
欣欣价-学生票价：65元起
A.免票政策：
①儿童身高1.3米（含）以下免票；
②残疾人、现役军人、伤残军人、军队离退休干部、烈士家属凭有效证件至景区登记免票。
B.优惠政策：
①全日制大学本科及以下学历学生需凭有效学生证购买学生票；
②60周岁以上（含）老人凭有效证件可至上海野生动物园购买优惠门票。淡季（12月-2月）8:30-16:30（15:30停止换票）； 旺季（3月-11月）8:00-17:00（16:00停止换票）。
交通概况：
一、市内自驾车线路
1、市区--南浦大桥--龙阳路--沪南公路--南六公 路；
2、市区--南浦大桥--龙阳路--罗山路--外环线(A20公路)--迎宾大道(A1公路)--南六公路。
二、外地自驾车推荐线路
1、G42（沪宁高速）或沿江高速--G15--S32（申嘉湖 高速）--南六出入口下，南六公路向南开3.8千米到达上海野生动物园；
2、G42（沪宁高速）或沿 江高速--中环线--翔殷路隧道--五洲大道--S20（外环线）--S1（浦东机场方向），南六出入口下，直走 10公里到达上海野生动物园；
3、自驾车-G60（A8）：松江出口沿嘉松公路向北到沈砖公路向西行百米。
三、最新交通信息：
1、轨交线路：地铁16号线，野生动物园站
沿途停靠：罗山路站、周浦东站、鹤沙航城站、航头东站、新场站、野生动物园站；
2、惠南6路：首班车：06:42 末班车：1 9：00
沿途停靠：地铁16号线野生动物园站、航三路（施桥）、野生动物园；
3、南新线： 首班车：5：30 末班车：1 9：00(每班间隔1 0分钟)
沿途停靠：新客站(西南出口)、南浦大桥、北蔡、周浦、六灶、野生动物园；
4、张南线： 张南线：首班车：6：30 末班车：1 9：00(每班间隔10分钟)
沿途停靠：地铁2号线张江出口、建桥大学、六灶、野生动物园；
5、沪南线（在薛家宅转南新线即到野生动物园）：沪南线：首班车：4：45 末班车：1 9：00(每班间隔1 0分钟)
沿途停靠：东昌路、北蔡、周浦、航头、新场、薛家宅。', '淡季（12月-2月）8:30-16:30');
INSERT INTO [app_product] ([id], [name], [category_id], [headImg], [address], [price], [content], [openTime]) VALUES (15, '大观园', 2, '2020/04/22/daguanyuan.jpg', '上海青浦区青商公路701号', 150, '门票·开放时间：
欣欣成人门票价：42元起（省18元）；
欣欣学生门票价：28元起（省8元）；
特惠政策：
A.免费政策：1.3米（不含）以下儿童免票；现役军官、残疾人证、老干部证免票。
B.优惠政策：60(含）周岁以上老人持身份证可享优惠（上述优惠政策，需到景区自行购买）。旺季(4月-10月)8:00-17:00；淡季(11月～3月)8:00-16:30
交通概况：
自驾路线：1、上海方向→上海大观园：
上海—G50（沪渝）高速—金泽出口下—右转沿318国道直行—金商公路—大观园 
2、南京方向→上海大观园：
南京—沪宁高速—苏嘉杭高速—G50（沪渝）高速—金泽出口下—右转沿318国道直行—金商公路—大观园 
3、杭州方向→上海大观园：
杭州—沪杭高速—乍嘉苏高速—G50（沪渝）高速—金泽出口下—右转沿318国道直行—金商公路—大观园 
4、苏州方向→上海大观园：
苏州—东方大道—苏同黎公路—同周公路—往周庄方向—秀海路直行——往商塌方向—商周公路—金商公路—大观园 
公共交通： 公交：
1、上海火车站→上海大观园
地铁1号线到人民广场普安路（坐公交）沪朱线到青浦转青商线可到达； 
2、上海机场→上海大观园
地铁2号线到徐泾东乘公交朱徐线到朱家角转青商线可到达； 
3、上海市中心→上海大观园
普安路（坐公交）沪朱线到青浦转青商线可到达。', '旺季(4月-10月)8:00-17:00；淡季(11月～3月)8:00-16:30');
INSERT INTO [app_product] ([id], [name], [category_id], [headImg], [address], [price], [content], [openTime]) VALUES (16, '上海野生动物园', 3, '2020/04/22/yesheng.jpg', '上海市浦东新区南六公路178号', 138, '门票·开放时间：
欣欣价-成人票价：138元起（省30元）；包含门票和老虎扑食
欣欣价-学生票价：65元起
A.免票政策：
①儿童身高1.3米（含）以下免票；
②残疾人、现役军人、伤残军人、军队离退休干部、烈士家属凭有效证件至景区登记免票。
B.优惠政策：
①全日制大学本科及以下学历学生需凭有效学生证购买学生票；
②60周岁以上（含）老人凭有效证件可至上海野生动物园购买优惠门票。淡季（12月-2月）8:30-16:30（15:30停止换票）； 旺季（3月-11月）8:00-17:00（16:00停止换票）。
交通概况：
一、市内自驾车线路
1、市区--南浦大桥--龙阳路--沪南公路--南六公 路；
2、市区--南浦大桥--龙阳路--罗山路--外环线(A20公路)--迎宾大道(A1公路)--南六公路。
二、外地自驾车推荐线路
1、G42（沪宁高速）或沿江高速--G15--S32（申嘉湖 高速）--南六出入口下，南六公路向南开3.8千米到达上海野生动物园；
2、G42（沪宁高速）或沿 江高速--中环线--翔殷路隧道--五洲大道--S20（外环线）--S1（浦东机场方向），南六出入口下，直走 10公里到达上海野生动物园；
3、自驾车-G60（A8）：松江出口沿嘉松公路向北到沈砖公路向西行百米。
三、最新交通信息：
1、轨交线路：地铁16号线，野生动物园站
沿途停靠：罗山路站、周浦东站、鹤沙航城站、航头东站、新场站、野生动物园站；
2、惠南6路：首班车：06:42 末班车：1 9：00
沿途停靠：地铁16号线野生动物园站、航三路（施桥）、野生动物园；
3、南新线： 首班车：5：30 末班车：1 9：00(每班间隔1 0分钟)
沿途停靠：新客站(西南出口)、南浦大桥、北蔡、周浦、六灶、野生动物园；
4、张南线： 张南线：首班车：6：30 末班车：1 9：00(每班间隔10分钟)
沿途停靠：地铁2号线张江出口、建桥大学、六灶、野生动物园；
5、沪南线（在薛家宅转南新线即到野生动物园）：沪南线：首班车：4：45 末班车：1 9：00(每班间隔1 0分钟)
沿途停靠：东昌路、北蔡、周浦、航头、新场、薛家宅。', '淡季（12月-2月）8:30-16:30');
INSERT INTO [app_product] ([id], [name], [category_id], [headImg], [address], [price], [content], [openTime]) VALUES (17, '田子坊', 1, '2020/04/22/tianzifang_.jpg', '上海市黄浦区泰康路210弄', 0, '田子坊简介：
　　唯一特性：无论是招牌还是商品，每家店铺都极力展现只属于自己的风格，目的就是为了突出“唯一”特性。在这里，你可以缓下脚步、放慢节奏，静静地聆听店主跟你叙述每一件得意之作的渊源与故事。 　　泰康路原是打浦桥地区的一条小街，1998年前这里还是一个马路集市，自1998年政府市政改造后，一些艺术家和工作室陆续入驻这里。经过把泰康路的重新铺设，使原来下雨一地泥，天晴一片尘的马路焕然一新。

　　田子坊是由上海特有的石库门建筑群改建后形成的时尚地标性创意产业聚集区，也是不少艺术家的创意工作基地，人们往往将她称为“新天地第二”。实际上，除了同样时尚外，她与新天地有着很多不同之处。

　　田子坊展现给人们的更多的是上海亲切、温暖和嘈杂的一面。只要你在这条如今上海滩最有味道的弄堂里走一走，就不难体会田子坊与众不同的个性了。走在田子坊，迂回穿行在迷宫般的弄堂里，一家家特色小店和艺术作坊就这样在不经意间跳入你的视线。从茶馆、露天餐厅、露天咖啡座、画廊、家居摆设到手工艺品，以及众多沪上知名的创意工作室，可谓应有尽有。', '全天开放，营业时间一般是10:00-21:00左右');
INSERT INTO [app_product] ([id], [name], [category_id], [headImg], [address], [price], [content], [openTime]) VALUES (18, '东方明珠', 3, '2020/04/22/dongf1.jpg', '中国上海浦东区世纪大道1号', 160, '门票·开放时间：
成人观光B票:160元
旋转餐厅自助午餐+东方明珠上球体+下球体参观+历史陈列馆：300元
A.免票政策：现役军人凭有效证件可免费参观东方明珠上球体+陈列馆；
观光、旋转餐厅儿童1米（含）以下免票；
游船儿童1.2米（含）以下免票
B.优惠政策：70岁以上老人凭有效证件购景区优惠票。8:00-19:30
交通概况：
乘车路线： 
①上海火车站：地铁1号线【上海火车站】 (莘庄方向)坐3站，【人民广场】换乘地铁2号线（浦东国际机场方向）坐2站 ，【陆家嘴】下车1号口出（约30分钟） 
②虹桥火车站：地铁2号线【虹桥火车站】 (浦东国际机场方向)坐12站，【陆家嘴】下车1号口出（约50分钟） 
③虹桥机场：地铁10号线【上海虹桥机场】 (虹桥火车站方向)坐1站，【虹桥2号航站楼】换乘地铁2号线（浦东国际机场方向）坐11站，【陆家嘴】下车1号口出（约1小时10分钟） 
④浦东国际机场：地铁2号线【浦东国际机场】 (徐泾东方向)坐16站，【陆家嘴】下车1号口出（约1小时10分钟）
东方明珠简介：
上海东方明珠广播电视塔座落于上海黄浦江畔、浦东陆家嘴嘴尖，以其468米的绝对高度成为亚洲第一、世界第三之高塔。东方明珠塔卓然秀立于陆家嘴地区现代化建筑楼群，与隔江的外滩万国建筑博览群交相辉映，展现了国际大都市的壮观景色。东方明珠塔集观光餐饮、购物娱乐、浦江游览、会务会展、历史陈列、旅行代理等服务功能于一身，成为上海标志性建筑和旅游热点之一。

东方明珠塔十一个大小不一、错落有致的球体晶莹夺目，从蔚蓝的天空串联到如茵的草地，描绘出一幅“大珠小珠落玉盘”的如梦画卷。东方明珠塔凭借其穿梭于三根直径9米的擎天立柱之中的高速电梯，以及悬空于立柱之间的世界首部360度全透明三轨观光电梯，让每一位游客充分领略现代技术带来的无限风光。

东方明珠塔各观光层柜台里1000多款造型独特、制作精美的各式旅游纪念品琳琅满目，令人目不暇接、留连忘返。东方明珠塔每年接待来自于五洲四海中外宾客 280 多万人次，是集观光、餐饮、购物、娱乐、游船、会展、历史陈列、广播电视发射等多功能于一体的综合性旅游文化景点。东方明珠塔业已成为上海的标志性建筑，荣列上海十大新景观之一。作为全国旅游热点之一，东方明珠塔又以其优质服务，在 2001 年初被 国家旅游局评为全国首批 AAAA 级旅游景点。', '8:00-19:30');
INSERT INTO [app_product] ([id], [name], [category_id], [headImg], [address], [price], [content], [openTime]) VALUES (19, '上海豫园', 2, '2020/04/22/yuyuan.jpg', '上海市黄浦区安仁街132号(城隍庙内)', 198, '门票·开放时间：
　　豫园园林门票：旺季（每年4月1日至6月30日，9月1日至11月30日）40元。淡季30元。中小学生、1.4米以下儿童每位10元。　　08:45-16:15；16：45清场
交通概况：
　　地铁10号线豫园站、地铁14号线豫园站、11、26、64、66、715、920、926、929、930等公交车可到。
豫园是著名的江南古典园林，全国重点文物保护单位。豫园始建于明嘉靖年间，有明代四川布政使潘允端所建，至今已有400多年的历史。1853年上海小刀会起义时，豫园点春堂曾作为起义军的城北指挥部，现堂内陈列着当年小刀会的武器、自铸的钱币，以及发布的文告等文物。解放后政府对豫园进行了大规模的修缮，1961年正式对外开放。

静观大厅 亦称“晴雪堂”,是内园主要厅堂,造得雕栋画梁,轩昂高敞。堂面阔5间,进深3间,厅前有两尊石狮,厅内有“静观”和“灵沼峙”两块贴金匾额。静观之名,取古语“静观万物皆自得”,“动观流水静观山”之意。大厅对面奇峰林立,堆叠多姿,或如三官献寿,或如白鹿望月,或如蝙蝠飞舞,或如九狮盘球。据说静静观之,能辨出100多种动物形象。石峰间有许多百年古树。静观东面一小院落,中有池水一泓,两侧曲廊回绕,树荫蔽日,修竹潇洒挺拔,环境幽深。

观涛楼 位于静观大厅西南侧,又称“小灵台”,三层全木结构,高10余丈,清时为城东最高建筑物。昔年在此登高可观赏“沪城八景”之一“黄浦秋涛”。

还云楼、延清楼 面对静观大厅,东西相连,为串楼形,并可通向观涛楼和船厅,还云楼内横匾“还云”,为清末上海名绅姚文?题识。还云楼原为上海钱业公所产业,豫园、内园屡遭战火破坏,而此楼却免遭劫,大有“手挥丝桐,目送还云,西山爽气,在我袖中”之感。

耸翠亭 耸立于观涛楼东面假山上,双层亭阁,底层置石桌、石凳,周围林木青翠。亭内一匾“灵木披芳”。

可以观 位于静观大厅东,小型方厅,精致幽静,炎夏时分外凉爽。厅前有砖雕《郭子仪上寿图》,旁有泥塑龙墙,北接“洞天福地”凤凰亭,南连“别有天”,墙上有《重修内园记》等石碑,记载内园历史。', '08:45-16:15；16：45清场');

-- Table: django_content_type
CREATE TABLE django_content_type ( 
    id        INTEGER         NOT NULL
                              PRIMARY KEY AUTOINCREMENT,
    app_label VARCHAR( 100 )  NOT NULL,
    model     VARCHAR( 100 )  NOT NULL 
);

INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (1, 'admin', 'logentry');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (14, 'app', 'category');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (18, 'app', 'comment');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (22, 'app', 'config');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (16, 'app', 'flight');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (20, 'app', 'hotel');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (21, 'app', 'note');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (23, 'app', 'order');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (15, 'app', 'product');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (19, 'app', 'room');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (17, 'app', 'user');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (3, 'auth', 'group');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (2, 'auth', 'permission');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (4, 'auth', 'user');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (13, 'login', 'user');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (8, 'product', 'category');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (9, 'product', 'config');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (10, 'product', 'flight');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (11, 'product', 'hotel');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (7, 'product', 'product');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (12, 'product', 'room');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (6, 'sessions', 'session');

-- Table: auth_user
CREATE TABLE auth_user ( 
    id           INTEGER         NOT NULL
                                 PRIMARY KEY AUTOINCREMENT,
    password     VARCHAR( 128 )  NOT NULL,
    last_login   DATETIME        NULL,
    is_superuser BOOL            NOT NULL,
    first_name   VARCHAR( 30 )   NOT NULL,
    last_name    VARCHAR( 30 )   NOT NULL,
    email        VARCHAR( 254 )  NOT NULL,
    is_staff     BOOL            NOT NULL,
    is_active    BOOL            NOT NULL,
    date_joined  DATETIME        NOT NULL,
    username     VARCHAR( 150 )  NOT NULL
                                 UNIQUE 
);

INSERT INTO [auth_user] ([id], [password], [last_login], [is_superuser], [first_name], [last_name], [email], [is_staff], [is_active], [date_joined], [username]) VALUES (1, 'pbkdf2_sha256$120000$N4mqftf7E7Vj$rAlPrc0HRAkyX9mMqagynG6+z5ZGXkQbSk0xVEjpyg4=', '2020-06-01 09:00:11.772947', 1, '', '', 'xxxx@163.com', 1, 1, '2019-02-26 06:35:53.128980', 'admin');

-- Table: auth_permission
CREATE TABLE auth_permission ( 
    id              INTEGER         NOT NULL
                                    PRIMARY KEY AUTOINCREMENT,
    content_type_id INTEGER         NOT NULL
                                    REFERENCES django_content_type ( id ),
    codename        VARCHAR( 100 )  NOT NULL,
    name            VARCHAR( 255 )  NOT NULL 
);

INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (1, 1, 'add_logentry', 'Can add log entry');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (2, 1, 'change_logentry', 'Can change log entry');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (3, 1, 'delete_logentry', 'Can delete log entry');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (4, 2, 'add_permission', 'Can add permission');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (5, 2, 'change_permission', 'Can change permission');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (6, 2, 'delete_permission', 'Can delete permission');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (7, 3, 'add_group', 'Can add group');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (8, 3, 'change_group', 'Can change group');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (9, 3, 'delete_group', 'Can delete group');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (10, 4, 'add_user', 'Can add user');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (11, 4, 'change_user', 'Can change user');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (12, 4, 'delete_user', 'Can delete user');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (13, 5, 'add_contenttype', 'Can add content type');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (14, 5, 'change_contenttype', 'Can change content type');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (15, 5, 'delete_contenttype', 'Can delete content type');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (16, 6, 'add_session', 'Can add session');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (17, 6, 'change_session', 'Can change session');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (18, 6, 'delete_session', 'Can delete session');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (19, 7, 'add_product', 'Can add product');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (20, 7, 'change_product', 'Can change product');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (21, 7, 'delete_product', 'Can delete product');

-- Table: django_migrations
CREATE TABLE django_migrations ( 
    id      INTEGER         NOT NULL
                            PRIMARY KEY AUTOINCREMENT,
    app     VARCHAR( 255 )  NOT NULL,
    name    VARCHAR( 255 )  NOT NULL,
    applied DATETIME        NOT NULL 
);

INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (1, 'contenttypes', '0001_initial', '2019-02-26 06:34:36.659606');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (2, 'auth', '0001_initial', '2019-02-26 06:34:36.894620');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (3, 'admin', '0001_initial', '2019-02-26 06:34:37.319644');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2019-02-26 06:34:37.602660');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (5, 'contenttypes', '0002_remove_content_type_name', '2019-02-26 06:34:37.877676');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (6, 'auth', '0002_alter_permission_name_max_length', '2019-02-26 06:34:38.137691');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (7, 'auth', '0003_alter_user_email_max_length', '2019-02-26 06:34:38.436708');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (8, 'auth', '0004_alter_user_username_opts', '2019-02-26 06:34:38.694723');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (9, 'auth', '0005_alter_user_last_login_null', '2019-02-26 06:34:38.952738');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (10, 'auth', '0006_require_contenttypes_0002', '2019-02-26 06:34:39.066744');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (11, 'auth', '0007_alter_validators_add_error_messages', '2019-02-26 06:34:39.394763');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (12, 'auth', '0008_alter_user_username_max_length', '2019-02-26 06:34:39.649777');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (13, 'sessions', '0001_initial', '2019-02-26 06:34:39.885791');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (14, 'product', '0001_initial', '2019-02-26 07:22:48.128989');

-- Table: auth_group
CREATE TABLE auth_group ( 
    id   INTEGER        NOT NULL
                        PRIMARY KEY AUTOINCREMENT,
    name VARCHAR( 80 )  NOT NULL
                        UNIQUE 
);


-- Table: auth_group_permissions
CREATE TABLE auth_group_permissions ( 
    id            INTEGER NOT NULL
                          PRIMARY KEY AUTOINCREMENT,
    group_id      INTEGER NOT NULL
                          REFERENCES auth_group ( id ),
    permission_id INTEGER NOT NULL
                          REFERENCES auth_permission ( id ) 
);


-- Table: auth_user_groups
CREATE TABLE auth_user_groups ( 
    id       INTEGER NOT NULL
                     PRIMARY KEY AUTOINCREMENT,
    user_id  INTEGER NOT NULL
                     REFERENCES auth_user ( id ),
    group_id INTEGER NOT NULL
                     REFERENCES auth_group ( id ) 
);


-- Table: auth_user_user_permissions
CREATE TABLE auth_user_user_permissions ( 
    id            INTEGER NOT NULL
                          PRIMARY KEY AUTOINCREMENT,
    user_id       INTEGER NOT NULL
                          REFERENCES auth_user ( id ),
    permission_id INTEGER NOT NULL
                          REFERENCES auth_permission ( id ) 
);


-- Table: django_admin_log
CREATE TABLE django_admin_log ( 
    id              INTEGER           NOT NULL
                                      PRIMARY KEY AUTOINCREMENT,
    object_id       TEXT              NULL,
    object_repr     VARCHAR( 200 )    NOT NULL,
    action_flag     SMALLINT UNSIGNED NOT NULL,
    change_message  TEXT              NOT NULL,
    content_type_id INTEGER           NULL
                                      REFERENCES django_content_type ( id ),
    user_id         INTEGER           NOT NULL
                                      REFERENCES auth_user ( id ),
    action_time     DATETIME          NOT NULL 
);

INSERT INTO [django_admin_log] ([id], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id], [action_time]) VALUES (1, 1, 'Product object', 1, '[{"added": {}}]', 7, 1, '2019-02-27 03:27:33.556574');
INSERT INTO [django_admin_log] ([id], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id], [action_time]) VALUES (2, 1, 'Product object', 2, '[{"changed": {"fields": ["headImg"]}}]', 7, 1, '2019-02-27 03:49:30.879921');
INSERT INTO [django_admin_log] ([id], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id], [action_time]) VALUES (3, 1, 'Product object', 2, '[{"changed": {"fields": ["headImg"]}}]', 7, 1, '2019-02-27 05:37:42.195203');
INSERT INTO [django_admin_log] ([id], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id], [action_time]) VALUES (4, 1, 'Product object', 2, '[{"changed": {"fields": ["headImg"]}}]', 7, 1, '2019-02-27 05:38:36.603315');
INSERT INTO [django_admin_log] ([id], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id], [action_time]) VALUES (5, 1, 'Product object', 2, '[{"changed": {"fields": ["headImg"]}}]', 7, 1, '2019-02-27 05:42:36.407031');
INSERT INTO [django_admin_log] ([id], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id], [action_time]) VALUES (6, 1, 'Product object', 2, '[{"changed": {"fields": ["headImg"]}}]', 7, 1, '2019-02-27 09:32:55.246423');
INSERT INTO [django_admin_log] ([id], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id], [action_time]) VALUES (7, 1, 'Product object', 2, '[{"changed": {"fields": ["name", "brief"]}}]', 7, 1, '2019-02-27 10:12:53.234580');
INSERT INTO [django_admin_log] ([id], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id], [action_time]) VALUES (8, 1, '名称：中国台湾6天5晚跟团游，简介：【花季大赏*森呼吸】纯玩西线之旅（阳', 2, '[{"changed": {"fields": ["price", "content", "tripDate"]}}]', 7, 1, '2019-02-27 10:29:26.054366');
INSERT INTO [django_admin_log] ([id], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id], [action_time]) VALUES (9, 1, '名称：中国台湾6天5晚跟团游，简介：【花季大赏*森呼吸】纯玩西线之旅（阳明山绣球花+大溪花海+5花北进高出）', 2, '[]', 7, 1, '2019-02-27 10:29:54.751007');
INSERT INTO [django_admin_log] ([id], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id], [action_time]) VALUES (10, 1, '名称：中国台湾6天5晚跟团游，简介：【花季大赏*森呼吸】纯玩西线之旅（阳明山绣球花+大溪花海+5花北进高出）', 2, '[{"changed": {"fields": ["headImg"]}}]', 7, 1, '2019-02-27 10:42:40.028779');
INSERT INTO [django_admin_log] ([id], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id], [action_time]) VALUES (11, 1, '跟团游', 1, '[{"added": {}}]', 8, 1, '2019-02-27 11:45:54.580815');
INSERT INTO [django_admin_log] ([id], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id], [action_time]) VALUES (12, 2, '自由行', 1, '[{"added": {}}]', 8, 1, '2019-02-27 11:46:05.659448');
INSERT INTO [django_admin_log] ([id], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id], [action_time]) VALUES (13, 1, '名称：中国台湾6天5晚跟团游，简介：【花季大赏*森呼吸】纯玩西线之旅（阳明山绣球花+大溪花海+5花北进高出）', 2, '[{"changed": {"fields": ["category"]}}]', 7, 1, '2019-02-27 11:47:19.925696');
INSERT INTO [django_admin_log] ([id], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id], [action_time]) VALUES (14, 2, '毛里求斯8天5晚自由行，自由行，简介：【威斯汀酒店】毛航直飞，西海岸国际五星*中文服务*免费WIFI', 1, '[{"added": {}}]', 7, 1, '2019-02-27 11:56:00.072447');
INSERT INTO [django_admin_log] ([id], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id], [action_time]) VALUES (15, 1, '网站名新青年旅游网，字数：24，简介：为年轻人提供性价比高的旅游产品，带有', 1, '[{"added": {}}]', 9, 1, '2019-02-27 12:07:21.230407');
INSERT INTO [django_admin_log] ([id], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id], [action_time]) VALUES (16, 1, 'MU006海南航空公司，杭州->海口，出发时间:2019-02-15 15:33:00+08:00', 1, '[{"added": {}}]', 10, 1, '2019-02-27 12:35:27.379849');
INSERT INTO [django_admin_log] ([id], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id], [action_time]) VALUES (17, 1, '和平饭店，上海，黄浦区南京东路100号，位置方便交通便利，地铁站很近，服务态', 1, '[{"added": {}}]', 11, 1, '2019-03-04 14:01:02.372469');
INSERT INTO [django_admin_log] ([id], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id], [action_time]) VALUES (18, 2, '锦江宾馆，上海，黄浦区浙江中路310号，位置方便交通便利，地铁站很近，服务态', 1, '[{"added": {}}]', 11, 1, '2019-03-04 14:01:27.927931');
INSERT INTO [django_admin_log] ([id], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id], [action_time]) VALUES (19, 1, '1，0，180，超级便宜的房间，很适合单个住', 1, '[{"added": {}}]', 12, 1, '2019-03-04 14:04:46.684299');
INSERT INTO [django_admin_log] ([id], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id], [action_time]) VALUES (20, 2, '单人间，含早餐，240，环境很好，早餐很丰富', 1, '[{"added": {}}]', 12, 1, '2019-03-04 14:24:48.477037');
INSERT INTO [django_admin_log] ([id], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id], [action_time]) VALUES (21, 3, '双人间，含早餐，360，双人间更舒适，双人套餐更豪华', 1, '[{"added": {}}]', 12, 1, '2019-03-04 14:25:23.825059');
INSERT INTO [django_admin_log] ([id], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id], [action_time]) VALUES (22, 1, 'test', 1, '[{"added": {}}]', 13, 1, '2019-03-07 02:27:04.983094');
INSERT INTO [django_admin_log] ([id], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id], [action_time]) VALUES (23, 3, '一日游', 1, '[{"added": {}}]', 14, 1, '2019-03-07 15:39:36.981913');
INSERT INTO [django_admin_log] ([id], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id], [action_time]) VALUES (24, 3, '上海城隍庙+东方明珠+黄浦江游船+人民广场一日游，一日游，简介：东方明珠悬空观光走廊上感受站高看远的意境', 1, '[{"added": {}}]', 15, 1, '2019-03-07 15:51:59.876404');
INSERT INTO [django_admin_log] ([id], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id], [action_time]) VALUES (25, 1, 'MU012东方航空公司，上海->海口，出发时间:2019-02-14 15:33:00+08:00', 2, '[{"changed": {"fields": ["code", "company", "city1", "departureTime", "arrivalTime"]}}]', 16, 1, '2019-03-07 15:55:41.589085');
INSERT INTO [django_admin_log] ([id], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id], [action_time]) VALUES (26, 6, 'ME003吉祥航空，上海->北京，出发时间:2019-03-12 23:56:00+08:00', 1, '[{"added": {}}]', 16, 1, '2019-03-07 15:56:40.218438');
INSERT INTO [django_admin_log] ([id], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id], [action_time]) VALUES (27, 1, '中国台湾6天5晚跟团游，跟团游，简介：【花季大赏*森呼吸】纯玩西线之旅（阳明山绣球花+大溪花海+5花北进高出），test，一星好评', 1, '[{"added": {}}]', 18, 1, '2019-03-07 17:21:33.719770');
INSERT INTO [django_admin_log] ([id], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id], [action_time]) VALUES (28, 4, '双人间，不含早餐，520，豪华装修', 1, '[{"added": {}}]', 19, 1, '2019-03-07 18:04:00.287425');
INSERT INTO [django_admin_log] ([id], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id], [action_time]) VALUES (29, 6, '毛里求斯8天5晚自由行，自由行，test，二星好评', 2, '[]', 18, 1, '2019-03-07 18:04:24.841830');
INSERT INTO [django_admin_log] ([id], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id], [action_time]) VALUES (30, 4, '中国台湾6天5晚跟团游，跟团游，test，四星好评', 2, '[]', 18, 1, '2019-03-07 18:04:28.344030');
INSERT INTO [django_admin_log] ([id], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id], [action_time]) VALUES (31, 6, 'ME003吉祥航空公司，上海->北京，出发时间:2019-03-12 23:56:00+08:00', 2, '[]', 16, 1, '2019-03-21 02:20:50.962070');
INSERT INTO [django_admin_log] ([id], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id], [action_time]) VALUES (32, 6, 'ME003吉祥航空公司，上海->北京，出发时间:2019-03-12 23:56:00+08:00', 2, '[]', 16, 1, '2019-03-21 02:21:06.400953');
INSERT INTO [django_admin_log] ([id], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id], [action_time]) VALUES (33, 1, '网站启用通知', 1, '[{"added": {}}]', 21, 1, '2019-03-21 02:31:23.123227');
INSERT INTO [django_admin_log] ([id], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id], [action_time]) VALUES (34, 1, '旅游注意事项1', 2, '[{"changed": {"fields": ["title", "content"]}}]', 21, 1, '2019-03-21 05:47:11.977223');
INSERT INTO [django_admin_log] ([id], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id], [action_time]) VALUES (35, 2, '旅游注意事项2', 1, '[{"added": {}}]', 21, 1, '2019-03-21 05:47:38.675750');
INSERT INTO [django_admin_log] ([id], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id], [action_time]) VALUES (36, 3, '旅游注意事项3', 1, '[{"added": {}}]', 21, 1, '2019-03-21 05:47:48.766328');
INSERT INTO [django_admin_log] ([id], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id], [action_time]) VALUES (37, 4, '旅游注意事项4', 1, '[{"added": {}}]', 21, 1, '2019-03-21 05:47:58.565888');
INSERT INTO [django_admin_log] ([id], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id], [action_time]) VALUES (38, 5, '旅游注意事项5', 1, '[{"added": {}}]', 21, 1, '2019-03-21 05:48:07.026372');
INSERT INTO [django_admin_log] ([id], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id], [action_time]) VALUES (39, 6, '旅游注意事项6', 1, '[{"added": {}}]', 21, 1, '2019-03-21 05:48:18.392022');
INSERT INTO [django_admin_log] ([id], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id], [action_time]) VALUES (40, 19, '江苏常州2天1晚自由行，一日游', 2, '[{"changed": {"fields": ["name", "content"]}}]', 15, 1, '2019-03-21 06:31:22.848845');
INSERT INTO [django_admin_log] ([id], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id], [action_time]) VALUES (41, 13, '上海城隍庙+东方明珠+黄浦江游船+人民广场一日游，一日游', 2, '[{"changed": {"fields": ["content"]}}]', 15, 1, '2019-03-21 06:31:31.961366');
INSERT INTO [django_admin_log] ([id], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id], [action_time]) VALUES (42, 13, '江苏常州2天1晚自由行，一日游', 2, '[{"changed": {"fields": ["name"]}}]', 15, 1, '2019-03-21 06:31:55.204695');
INSERT INTO [django_admin_log] ([id], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id], [action_time]) VALUES (43, 19, '江苏常州2天1晚自由行，一日游', 2, '[{"changed": {"fields": ["headImg"]}}]', 15, 1, '2019-03-21 06:32:51.786932');
INSERT INTO [django_admin_log] ([id], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id], [action_time]) VALUES (44, 4, '江苏苏州2天1晚自由行，跟团游', 2, '[{"changed": {"fields": ["headImg", "brief", "content"]}}]', 15, 1, '2019-03-21 06:37:52.959158');
INSERT INTO [django_admin_log] ([id], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id], [action_time]) VALUES (45, 3, '杭州千岛湖3天2晚自由行，自由行', 2, '[{"changed": {"fields": ["name", "category", "headImg", "brief", "content"]}}]', 15, 1, '2019-03-21 06:40:50.663322');
INSERT INTO [django_admin_log] ([id], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id], [action_time]) VALUES (46, 2, '毛里求斯8天5晚自由行，自由行', 2, '[{"changed": {"fields": ["headImg"]}}]', 15, 1, '2019-03-21 06:41:55.222014');
INSERT INTO [django_admin_log] ([id], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id], [action_time]) VALUES (47, 1, '中国台湾6天5晚跟团游，跟团游', 2, '[{"changed": {"fields": ["headImg"]}}]', 15, 1, '2019-03-21 06:42:43.763791');
INSERT INTO [django_admin_log] ([id], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id], [action_time]) VALUES (48, 19, '江苏常州2天1晚自由行，自由行', 2, '[{"changed": {"fields": ["category"]}}]', 15, 1, '2019-03-21 07:14:37.175232');
INSERT INTO [django_admin_log] ([id], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id], [action_time]) VALUES (49, 13, '江苏常州2天1晚自由行，自由行', 2, '[{"changed": {"fields": ["category"]}}]', 15, 1, '2019-03-21 07:14:43.008565');
INSERT INTO [django_admin_log] ([id], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id], [action_time]) VALUES (50, 10, '江苏苏州2天1晚自由行，自由行', 2, '[{"changed": {"fields": ["category"]}}]', 15, 1, '2019-03-21 07:14:50.708006');
INSERT INTO [django_admin_log] ([id], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id], [action_time]) VALUES (51, 1, '网站名旅游网，字数：24，简介：为年轻人提供性价比高的旅游产品，带有', 2, '[{"changed": {"fields": ["site"]}}]', 22, 1, '2019-03-21 07:48:27.937384');
INSERT INTO [django_admin_log] ([id], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id], [action_time]) VALUES (52, 1, '网站名旅游网，字数：26，简介：为年轻人提供性价比高的旅游产品，满足', 2, '[{"changed": {"fields": ["desc"]}}]', 22, 1, '2019-03-21 07:54:26.485892');
INSERT INTO [django_admin_log] ([id], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id], [action_time]) VALUES (53, 1, '网站名上海旅游网，字数：32，简介：为年轻人提供性价比高的上海及周边地区', 2, '[{"changed": {"fields": ["site", "desc"]}}]', 22, 1, '2019-04-22 01:31:44.959326');
INSERT INTO [django_admin_log] ([id], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id], [action_time]) VALUES (54, 3, '5A级景点', 2, '[{"changed": {"fields": ["name", "desc"]}}]', 14, 1, '2019-04-22 01:33:17.343610');
INSERT INTO [django_admin_log] ([id], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id], [action_time]) VALUES (55, 2, '4A级景点', 2, '[{"changed": {"fields": ["name", "desc"]}}]', 14, 1, '2019-04-22 01:33:32.469475');
INSERT INTO [django_admin_log] ([id], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id], [action_time]) VALUES (56, 1, '3A级景点', 2, '[{"changed": {"fields": ["name", "desc"]}}]', 14, 1, '2019-04-22 01:33:40.831953');
INSERT INTO [django_admin_log] ([id], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id], [action_time]) VALUES (57, 6, '迪士尼乐园，5A级景点', 2, '[{"changed": {"fields": ["name", "address", "price", "content", "openTime"]}}]', 15, 1, '2019-04-22 01:48:14.532926');
INSERT INTO [django_admin_log] ([id], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id], [action_time]) VALUES (58, 6, '迪士尼乐园，5A级景点', 2, '[{"changed": {"fields": ["headImg"]}}]', 15, 1, '2019-04-22 01:52:02.514966');
INSERT INTO [django_admin_log] ([id], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id], [action_time]) VALUES (59, 18, '东方明珠，5A级景点', 2, '[{"changed": {"fields": ["name", "address", "price", "content", "openTime"]}}]', 15, 1, '2019-04-22 01:54:21.553918');
INSERT INTO [django_admin_log] ([id], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id], [action_time]) VALUES (60, 18, '东方明珠，5A级景点', 2, '[{"changed": {"fields": ["headImg"]}}]', 15, 1, '2019-04-22 01:54:45.676298');
INSERT INTO [django_admin_log] ([id], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id], [action_time]) VALUES (61, 18, '东方明珠，5A级景点', 2, '[{"changed": {"fields": ["headImg"]}}]', 15, 1, '2019-04-22 01:55:40.893456');
INSERT INTO [django_admin_log] ([id], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id], [action_time]) VALUES (62, 16, '上海野生动物园，5A级景点', 2, '[{"changed": {"fields": ["name", "headImg", "address", "price", "content", "openTime"]}}]', 15, 1, '2019-04-22 01:59:49.451673');
INSERT INTO [django_admin_log] ([id], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id], [action_time]) VALUES (63, 19, '上海豫园，4A级景点', 2, '[{"changed": {"fields": ["headImg", "content", "openTime"]}}]', 15, 1, '2019-04-22 02:09:52.069141');
INSERT INTO [django_admin_log] ([id], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id], [action_time]) VALUES (64, 15, '大观园，4A级景点', 2, '[{"changed": {"fields": ["name", "headImg", "address", "content", "openTime"]}}]', 15, 1, '2019-04-22 02:14:19.343428');
INSERT INTO [django_admin_log] ([id], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id], [action_time]) VALUES (65, 11, '上海欢乐谷，4A级景点', 2, '[{"changed": {"fields": ["name", "headImg", "address", "content", "openTime"]}}]', 15, 1, '2019-04-22 02:18:02.266179');
INSERT INTO [django_admin_log] ([id], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id], [action_time]) VALUES (66, 1, '田子坊，3A级景点', 2, '[{"changed": {"fields": ["name", "headImg", "address", "price", "content", "openTime"]}}]', 15, 1, '2019-04-22 02:27:23.427275');
INSERT INTO [django_admin_log] ([id], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id], [action_time]) VALUES (67, 1, '田子坊，3A级景点', 2, '[{"changed": {"fields": ["openTime"]}}]', 15, 1, '2019-04-22 02:28:17.676378');
INSERT INTO [django_admin_log] ([id], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id], [action_time]) VALUES (68, 9, '鲁迅公园，3A级景点', 2, '[{"changed": {"fields": ["name", "headImg", "address", "price", "content", "openTime"]}}]', 15, 1, '2019-04-22 02:32:46.461752');
INSERT INTO [django_admin_log] ([id], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id], [action_time]) VALUES (69, 9, '鲁迅公园，3A级景点', 2, '[{"changed": {"fields": ["headImg"]}}]', 15, 1, '2019-04-22 02:32:46.693765');
INSERT INTO [django_admin_log] ([id], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id], [action_time]) VALUES (70, 4, '犹太难民纪念馆，3A级景点', 2, '[{"changed": {"fields": ["name", "headImg", "address", "price", "content", "openTime"]}}]', 15, 1, '2019-04-22 02:34:41.069307');
INSERT INTO [django_admin_log] ([id], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id], [action_time]) VALUES (71, 8, '月满楼宾馆，上海，黄浦区浙江中路310号', 2, '[{"changed": {"fields": ["name"]}}]', 20, 1, '2019-04-22 02:59:06.921149');
INSERT INTO [django_admin_log] ([id], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id], [action_time]) VALUES (72, 5, '上海人家，上海，黄浦区浙江中路310号', 2, '[{"changed": {"fields": ["name"]}}]', 20, 1, '2019-04-22 02:59:43.652250');

-- Table: django_session
CREATE TABLE django_session ( 
    session_key  VARCHAR( 40 )  NOT NULL
                                PRIMARY KEY,
    session_data TEXT           NOT NULL,
    expire_date  DATETIME       NOT NULL 
);

INSERT INTO [django_session] ([session_key], [session_data], [expire_date]) VALUES ('fus7liicilxudwxziexqf3pvy0sky0ne', 'MzFmODZlZjgwYTBiODhkOGQzYmEyMjM5N2JiMjM0NWU2OTEzZTQ1MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxNzdlNDc3YzYzYWZkOWY4MDc1YWNlNmMwYzViNGMzZWQ2MGZlNWIyIiwiaXNfbG9naW4iOnRydWUsInVzZXJfaWQiOjEsInVzZXJfbmFtZSI6InRlc3QifQ==', '2019-03-22 11:47:07.827628');
INSERT INTO [django_session] ([session_key], [session_data], [expire_date]) VALUES ('r49d6q6tct94o8i9da9v1eout5kowkb0', 'ZGQyMjE4ODllMDQ4ZTY5MTE3NDBiZjM4ZDgxYWIzODY5ZDc1NWUxZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxZmQ0ZDJlYjc5YzU1OTg5MWMyNDVkNzNhMDBkNzY2Zjk3ZmUwNjE5In0=', '2019-04-04 02:20:15.976069');
INSERT INTO [django_session] ([session_key], [session_data], [expire_date]) VALUES ('f5tyslea6l35gt4rcwee9h9cto11zwkp', 'MWE0OTQ3NTVjY2NjZWQ5ZDI0MzE4ZDgxNDk1MWNiYmRkMDJmZmRmNzp7ImlzX2xvZ2luIjp0cnVlLCJ1c2VyX2lkIjoxLCJ1c2VyX25hbWUiOiJ0ZXN0In0=', '2019-04-04 10:20:20.690604');
INSERT INTO [django_session] ([session_key], [session_data], [expire_date]) VALUES ('pxhmzw6cfs89rz9ybf3z1sbs5uf8gxzw', 'NTcwNjY0OGUzZDYyNDY1YzZlYWEzN2Q1NTkzNjYzMjViYWVmZjI1NDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxNzdlNDc3YzYzYWZkOWY4MDc1YWNlNmMwYzViNGMzZWQ2MGZlNWIyIn0=', '2019-05-06 01:30:09.268852');
INSERT INTO [django_session] ([session_key], [session_data], [expire_date]) VALUES ('huqlos30itej397akpqol48vhzilwgc4', 'NTcwNjY0OGUzZDYyNDY1YzZlYWEzN2Q1NTkzNjYzMjViYWVmZjI1NDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxNzdlNDc3YzYzYWZkOWY4MDc1YWNlNmMwYzViNGMzZWQ2MGZlNWIyIn0=', '2019-05-06 02:08:11.723401');
INSERT INTO [django_session] ([session_key], [session_data], [expire_date]) VALUES ('rpmydika9c69jsodi7s3drpd5qjtl843', 'NmY1MWI2NzQ0MjlhMWQ0MGM3NzJjM2RmYmRkYzQwMzM0ZGU1NjkzNjp7ImlzX2xvZ2luIjp0cnVlLCJ1c2VyX2lkIjoxLCJ1c2VyX25hbWUiOiJ0ZXN0In0=', '2019-05-06 08:01:24.360551');
INSERT INTO [django_session] ([session_key], [session_data], [expire_date]) VALUES ('thb5ek3afds92q1i7y4jb2czlhm5up6m', 'MzFmODZlZjgwYTBiODhkOGQzYmEyMjM5N2JiMjM0NWU2OTEzZTQ1MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxNzdlNDc3YzYzYWZkOWY4MDc1YWNlNmMwYzViNGMzZWQ2MGZlNWIyIiwiaXNfbG9naW4iOnRydWUsInVzZXJfaWQiOjEsInVzZXJfbmFtZSI6InRlc3QifQ==', '2019-05-06 09:51:10.158237');

-- Table: app_hotel
CREATE TABLE app_hotel ( 
    id      INTEGER         PRIMARY KEY AUTOINCREMENT
                            NOT NULL,
    name    VARCHAR( 100 )  NOT NULL,
    city    VARCHAR( 64 )   NOT NULL,
    address VARCHAR( 200 )  NOT NULL,
    [DESC]  TEXT            NOT NULL 
);

INSERT INTO [app_hotel] ([id], [name], [city], [address], [DESC]) VALUES (1, '和平饭店', '上海', '黄浦区南京东路100号', '位置方便交通便利，地铁站很近，服务态度非常好，环境优雅舒适干净整洁');
INSERT INTO [app_hotel] ([id], [name], [city], [address], [DESC]) VALUES (2, '锦江宾馆', '上海', '黄浦区浙江中路310号', '位置方便交通便利，地铁站很近，服务态度非常好，环境优雅舒适干净整洁');
INSERT INTO [app_hotel] ([id], [name], [city], [address], [DESC]) VALUES (3, '长乐宾馆', '上海', '黄浦区浙江中路310号', '位置方便交通便利，地铁站很近，服务态度非常好，环境优雅舒适干净整洁');
INSERT INTO [app_hotel] ([id], [name], [city], [address], [DESC]) VALUES (4, '宏泰宾馆', '上海', '黄浦区浙江中路310号', '位置方便交通便利，地铁站很近，服务态度非常好，环境优雅舒适干净整洁');
INSERT INTO [app_hotel] ([id], [name], [city], [address], [DESC]) VALUES (5, '上海人家', '上海', '黄浦区浙江中路310号', '位置方便交通便利，地铁站很近，服务态度非常好，环境优雅舒适干净整洁');
INSERT INTO [app_hotel] ([id], [name], [city], [address], [DESC]) VALUES (6, '新青年宾馆', '上海', '黄浦区浙江中路310号', '位置方便交通便利，地铁站很近，服务态度非常好，环境优雅舒适干净整洁');
INSERT INTO [app_hotel] ([id], [name], [city], [address], [DESC]) VALUES (7, '华楼宾馆', '上海', '黄浦区浙江中路310号', '位置方便交通便利，地铁站很近，服务态度非常好，环境优雅舒适干净整洁');
INSERT INTO [app_hotel] ([id], [name], [city], [address], [DESC]) VALUES (8, '月满楼宾馆', '上海', '黄浦区浙江中路310号', '位置方便交通便利，地铁站很近，服务态度非常好，环境优雅舒适干净整洁');

-- Table: app_config
CREATE TABLE app_config ( 
    id     INTEGER        PRIMARY KEY AUTOINCREMENT
                          NOT NULL,
    site   VARCHAR( 64 )  NOT NULL,
    [desc] TEXT           NOT NULL 
);

INSERT INTO [app_config] ([id], [site], [desc]) VALUES (1, '上海旅游网', '为年轻人提供性价比高的上海及周边地区的景点，满足个性化的旅游需求');

-- Table: app_comment
CREATE TABLE app_comment ( 
    id         INTEGER  PRIMARY KEY AUTOINCREMENT
                        NOT NULL,
    product_id INTEGER  REFERENCES app_product ( id ),
    user_id    INTEGER  REFERENCES app_user ( id ),
    point      INTEGER,
    content    TEXT,
    crt_time   DATETIME NOT NULL 
);

INSERT INTO [app_comment] ([id], [product_id], [user_id], [point], [content], [crt_time]) VALUES (1, 1, 1, 1, 2414121241421, '2020-03-07 17:21:33.716770');
INSERT INTO [app_comment] ([id], [product_id], [user_id], [point], [content], [crt_time]) VALUES (2, 1, 1, 5, 454554, '2020-03-07 17:58:45.401415');
INSERT INTO [app_comment] ([id], [product_id], [user_id], [point], [content], [crt_time]) VALUES (3, 1, 1, 5, 454554, '2020-03-07 18:00:43.585175');
INSERT INTO [app_comment] ([id], [product_id], [user_id], [point], [content], [crt_time]) VALUES (4, 1, 1, 4, 123, '2020-03-07 18:00:50.030543');
INSERT INTO [app_comment] ([id], [product_id], [user_id], [point], [content], [crt_time]) VALUES (5, 2, 1, 3, 'werrew', '2020-03-07 18:01:15.847020');
INSERT INTO [app_comment] ([id], [product_id], [user_id], [point], [content], [crt_time]) VALUES (6, 2, 1, 2, '沃尔沃若翁', '2020-03-07 18:01:36.974228');
INSERT INTO [app_comment] ([id], [product_id], [user_id], [point], [content], [crt_time]) VALUES (7, 1, 2, 3, 23423432, '2020-03-08 03:54:13.953735');
INSERT INTO [app_comment] ([id], [product_id], [user_id], [point], [content], [crt_time]) VALUES (8, 3, 2, 4, 2123123213, '2020-03-08 03:55:39.182610');
INSERT INTO [app_comment] ([id], [product_id], [user_id], [point], [content], [crt_time]) VALUES (9, 1, 2, 5, 4554455454, '2020-03-08 03:56:20.294961');
INSERT INTO [app_comment] ([id], [product_id], [user_id], [point], [content], [crt_time]) VALUES (10, 1, 2, 4, '二维翁二翁', '2020-03-08 03:57:41.045580');
INSERT INTO [app_comment] ([id], [product_id], [user_id], [point], [content], [crt_time]) VALUES (11, 3, 2, 5, 'ertretre', '2020-03-08 03:57:46.355884');
INSERT INTO [app_comment] ([id], [product_id], [user_id], [point], [content], [crt_time]) VALUES (12, 2, 2, 5, '尔特瑞特让他', '2020-03-08 03:57:52.317225');
INSERT INTO [app_comment] ([id], [product_id], [user_id], [point], [content], [crt_time]) VALUES (13, 6, 2, 5, 21312312, '2020-03-08 07:15:44.727288');
INSERT INTO [app_comment] ([id], [product_id], [user_id], [point], [content], [crt_time]) VALUES (14, 7, 2, 5, 21312312, '2020-03-08 07:15:50.194600');
INSERT INTO [app_comment] ([id], [product_id], [user_id], [point], [content], [crt_time]) VALUES (15, 11, 2, 5, 'ok', '2020-03-08 07:44:32.650119');
INSERT INTO [app_comment] ([id], [product_id], [user_id], [point], [content], [crt_time]) VALUES (16, 14, 3, 3, 'ok1', '2020-03-08 07:44:47.198951');
INSERT INTO [app_comment] ([id], [product_id], [user_id], [point], [content], [crt_time]) VALUES (17, 1, 3, 5, 'heloo', '2020-03-08 07:48:38.178163');
INSERT INTO [app_comment] ([id], [product_id], [user_id], [point], [content], [crt_time]) VALUES (18, 2, 3, 5, 'heloo', '2020-03-08 07:48:54.741110');
INSERT INTO [app_comment] ([id], [product_id], [user_id], [point], [content], [crt_time]) VALUES (19, 1, 1, 5, '如题如题如题你', '2020-03-21 07:34:21.009943');
INSERT INTO [app_comment] ([id], [product_id], [user_id], [point], [content], [crt_time]) VALUES (20, 1, 1, 5, '热热', '2020-03-21 10:08:46.136878');
INSERT INTO [app_comment] ([id], [product_id], [user_id], [point], [content], [crt_time]) VALUES (21, 1, 1, 5, '好地方
', '2020-04-22 08:22:09.389763');

-- Table: app_note
CREATE TABLE app_note ( 
    id       INTEGER         PRIMARY KEY AUTOINCREMENT
                             NOT NULL,
    title    VARCHAR( 256 )  NOT NULL,
    content  TEXT            NOT NULL,
    crt_time DATETIME        NOT NULL 
);

INSERT INTO [app_note] ([id], [title], [content], [crt_time]) VALUES (1, '旅游注意事项1', '1 .行前预先规划旅游线路，充分了解交通路况。进入山区应注意塌方落石与路肩塌陷
2. 登山前特别注意服装和鞋子，尽量轻装上山，少带杂物以减轻负荷。
鞋子要选择球鞋、布鞋和旅游鞋等平底鞋，以免登山不便和有碍安全;借助手掌要注意选择长短、轻重合适与结实的拐杖。
在山路上行走时，必须注意滚石、陡坎，不紧跟在登山人的正后面以防滚石伤人。
3. 行前注意天气预报，适时增减衣服。遇雨时在山上不可用雨伞要用雨披，这是为防雷电，并防止山上大风连人带伞一起吹跑。
4. 要做到观景不走路，走路不观景;照相时要特别注意安全，要选择能保障安全的地点和角度，尤其要注意岩石有无风化松动。', '2020-03-21 02:31:23.122227');
INSERT INTO [app_note] ([id], [title], [content], [crt_time]) VALUES (2, '旅游注意事项2', '1 .行前预先规划旅游线路，充分了解交通路况。进入山区应注意塌方落石与路肩塌陷
2. 登山前特别注意服装和鞋子，尽量轻装上山，少带杂物以减轻负荷。
鞋子要选择球鞋、布鞋和旅游鞋等平底鞋，以免登山不便和有碍安全;借助手掌要注意选择长短、轻重合适与结实的拐杖。
在山路上行走时，必须注意滚石、陡坎，不紧跟在登山人的正后面以防滚石伤人。
3. 行前注意天气预报，适时增减衣服。遇雨时在山上不可用雨伞要用雨披，这是为防雷电，并防止山上大风连人带伞一起吹跑。
4. 要做到观景不走路，走路不观景;照相时要特别注意安全，要选择能保障安全的地点和角度，尤其要注意岩石有无风化松动。', '2020-03-21 05:47:38.673750');
INSERT INTO [app_note] ([id], [title], [content], [crt_time]) VALUES (3, '旅游注意事项3', '1 .行前预先规划旅游线路，充分了解交通路况。进入山区应注意塌方落石与路肩塌陷
2. 登山前特别注意服装和鞋子，尽量轻装上山，少带杂物以减轻负荷。
鞋子要选择球鞋、布鞋和旅游鞋等平底鞋，以免登山不便和有碍安全;借助手掌要注意选择长短、轻重合适与结实的拐杖。
在山路上行走时，必须注意滚石、陡坎，不紧跟在登山人的正后面以防滚石伤人。
3. 行前注意天气预报，适时增减衣服。遇雨时在山上不可用雨伞要用雨披，这是为防雷电，并防止山上大风连人带伞一起吹跑。
4. 要做到观景不走路，走路不观景;照相时要特别注意安全，要选择能保障安全的地点和角度，尤其要注意岩石有无风化松动。', '2020-03-21 05:47:48.765328');
INSERT INTO [app_note] ([id], [title], [content], [crt_time]) VALUES (4, '旅游注意事项4', '1 .行前预先规划旅游线路，充分了解交通路况。进入山区应注意塌方落石与路肩塌陷
2. 登山前特别注意服装和鞋子，尽量轻装上山，少带杂物以减轻负荷。
鞋子要选择球鞋、布鞋和旅游鞋等平底鞋，以免登山不便和有碍安全;借助手掌要注意选择长短、轻重合适与结实的拐杖。
在山路上行走时，必须注意滚石、陡坎，不紧跟在登山人的正后面以防滚石伤人。
3. 行前注意天气预报，适时增减衣服。遇雨时在山上不可用雨伞要用雨披，这是为防雷电，并防止山上大风连人带伞一起吹跑。
4. 要做到观景不走路，走路不观景;照相时要特别注意安全，要选择能保障安全的地点和角度，尤其要注意岩石有无风化松动。', '2020-03-21 05:47:58.563888');
INSERT INTO [app_note] ([id], [title], [content], [crt_time]) VALUES (5, '旅游注意事项5', '1 .行前预先规划旅游线路，充分了解交通路况。进入山区应注意塌方落石与路肩塌陷
2. 登山前特别注意服装和鞋子，尽量轻装上山，少带杂物以减轻负荷。
鞋子要选择球鞋、布鞋和旅游鞋等平底鞋，以免登山不便和有碍安全;借助手掌要注意选择长短、轻重合适与结实的拐杖。
在山路上行走时，必须注意滚石、陡坎，不紧跟在登山人的正后面以防滚石伤人。
3. 行前注意天气预报，适时增减衣服。遇雨时在山上不可用雨伞要用雨披，这是为防雷电，并防止山上大风连人带伞一起吹跑。
4. 要做到观景不走路，走路不观景;照相时要特别注意安全，要选择能保障安全的地点和角度，尤其要注意岩石有无风化松动。', '2020-03-21 05:48:06.994370');
INSERT INTO [app_note] ([id], [title], [content], [crt_time]) VALUES (6, '旅游注意事项6', '1 .行前预先规划旅游线路，充分了解交通路况。进入山区应注意塌方落石与路肩塌陷
2. 登山前特别注意服装和鞋子，尽量轻装上山，少带杂物以减轻负荷。
鞋子要选择球鞋、布鞋和旅游鞋等平底鞋，以免登山不便和有碍安全;借助手掌要注意选择长短、轻重合适与结实的拐杖。
在山路上行走时，必须注意滚石、陡坎，不紧跟在登山人的正后面以防滚石伤人。
3. 行前注意天气预报，适时增减衣服。遇雨时在山上不可用雨伞要用雨披，这是为防雷电，并防止山上大风连人带伞一起吹跑。
4. 要做到观景不走路，走路不观景;照相时要特别注意安全，要选择能保障安全的地点和角度，尤其要注意岩石有无风化松动。', '2020-03-21 05:48:18.391022');

-- Table: app_room
CREATE TABLE app_room ( 
    id        INTEGER PRIMARY KEY AUTOINCREMENT
                      NOT NULL,
    hotel_id  INTEGER NOT NULL
                      REFERENCES app_hotel ( id ),
    roomType  INTEGER NOT NULL,
    breakfast INTEGER NOT NULL,
    price     INTEGER NOT NULL,
    [desc]    TEXT,
    num       INT 
);

INSERT INTO [app_room] ([id], [hotel_id], [roomType], [breakfast], [price], [desc], [num]) VALUES (1, 1, 1, 0, 180, '超级便宜的房间，很适合单个住', 30);
INSERT INTO [app_room] ([id], [hotel_id], [roomType], [breakfast], [price], [desc], [num]) VALUES (2, 2, 1, 1, 240, '环境很好，早餐很丰富', 24);
INSERT INTO [app_room] ([id], [hotel_id], [roomType], [breakfast], [price], [desc], [num]) VALUES (3, 2, 2, 1, 360, '双人间更舒适，双人套餐更豪华', 15);
INSERT INTO [app_room] ([id], [hotel_id], [roomType], [breakfast], [price], [desc], [num]) VALUES (4, 3, 2, 0, 520, '豪华装修', 13);
INSERT INTO [app_room] ([id], [hotel_id], [roomType], [breakfast], [price], [desc], [num]) VALUES (5, 3, 1, 1, 240, '环境很好，早餐很丰富', 21);
INSERT INTO [app_room] ([id], [hotel_id], [roomType], [breakfast], [price], [desc], [num]) VALUES (6, 3, 1, 1, 240, '环境很好，早餐很丰富', 22);
INSERT INTO [app_room] ([id], [hotel_id], [roomType], [breakfast], [price], [desc], [num]) VALUES (7, 4, 1, 1, 240, '环境很好，早餐很丰富', 25);
INSERT INTO [app_room] ([id], [hotel_id], [roomType], [breakfast], [price], [desc], [num]) VALUES (8, 4, 1, 1, 240, '环境很好，早餐很丰富', 26);
INSERT INTO [app_room] ([id], [hotel_id], [roomType], [breakfast], [price], [desc], [num]) VALUES (9, 5, 1, 1, 240, '环境很好，早餐很丰富', 28);
INSERT INTO [app_room] ([id], [hotel_id], [roomType], [breakfast], [price], [desc], [num]) VALUES (10, 5, 1, 1, 240, '环境很好，早餐很丰富', 29);
INSERT INTO [app_room] ([id], [hotel_id], [roomType], [breakfast], [price], [desc], [num]) VALUES (11, 5, 1, 1, 240, '环境很好，早餐很丰富', 51);
INSERT INTO [app_room] ([id], [hotel_id], [roomType], [breakfast], [price], [desc], [num]) VALUES (12, 6, 1, 1, 240, '环境很好，早餐很丰富', 18);
INSERT INTO [app_room] ([id], [hotel_id], [roomType], [breakfast], [price], [desc], [num]) VALUES (13, 6, 1, 1, 240, '环境很好，早餐很丰富', 16);
INSERT INTO [app_room] ([id], [hotel_id], [roomType], [breakfast], [price], [desc], [num]) VALUES (14, 7, 1, 1, 240, '环境很好，早餐很丰富', 19);
INSERT INTO [app_room] ([id], [hotel_id], [roomType], [breakfast], [price], [desc], [num]) VALUES (15, 7, 1, 1, 240, '环境很好，早餐很丰富', 30);
INSERT INTO [app_room] ([id], [hotel_id], [roomType], [breakfast], [price], [desc], [num]) VALUES (16, 8, 1, 1, 240, '环境很好，早餐很丰富', 32);
INSERT INTO [app_room] ([id], [hotel_id], [roomType], [breakfast], [price], [desc], [num]) VALUES (17, 8, 2, 1, 240, '环境很好，早餐很丰富', 28);
INSERT INTO [app_room] ([id], [hotel_id], [roomType], [breakfast], [price], [desc], [num]) VALUES (18, 8, 1, 1, 240, '环境很好，早餐很丰富', 27);
INSERT INTO [app_room] ([id], [hotel_id], [roomType], [breakfast], [price], [desc], [num]) VALUES (19, 8, 3, 1, 240, '环境很好，早餐很丰富', 74);
INSERT INTO [app_room] ([id], [hotel_id], [roomType], [breakfast], [price], [desc], [num]) VALUES (20, 5, 1, 1, 240, '环境很好，早餐很丰富', 77);
INSERT INTO [app_room] ([id], [hotel_id], [roomType], [breakfast], [price], [desc], [num]) VALUES (21, 5, 2, 1, 240, '环境很好，早餐很丰富', 75);

-- Table: app_order
CREATE TABLE app_order ( 
    id         INTEGER        PRIMARY KEY AUTOINCREMENT
                              NOT NULL,
    hotel_id   INTEGER,
    room_id    INTEGER,
    order_date VARCHAR( 64 ),
    num        INTEGER,
    user_id    INTEGER,
    crt_time   DATETIME 
);

INSERT INTO [app_order] ([id], [hotel_id], [room_id], [order_date], [num], [user_id], [crt_time]) VALUES (1, 1, 1, '2019-05-01', 1, 1, '2020-04-22 09:12:25.570278');
INSERT INTO [app_order] ([id], [hotel_id], [room_id], [order_date], [num], [user_id], [crt_time]) VALUES (2, 2, 2, '2019-05-05', 2, 1, '2020-04-22 09:13:14.840096');
INSERT INTO [app_order] ([id], [hotel_id], [room_id], [order_date], [num], [user_id], [crt_time]) VALUES (3, 2, 2, '2019-05-04', 1, 1, '2020-04-22 09:15:46.639779');

-- Index: auth_group_permissions_group_id_permission_id_0cd325b0_uniq
CREATE UNIQUE INDEX auth_group_permissions_group_id_permission_id_0cd325b0_uniq ON auth_group_permissions ( 
    group_id,
    permission_id 
);


-- Index: auth_group_permissions_group_id_b120cbf9
CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON auth_group_permissions ( 
    group_id 
);


-- Index: auth_group_permissions_permission_id_84c5c92e
CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON auth_group_permissions ( 
    permission_id 
);


-- Index: auth_user_groups_user_id_group_id_94350c0c_uniq
CREATE UNIQUE INDEX auth_user_groups_user_id_group_id_94350c0c_uniq ON auth_user_groups ( 
    user_id,
    group_id 
);


-- Index: auth_user_groups_user_id_6a12ed8b
CREATE INDEX auth_user_groups_user_id_6a12ed8b ON auth_user_groups ( 
    user_id 
);


-- Index: auth_user_groups_group_id_97559544
CREATE INDEX auth_user_groups_group_id_97559544 ON auth_user_groups ( 
    group_id 
);


-- Index: auth_user_user_permissions_user_id_permission_id_14a6b632_uniq
CREATE UNIQUE INDEX auth_user_user_permissions_user_id_permission_id_14a6b632_uniq ON auth_user_user_permissions ( 
    user_id,
    permission_id 
);


-- Index: auth_user_user_permissions_user_id_a95ead1b
CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON auth_user_user_permissions ( 
    user_id 
);


-- Index: auth_user_user_permissions_permission_id_1fbb5f2c
CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON auth_user_user_permissions ( 
    permission_id 
);


-- Index: django_admin_log_content_type_id_c4bce8eb
CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON django_admin_log ( 
    content_type_id 
);


-- Index: django_admin_log_user_id_c564eba6
CREATE INDEX django_admin_log_user_id_c564eba6 ON django_admin_log ( 
    user_id 
);


-- Index: django_content_type_app_label_model_76bd3d3b_uniq
CREATE UNIQUE INDEX django_content_type_app_label_model_76bd3d3b_uniq ON django_content_type ( 
    app_label,
    model 
);


-- Index: auth_permission_content_type_id_codename_01ab375a_uniq
CREATE UNIQUE INDEX auth_permission_content_type_id_codename_01ab375a_uniq ON auth_permission ( 
    content_type_id,
    codename 
);


-- Index: auth_permission_content_type_id_2f476e4b
CREATE INDEX auth_permission_content_type_id_2f476e4b ON auth_permission ( 
    content_type_id 
);


-- Index: django_session_expire_date_a5c62663
CREATE INDEX django_session_expire_date_a5c62663 ON django_session ( 
    expire_date 
);

