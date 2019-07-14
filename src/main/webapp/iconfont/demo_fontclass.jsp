
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>IconFont</title>
    <link rel="stylesheet" href="demo.css">
    <link rel="stylesheet" href="iconfont.css">
</head>
<body>
    <div class="main markdown">
        <h1>IconFont 图标</h1>
        <ul class="icon_lists clear">
            
                <li>
                <i class="icon iconfont icon-appreciate"></i>
                    <div class="name">appreciate</div>
                    <div class="fontclass">.icon-appreciate</div>
                </li>
            
                <li>
                <i class="icon iconfont icon-emoji"></i>
                    <div class="name">emoji</div>
                    <div class="fontclass">.icon-emoji</div>
                </li>
            
                <li>
                <i class="icon iconfont icon-unfold"></i>
                    <div class="name">unfold</div>
                    <div class="fontclass">.icon-unfold</div>
                </li>
            
                <li>
                <i class="icon iconfont icon-back"></i>
                    <div class="name">back</div>
                    <div class="fontclass">.icon-back</div>
                </li>
            
                <li>
                <i class="icon iconfont icon-right"></i>
                    <div class="name">right</div>
                    <div class="fontclass">.icon-right</div>
                </li>
            
                <li>
                <i class="icon iconfont icon-square"></i>
                    <div class="name">square</div>
                    <div class="fontclass">.icon-square</div>
                </li>
            
                <li>
                <i class="icon iconfont icon-squarecheck"></i>
                    <div class="name">square_check</div>
                    <div class="fontclass">.icon-squarecheck</div>
                </li>
            
                <li>
                <i class="icon iconfont icon-fold"></i>
                    <div class="name">fold</div>
                    <div class="fontclass">.icon-fold</div>
                </li>
            
                <li>
                <i class="icon iconfont icon-mark"></i>
                    <div class="name">mark</div>
                    <div class="fontclass">.icon-mark</div>
                </li>
            
                <li>
                <i class="icon iconfont icon-calendar"></i>
                    <div class="name">calendar</div>
                    <div class="fontclass">.icon-calendar</div>
                </li>
            
                <li>
                <i class="icon iconfont icon-appreciate_fill_light"></i>
                    <div class="name">appreciate_fill_light</div>
                    <div class="fontclass">.icon-appreciate_fill_light</div>
                </li>
            
                <li>
                <i class="icon iconfont icon-oppose_fill_light"></i>
                    <div class="name">oppose_fill_light</div>
                    <div class="fontclass">.icon-oppose_fill_light</div>
                </li>
            
                <li>
                <i class="icon iconfont icon-oppose_light"></i>
                    <div class="name">oppose_light</div>
                    <div class="fontclass">.icon-oppose_light</div>
                </li>
            
        </ul>

        <h2 id="font-class-">font-class引用</h2>
        <hr>

        <p>font-class是unicode使用方式的一种变种，主要是解决unicode书写不直观，语意不明确的问题。</p>
        <p>与unicode使用方式相比，具有如下特点：</p>
        <ul>
        <li>兼容性良好，支持ie8+，及所有现代浏览器。</li>
        <li>相比于unicode语意明确，书写更直观。可以很容易分辨这个icon是什么。</li>
        <li>因为使用class来定义图标，所以当要替换图标时，只需要修改class里面的unicode引用。</li>
        <li>不过因为本质上还是使用的字体，所以多色图标还是不支持的。</li>
        </ul>
        <p>使用步骤如下：</p>
        <h3 id="-fontclass-">第一步：引入项目下面生成的fontclass代码：</h3>


        <pre><code class="lang-js hljs javascript"><span class="hljs-comment">&lt;link rel="stylesheet" type="text/css" href="./iconfont.css"&gt;</span></code></pre>
        <h3 id="-">第二步：挑选相应图标并获取类名，应用于页面：</h3>
        <pre><code class="lang-css hljs">&lt;<span class="hljs-selector-tag">i</span> <span class="hljs-selector-tag">class</span>="<span class="hljs-selector-tag">iconfont</span> <span class="hljs-selector-tag">icon-xxx</span>"&gt;&lt;/<span class="hljs-selector-tag">i</span>&gt;</code></pre>
        <blockquote>
        <p>"iconfont"是你项目下的font-family。可以通过编辑项目查看，默认是"iconfont"。</p>
        </blockquote>
    </div>
</body>
</html>
