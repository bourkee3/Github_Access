# Get this figure: fig <- get_figure("bourkee3", 4)
# Get this figure's data: data <- get_figure("bourkee3", 4)$data
# Add data to this figure: p <- add_trace(p, x=c(4, 5), y=c(4, 5), kwargs=list(filename="Followers vs Following", fileopt="extend"))
# Get y data of first trace: y1 <- get_figure("bourkee3", 4)$data[[1]]$y

# Get figure documentation: https://plot.ly/r/get-requests/
# Add data documentation: https://plot.ly/r/file-options/

# You can reproduce this figure in R with the following code!

# Learn about API authentication here: https://plot.ly/r/getting-started
# Find your api_key here: https://plot.ly/settings/api

library(plotly)
trace1 <- list(
  x = c(51, 10, 7, 13, 7, 143, 15, 38, 15, 4, 12, 95, 7, 0, 54, 0, 32, 2, 1, 5, 0, 31, 46, 1, 19, 0, 49, 28, 6, 6, 47, 3, 13, 8, 2, 27, 4, 1, 30, 87, 0, 26, 2, 24, 1, 2, 7, 0, 0, 0, 0, 0, 0, 0, 11, 208, 30, 17, 165, 19, 83, 24, 7, 193, 57, 94, 289, 5, 100, 41, 117, 1, 3, 225, 19, 149, 37, 2, 24, 0, 118, 73, 11, 60, 4, 5, 49, 0, 129, 209, 19, 0, 93, 32, 18, 0, 37, 20, 105, 17, 0, 12, 14, 11, 20, 13, 267, 9, 54, 39, 1, 121, 8, 47, 6, 1, 147, 3, 54, 23, 36, 0, 171, 7, 18, 0, 19, 65, 33, 40, 3, 55, 40, 14, 61, 12, 16, 2, 78, 3, 3, 0, 18, 3, 23, 60, 1, 444, 418, 6, 30, 14, 39, 713, 0, 21, 16, 100, 53, 21, 28, 5, 10, 41, 22, 3, 624, 40, 17, 28, 68, 29, 15, 56, 146, 6, 0, 2, 55, 14, 46, 0, 12, 1649, 7, 34, 8, 0, 2, 17, 8, 0, 15, 99, 52, 163, 21, 74, 0, 41, 26, 47, 38, 28, 13, 8, 27, 46, 66, 31, 115, 30, 134, 38, 78, 12, 4, 132, 8, 15, 8, 2, 31, 253, 25, 8, 113, 32, 5, 0, 15, 10, 3, 0, 15, 6, 1, 0, 4, 6, 8, 1, 49, 0, 1, 85, 107, 156, 16, 160, 130, 54, 566, 12, 0, 13, 111, 43, 49, 37, 15, 5, 0, 40, 25, 17, 166, 19, 18, 16, 16, 11, 92, 0, 58, 3, 0, 3, 31, 8, 0, 22, 0, 0, 6, 7, 5, 8, 37, 28, 66, 24, 10, 20, 67, 18, 11, 36, 43, 101, 435, 82, 26, 202, 0, 137, 23, 0, 102, 1, 17, 32, 89, 25, 1, 0, 2, 12, 10, 7, 48, 128, 49, 20, 46, 1, 40, 0, 0, 147, 46, 0, 0, 0, 51, 0, 29, 0, 47, 209, 18, 0, 76, 13, 50, 1, 32, 81, 27, 0, 18, 141, 85, 0, 125, 0, 2, 0, 68, 41, 27, 37, 0, 24, 22, 526, 98, 260, 21, 12, 14, 21, 0, 75, 4, 56, 59, 1, 1, 7, 39, 27, 0, 33, 1, 1, 0, 22, 56, 1, 0, 1, 0, 0, 4, 10, 60, 20, 7, 33, 0, 1, 17, 32, 31, 13, 0, 58, 7, 46, 32, 0, 0, 3, 6, 7, 1, 0, 16, 7, 8, 0, 47, 69, 10, 3, 2, 5, 57, 98, 0, 1, 18, 11, 52, 0, 0, 2, 107, 44, 8, 11, 5, 14, 437, 11, 0, 46, 108, 62, 42, 71, 5, 193, 135, 27, 310, 2, 2, 23, 50, 1), 
  y = c(939, 324, 185, 33, 69, 1302, 58, 230, 2108, 64, 782, 784, 158, 14, 452, 22, 37, 725, 33, 234, 51, 420, 200, 13, 23, 2328, 1061, 521, 187, 614, 323, 235, 1540, 141, 41, 1154, 36, 101, 227, 84, 27, 100, 480, 41, 68, 73, 704, 363, 69, 120, 3347, 72, 644, 2317, 20659, 16610, 8192, 2404, 1062, 1143, 569, 11742, 154, 474, 2054, 7005, 431, 599, 2082, 192, 644, 533, 6464, 747, 189, 513, 1078, 1535, 1258, 226, 2030, 711, 71, 52, 8596, 1095, 1178, 20, 1004, 1497, 37, 525, 134, 716, 36, 5421, 450, 1125, 3492, 3084, 11018, 59, 1601, 1438, 6339, 102, 173, 258, 1032, 567, 70, 1403, 1758, 82, 1364, 619, 740, 173, 4146, 2716, 10753, 1576, 789, 18, 60, 307, 892, 84, 173, 89, 262, 65, 116, 36, 129, 13, 234, 106, 274, 163, 5, 62, 93, 172, 434, 740, 378, 125, 113, 20, 586, 567, 535, 326, 169, 9338, 2468, 586, 301, 3403, 2906, 184, 443, 3951, 111, 699, 1177, 469, 69, 52, 362, 14221, 37, 74, 73, 1039, 32, 7248, 118, 193, 32457, 3511, 92, 167, 14, 23, 361, 20, 15, 122, 2970, 138, 16, 473, 109, 100, 166, 175, 96, 911, 23, 165, 28, 164, 1838, 24, 106, 165, 1009, 205, 1032, 1385, 150, 1311, 250, 42183, 6, 145, 863, 21, 99, 22, 15, 27688, 1266, 208, 1003, 15, 13, 25, 496, 284, 7434, 74, 399, 147, 15629, 1644, 112, 625, 1235, 10938, 2434, 638, 2114, 331, 1692, 3555, 35, 518, 13850, 597, 531, 160, 679, 58, 493, 31, 87, 153, 16, 88, 15, 81, 2540, 566, 1169, 103, 16, 37, 670, 1016, 1015, 946, 3492, 8676, 169, 1447, 1594, 368, 490, 780, 2, 336, 365, 41, 109, 499, 1651, 936, 3386, 3471, 822, 535, 1049, 77, 537, 114, 107, 1353, 2939, 210, 940, 133, 3019, 859, 512, 2744, 2435, 1535, 127, 1817, 24643, 198, 817, 94, 2895, 55, 407, 1074, 1136, 3085, 1208, 312, 1025, 465, 27, 551, 51, 257, 462, 139, 276, 33, 297, 19, 94, 23, 783, 1070, 678, 1395, 6104, 71, 133, 10, 1002, 355, 54, 6246, 176, 568, 2028, 468, 8838, 15913, 34, 3301, 2574, 1128, 4600, 2222, 123, 291, 1441, 28, 332, 346, 116, 437, 482, 41, 630, 146, 931, 220, 65, 20, 436, 1292, 474, 230, 394, 394, 18, 127, 3, 17, 149, 35, 94, 31, 107, 14, 41, 53, 98, 276, 150, 1389, 784, 165, 33, 13, 31, 9, 8, 138, 106, 86, 66, 767, 2, 3, 2, 10, 2, 3, 270, 612, 87, 1521, 4042, 176, 28, 991, 229, 391, 9160, 1061, 4, 414, 252, 32, 173, 11073, 2170, 7679, 1019, 169, 17, 12, 231, 339, 100, 711, 3822, 141, 139, 575, 306, 28, 7, 47, 73, 97, 3846, 6, 27, 32, 54, 2), 
  hoverinfo = "x+y+text", 
  marker = list(
    autocolorscale = FALSE, 
    cauto = TRUE, 
    cmax = 8, 
    cmin = 0, 
    color = "rgb(172, 31, 180)", 
    colorscale = list(c(0, "rgb(221, 42, 145)"),list(0.35, "rgb(177, 77, 236)"),list(0.5, "rgb(118, 117, 237)"),list(0.6, "rgb(46, 142, 191)"),list(0.7, "rgb(11, 152, 121)"),list(1, "rgb(19, 152, 99)")), 
    showscale = FALSE, 
    size = c(51, 10, 7, 13, 7, 143, 15, 38, 15, 4, 12, 95, 7, 0, 54, 0, 32, 2, 1, 5, 0, 31, 46, 1, 19, 0, 49, 28, 6, 6, 47, 3, 13, 8, 2, 27, 4, 1, 30, 87, 0, 26, 2, 24, 1, 2, 7, 0, 0, 0, 0, 0, 0, 0, 11, 208, 30, 17, 165, 19, 83, 24, 7, 193, 57, 94, 289, 5, 100, 41, 117, 1, 3, 225, 19, 149, 37, 2, 24, 0, 118, 73, 11, 60, 4, 5, 49, 0, 129, 209, 19, 0, 93, 32, 18, 0, 37, 20, 105, 17, 0, 12, 14, 11, 20, 13, 267, 9, 54, 39, 1, 121, 8, 47, 6, 1, 147, 3, 54, 23, 36, 0, 171, 7, 18, 0, 19, 65, 33, 40, 3, 55, 40, 14, 61, 12, 16, 2, 78, 3, 3, 0, 18, 3, 23, 60, 1, 444, 418, 6, 30, 14, 39, 713, 0, 21, 16, 100, 53, 21, 28, 5, 10, 41, 22, 3, 624, 40, 17, 28, 68, 29, 15, 56, 146, 6, 0, 2, 55, 14, 46, 0, 12, 1649, 7, 34, 8, 0, 2, 17, 8, 0, 15, 99, 52, 163, 21, 74, 0, 41, 26, 47, 38, 28, 13, 8, 27, 46, 66, 31, 115, 30, 134, 38, 78, 12, 4, 132, 8, 15, 8, 2, 31, 253, 25, 8, 113, 32, 5, 0, 15, 10, 3, 0, 15, 6, 1, 0, 4, 6, 8, 1, 49, 0, 1, 85, 107, 156, 16, 160, 130, 54, 566, 12, 0, 13, 111, 43, 49, 37, 15, 5, 0, 40, 25, 17, 166, 19, 18, 16, 16, 11, 92, 0, 58, 3, 0, 3, 31, 8, 0, 22, 0, 0, 6, 7, 5, 8, 37, 28, 66, 24, 10, 20, 67, 18, 11, 36, 43, 101, 435, 82, 26, 202, 0, 137, 23, 0, 102, 1, 17, 32, 89, 25, 1, 0, 2, 12, 10, 7, 48, 128, 49, 20, 46, 1, 40, 0, 0, 147, 46, 0, 0, 0, 51, 0, 29, 0, 47, 209, 18, 0, 76, 13, 50, 1, 32, 81, 27, 0, 18, 141, 85, 0, 125, 0, 2, 0, 68, 41, 27, 37, 0, 24, 22, 526, 98, 260, 21, 12, 14, 21, 0, 75, 4, 56, 59, 1, 1, 7, 39, 27, 0, 33, 1, 1, 0, 22, 56, 1, 0, 1, 0, 0, 4, 10, 60, 20, 7, 33, 0, 1, 17, 32, 31, 13, 0, 58, 7, 46, 32, 0, 0, 3, 6, 7, 1, 0, 16, 7, 8, 0, 47, 69, 10, 3, 2, 5, 57, 98, 0, 1, 18, 11, 52, 0, 0, 2, 107, 44, 8, 11, 5, 14, 437, 11, 0, 46, 108, 62, 42, 71, 5, 193, 135, 27, 310, 2, 2, 23, 50, 1), 
    sizemode = "area", 
    sizeref = 2.06125, 
    sizesrc = "bourkee3:2:UWSHHOBRL9BOQK63XH3DHBLUWY18D8DE", 
    symbol = "circle"
  ), 
  mode = "markers", 
  name = "Followers", 
  opacity = 1, 
  text = c("macournoyer", "evmar", "slact", "nikolasco", "natan", "graydon", "decklin", "apparentlymart", "DmitryBaranovskiy", "a2800276", "frsyuki", "tmpvar", "natfriedman", "dpacheco", "evanmiller", "premshree", "tobin", "piscisaureus", "rtsuk", "davepacheco", "HenryRawas", "divan", "MechCoder", "ryjm", "lisza", "KaimingHe", "kbrsh", "broady", "hanwen", "rui314", "nickoneill", "josharian", "nf", "aboodman", "whitaker", "jbenet", "CSEMike", "remyoudompheng", "dpup", "summerwind", "mcmanus", "ality", "tatsuhiro-t", "saljam", "RLH", "wathiede", "aclements", "ianlancetaylor", "bcmills", "randall77", "PresidentObamaBot", "4a6f656c", "griesemer", "ken", "mojombo", "defunkt", "pjhyett", "technoweenie", "atmos", "bmizerany", "jnewland", "schacon", "benburkert", "sr", "josh", "ryanb", "mtodd", "maddox", "rtomayko", "eric", "nakajima", "probablycorey", "tekkub", "ericflo", "paulca", "bryanveloso", "kneath", "paulcbetts", "chriseppstein", "pedro", "tmm1", "jbarnette", "demonbane", "webandy", "wycats", "evanphx", "bkeepers", "norbauer", "jeremy", "jnunemaker", "daveliu", "FooBarWidget", "sunfmin", "mbleigh", "antage", "mitchellh", "ashchan", "scrooloose", "maccman", "sstephenson", "dhh", "maxime", "mperham", "fnando", "tenderlove", "nowa", "kaichen", "jlong", "al3x", "jchris", "gnosek", "janl", "dcramer", "dazuiba", "jverkoey", "finiteloop", "codylindley", "jeffkaufman", "alanhamlett", "madeye", "clowwindy", "codahale", "auser", "michaelmelanson", "rubbish", "seancribbs", "dustin", "tim", "archaelus", "hntrmrrs", "moonpolysoft", "JonGretar", "etnt", "keymone", "kuenishi", "filippo", "emqplus", "yariv", "ngerakines", "kevsmith", "Arbow", "kocolosk", "raycmorgan", "rustyio", "RJ", "videlalvaro", "daleharvey", "agladysh", "abecciu", "x6j8x", "jamesgolick", "stevedekorte", "atduskgreg", "ELLIOTTCABLE", "evan", "tpope", "kangax", "voodootikigod", "judofyr", "mikeal", "progrium", "lstoll", "mde", "alex", "weepy", "soveran", "brianleroux", "quirkey", "benhiller", "harryf", "mikewest", "jeresig", "markjeee", "sah", "wuzhe", "weavejester", "dcolthorp", "josevalim", "litaocheng", "hjiang", "tj", "richhickey", "hiredman", "stonegao", "sander", "niedhui", "trawor", "aravind", "grammati", "jonase", "nathanmarz", "Engelberg", "zhuangxm", "sunng87", "moonranger", "doubaokun", "monadbobo", "ym", "ahiguti", "xushiwei", "lbt05", "mootoh", "liwei", "takuma104", "livid", "roamlog", "BRMatt", "samsoir", "fredwu", "cxa", "tualatrix", "lzyy", "chunzi", "kishikawakatsumi", "tzangms", "JakeWharton", "ccdjh", "CNBorn", "omz", "makestory", "al-the-x", "Yahasana", "fengjing", "addyosmani", "MugunthKumar", "tokudu", "grp", "mhb0925", "milescui", "sergeylenkov", "robey", "perusio", "agentzh", "etexteditor", "derekcollison", "rzwitserloot", "mdo", "joearms", "szegedi", "dcaoyuan", "armon", "cloudwu", "litesuits", "java-decompiler", "tencent-wechat", "robhudson", "jezdez", "huacnlee", "winfield", "lgn21st", "mattt", "sishen", "pmq20", "phuang", "feelinglucky", "est", "lidaobing", "philn", "hlxwell", "billy3321", "bbbush", "lovelywcm", "garnacho", "luosheng", "chloerei", "hayeah", "tianyicui", "iven", "albert748", "frankyue", "wayneeseguin", "jinzhu", "bfirsh", "yole", "joshlong", "antirez", "costin", "dsyer", "olivergierke", "sdeleuze", "clayallsopp", "philwebb", "operator-zz", "svtk", "mstahv", "wenerme", "dchen1107", "jjgod", "joshaber", "0xced", "steipete", "mxcl", "robrix", "zellux", "egonSchiele", "overboming", "ohdarling", "dismory", "chrisyip", "robb", "lexrus", "Leask", "cyfdecyf", "fannheyward", "mikeash", "indragiek", "Naituw", "zedshaw", "jspahrsummers", "nixzhu", "waynezhang", "romaonthego", "yyx990803", "bmabey", "stuarthalloway", "tobias", "aphyr", "pjstadig", "josephwilk", "jboner", "fogus", "swannodette", "killme2008", "dakrone", "ztellman", "cemerick", "shenjunru", "stuartsierra", "jafingerhut", "brandonbloom", "ptaoussanis", "brentonashworth", "krasserm", "mylesmegyesi", "mikera", "wagjo", "qiuxiafei", "tnc", "xumingming", "hotoo", "kejinlu", "samvermette", "lepture", "gaowhen", "shaoshuai0102", "ppanyong", "levey", "keefo", "wsvn53", "nzakas", "shawphy", "fitzgen", "yiminghe", "csnover", "BYVoid", "douglascrockford", "nathanacurtis", "evancz", "joyeecheung", "livoras", "bradfitz", "davecheney", "yuin", "BohuTANG", "codegangsta", "ccl0326", "xiaohanyu", "lichuang", "spacewander", "olabini", "yugui", "eto", "ko1", "koichiro", "headius", "authorNari", "miura1729", "AdamSpitz", "brettcannon", "chaoslawful", "luikore", "krestenkrab", "andreasgal", "SaitoWu", "changm", "aamine", "stefmoon", "pjBooms", "gafter", "stevenknown", "vancem", "russellhadley", "AndyAyersMS", "cmckinsey", "shawnchain", "QuChao", "b123400", "uliwitness", "yyfrankyy", "be5invis", "fqrouter", "Yonsm", "nunonunes", "Madril", "smpb", "wisewolf", "ppinheiro76", "jponge", "thatcher", "cretz", "Filirom1", "rstoyanchev", "worldlinexx", "dbellemin", "ABoissezon", "tigerlyb", "irinacheng", "Absl", "TheRealKerni", "steventroughtonsmith", "HansPinckaers", "mattgemmell", "yihui", "Perspx", "bentford", "odrobnik", "kentnguyen", "PrimaryFeather", "ibireme", "jamztang", "yebw", "mpospese", "JonasGessner", "missdora", "tracy-e", "jashkenas", "ariya", "isaacs", "dexteryy", "jollychang", "larme", "zzn2", "cliftonc", "lembacon", "soasme", "hongqn", "vim-scripts", "sprhawk", "houkanshan", "iwillwen", "matthew-andrews", "masakichi", "varstr", "Anthonyeef", "onestarshang", "greenisus", "soffes", "thinkdevcode", "Marionumber1", "jesseXu", "rhyzx", "traintrackcn"), 
  textsrc = "bourkee3:2:5MYXX8Y2WVVAB8UXWUC8R63MLF4E5ES5", 
  type = "scatter", 
  uid = "418f4b", 
  xsrc = "bourkee3:2:UWSHHOBRL9BOQK63XH3DHBLUWY18D8DE", 
  ysrc = "bourkee3:2:3OXISLVJTU2LZYB4B6OUD25W1670UUQX"
)
data <- list(trace1)
layout <- list(
  autosize = FALSE, 
  font = list(
    family = "Roboto", 
    size = 14
  ), 
  height = 450, 
  hovermode = "closest", 
  paper_bgcolor = "rgb(210, 244, 255)", 
  plot_bgcolor = "rgb(210, 244, 255)", 
  title = "<b>Number of Followers vs Number of Following</b>", 
  titlefont = list(
    family = "Roboto", 
    size = 20
  ), 
  width = 700, 
  xaxis = list(
    autorange = TRUE, 
    domain = c(0, 1), 
    gridcolor = "rgb(212, 216, 216)", 
    gridwidth = 1, 
    range = c(-107.394218921, 1825.70172166), 
    title = "<b>Following</b>", 
    titlefont = list(size = 17), 
    type = "linear", 
    zerolinecolor = "rgb(6, 6, 6)", 
    zerolinewidth = 1
  ), 
  yaxis = list(
    autorange = TRUE, 
    range = c(-6756.02438672, 45368.3802855), 
    title = "<b>Followers</b>", 
    type = "linear"
  )
)
p <- plot_ly()
p <- add_trace(p, x=trace1$x, y=trace1$y, hoverinfo=trace1$hoverinfo, marker=trace1$marker, mode=trace1$mode, name=trace1$name, opacity=trace1$opacity, text=trace1$text, textsrc=trace1$textsrc, type=trace1$type, uid=trace1$uid, xsrc=trace1$xsrc, ysrc=trace1$ysrc)
p <- layout(p, autosize=layout$autosize, font=layout$font, height=layout$height, hovermode=layout$hovermode, paper_bgcolor=layout$paper_bgcolor, plot_bgcolor=layout$plot_bgcolor, title=layout$title, titlefont=layout$titlefont, width=layout$width, xaxis=layout$xaxis, yaxis=layout$yaxis)