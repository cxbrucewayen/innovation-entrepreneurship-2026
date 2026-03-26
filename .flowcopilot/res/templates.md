# 幻灯片模板参考

## CSS基础模板

```css
/* 幻灯片样式模板 */

:root {
  --primary: #17408B;
  --primary-dark: #0d2654;
  --secondary: #C9082A;
  --accent: #FDB927;
  --accent-light: #ffe066;
  --white: #ffffff;
  --dark: #1a1a1a;
  --shadow: rgba(0, 0, 0, 0.3);
}

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

html, body {
  width: 100%;
  height: 100%;
  overflow: hidden;
  font-family: 'PingFang SC', 'Microsoft YaHei', Arial, sans-serif;
}

/* 幻灯片容器 - 16:9 */
.slide {
  width: 100vw;
  height: 100vh;
  overflow: hidden;
  position: relative;
  background: linear-gradient(135deg, var(--primary-dark), var(--primary));
  color: var(--white);
  display: flex;
  flex-direction: column;
  padding: 3vh 4vw;
}

/* 标题样式 */
.slide-title {
  font-size: clamp(28px, 4vw, 48px);
  font-weight: 700;
  text-align: center;
  margin-bottom: 2vh;
}

.slide-title.gold {
  background: linear-gradient(135deg, var(--accent), var(--accent-light));
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}

.slide-subtitle {
  font-size: clamp(16px, 2vw, 28px);
  color: var(--accent);
  text-align: center;
  margin-bottom: 3vh;
}

/* 内容区域 */
.content {
  flex: 1;
  display: flex;
  flex-direction: column;
  justify-content: center;
  overflow: hidden;
}

/* 卡片 */
.card {
  background: rgba(255, 255, 255, 0.1);
  backdrop-filter: blur(10px);
  border-radius: 12px;
  padding: 2vh 2vw;
  border: 1px solid rgba(255, 255, 255, 0.2);
}

.card-title {
  font-size: clamp(18px, 2.5vw, 28px);
  font-weight: 600;
  color: var(--accent);
  margin-bottom: 1vh;
}

/* 网格布局 */
.grid-2 { display: grid; grid-template-columns: repeat(2, 1fr); gap: 2vw; }
.grid-3 { display: grid; grid-template-columns: repeat(3, 1fr); gap: 2vw; }
.grid-4 { display: grid; grid-template-columns: repeat(4, 1fr); gap: 1.5vw; }

/* 表格 */
.data-table {
  width: 100%;
  border-collapse: collapse;
  font-size: clamp(12px, 1.3vw, 18px);
}

.data-table th {
  background: var(--accent);
  color: var(--primary-dark);
  padding: 1vh 1vw;
  text-align: left;
}

.data-table td {
  padding: 0.8vh 1vw;
  border-bottom: 1px solid rgba(255, 255, 255, 0.2);
}

.data-table tr:nth-child(even) {
  background: rgba(255, 255, 255, 0.05);
}

/* 金句 */
.quote {
  font-size: clamp(18px, 2.2vw, 32px);
  font-style: italic;
  text-align: center;
  padding: 2vh 3vw;
  background: linear-gradient(90deg, transparent, rgba(253, 185, 39, 0.2), transparent);
  border-left: 4px solid var(--accent);
  color: var(--accent-light);
}

/* 高亮 */
.highlight { color: var(--accent); font-weight: 600; }

/* 页码指示器 */
.page-indicator {
  position: absolute;
  bottom: 2vh;
  right: 3vw;
  font-size: clamp(12px, 1vw, 16px);
  color: rgba(255, 255, 255, 0.5);
}

/* 动画 */
@keyframes fadeIn {
  from { opacity: 0; }
  to { opacity: 1; }
}

@keyframes slideInLeft {
  from { transform: translateX(-50px); opacity: 0; }
  to { transform: translateX(0); opacity: 1; }
}

@keyframes slideInRight {
  from { transform: translateX(50px); opacity: 0; }
  to { transform: translateX(0); opacity: 1; }
}

@keyframes slideInUp {
  from { transform: translateY(30px); opacity: 0; }
  to { transform: translateY(0); opacity: 1; }
}

@keyframes scaleIn {
  from { transform: scale(0.8); opacity: 0; }
  to { transform: scale(1); opacity: 1; }
}

.animate-fade { animation: fadeIn 0.8s ease forwards; }
.animate-slide-left { animation: slideInLeft 0.6s ease forwards; }
.animate-slide-right { animation: slideInRight 0.6s ease forwards; }
.animate-slide-up { animation: slideInUp 0.6s ease forwards; }
.animate-scale { animation: scaleIn 0.5s ease forwards; }

.delay-1 { animation-delay: 0.1s; }
.delay-2 { animation-delay: 0.2s; }
.delay-3 { animation-delay: 0.3s; }
.delay-4 { animation-delay: 0.4s; }
.delay-5 { animation-delay: 0.5s; }
.delay-6 { animation-delay: 0.6s; }
.delay-7 { animation-delay: 0.7s; }
.delay-8 { animation-delay: 0.8s; }
```

---

## CSS高级模板 (艺术级空间与光影系统)

```css
/* 幻灯片样式模板 (Artistic Space & Light System) */

:root {
  /* 示例配色：流体玻璃态 (fluid-glass) */
  --canvas-bg: #F8FAFC;
  --core-brand: #1E293B;
  --accent-glow: #6366F1;
  --aura-gradient: radial-gradient(circle at 50% 120%, #E0E7FF 0%, #F3F4F6 80%);
  
  --text-hero: #0F172A;
  --text-body: #475569;
  --text-ghost: rgba(15, 23, 42, 0.05);

  --glass-panel: rgba(255, 255, 255, 0.6);
  --glass-blur: blur(24px) saturate(180%);
  --border-light: 1px solid rgba(255, 255, 255, 0.3);
  --shadow-float: 0 24px 48px -12px rgba(30, 41, 59, 0.08);

  --ease-spring: cubic-bezier(0.175, 0.885, 0.32, 1.15);
  --ease-cinematic: cubic-bezier(0.22, 1, 0.36, 1);
  --duration-intro: 0.85s;
}

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

html, body {
  width: 100%;
  height: 100%;
  overflow: hidden;
  background-color: #000;
  font-family: -apple-system, BlinkMacSystemFont, "Helvetica Neue", Helvetica, "PingFang SC", "Hiragino Sans GB", "Microsoft YaHei", sans-serif;
  -webkit-font-smoothing: antialiased;
}

/* 幻灯片容器 - 16:9 画布 */
.slide {
  width: 100vw;
  height: 100vh;
  overflow: hidden;
  position: relative;
  background-color: var(--canvas-bg);
  background-image: var(--aura-gradient);
  color: var(--text-body);
  display: flex;
  flex-direction: column;
  padding: 8vh 8vw; /* 神圣边界 */
}

/* 排版雕塑与字体拓扑 */
.titan-title {
  font-size: clamp(72px, 8vw, 140px);
  font-weight: 900;
  line-height: 1.05;
  color: var(--text-hero);
  letter-spacing: -0.02em;
}

.titan-title .highlight {
  color: var(--accent-glow);
}

.anchor-heading {
  font-size: clamp(36px, 4vw, 64px);
  font-weight: 600;
  line-height: 1.15;
  color: var(--text-hero);
  margin-bottom: 3vh;
}

.bridge-subtitle {
  font-size: clamp(22px, 2.5vw, 36px);
  font-weight: 300;
  line-height: 1.4;
  color: var(--text-body);
  margin-bottom: 4vh;
}

.prose-body {
  font-size: clamp(15px, 1.5vw, 24px);
  font-weight: 400;
  line-height: 1.7;
  color: var(--text-body);
}

.whisper-tag {
  font-size: clamp(12px, 1vw, 16px);
  font-weight: 300;
  letter-spacing: 0.15em;
  color: var(--text-body);
  opacity: 0.6;
}

/* 光栅材质与玻璃态卡片 */
.glass-panel {
  background: var(--glass-panel);
  backdrop-filter: var(--glass-blur);
  -webkit-backdrop-filter: var(--glass-blur);
  border: var(--border-light);
  box-shadow: var(--shadow-float);
  border-radius: 24px;
  padding: 4vh 3vw;
}

.panel-title {
  font-size: clamp(20px, 2vw, 32px);
  font-weight: 600;
  color: var(--text-hero);
  margin-bottom: 2vh;
}

/* 版式拓扑: 悬浮便当盒 */
.bento-grid { 
  display: grid; 
  grid-template-columns: repeat(3, 1fr); 
  gap: 32px; 
  align-items: stretch;
}

/* 巨像数据进度条 */
.titan-data-number {
  font-size: clamp(80px, 10vw, 180px);
  font-weight: 900;
  color: var(--accent-glow);
  line-height: 1;
  background: linear-gradient(135deg, var(--accent-glow), var(--core-brand));
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}

/* 页码指示器 - 极简角标 */
.page-indicator {
  position: absolute;
  bottom: 4vh;
  right: 4vw;
  font-size: clamp(12px, 1vw, 14px);
  color: var(--text-body);
  opacity: 0.4;
  font-family: monospace;
}

/* 电影级编舞动画 */
@keyframes cinematicIn {
  from { transform: translateY(40px); opacity: 0; filter: blur(5px); }
  to { transform: translateY(0); opacity: 1; filter: blur(0); }
}

.stagger-1 { animation: cinematicIn var(--duration-intro) var(--ease-cinematic) 0.1s both; }
.stagger-2 { animation: cinematicIn var(--duration-intro) var(--ease-cinematic) 0.2s both; }
.stagger-3 { animation: cinematicIn var(--duration-intro) var(--ease-cinematic) 0.3s both; }
.stagger-4 { animation: cinematicIn var(--duration-intro) var(--ease-cinematic) 0.4s both; }
.stagger-5 { animation: cinematicIn var(--duration-intro) var(--ease-cinematic) 0.5s both; }
.stagger-6 { animation: cinematicIn var(--duration-intro) var(--ease-cinematic) 0.6s both; }
```

---

## JS控制脚本模板

```javascript
class SlideController {
  constructor() {
    this.totalSlides = 16; // 替换为实际页数
    this.currentSlide = 1;
    this.isAnimating = false;
    this.init();
  }

  init() {
    this.bindKeyboard();
    this.bindNavigation();
    this.updateIndicator();
  }

  bindKeyboard() {
    document.addEventListener('keydown', (e) => {
      switch(e.key) {
        case 'ArrowRight':
        case 'ArrowDown':
        case ' ':
        case 'PageDown':
          e.preventDefault();
          this.nextSlide();
          break;
        case 'ArrowLeft':
        case 'ArrowUp':
        case 'PageUp':
          e.preventDefault();
          this.prevSlide();
          break;
        case 'Home':
          e.preventDefault();
          this.goToSlide(1);
          break;
        case 'End':
          e.preventDefault();
          this.goToSlide(this.totalSlides);
          break;
        case 'f':
        case 'F':
          e.preventDefault();
          this.toggleFullscreen();
          break;
      }
    });
  }

  bindNavigation() {
    document.getElementById('prevBtn')?.addEventListener('click', () => this.prevSlide());
    document.getElementById('nextBtn')?.addEventListener('click', () => this.nextSlide());
    document.getElementById('fullscreenBtn')?.addEventListener('click', () => this.toggleFullscreen());

    // 触摸支持
    let touchStartX = 0;
    document.addEventListener('touchstart', (e) => { touchStartX = e.touches[0].clientX; });
    document.addEventListener('touchend', (e) => {
      const diff = touchStartX - e.changedTouches[0].clientX;
      if (Math.abs(diff) > 50) {
        diff > 0 ? this.nextSlide() : this.prevSlide();
      }
    });
  }

  nextSlide() {
    if (!this.isAnimating && this.currentSlide < this.totalSlides) {
      this.goToSlide(this.currentSlide + 1);
    }
  }

  prevSlide() {
    if (!this.isAnimating && this.currentSlide > 1) {
      this.goToSlide(this.currentSlide - 1);
    }
  }

  goToSlide(num) {
    if (num < 1 || num > this.totalSlides || num === this.currentSlide) return;
    this.isAnimating = true;

    const iframe = document.getElementById('slideFrame');
    const slideNames = [
      '', // 占位
      '01-cover',
      '02-xxx',
      // ... 填充所有页面名称
    ];

    iframe.style.opacity = '0';
    iframe.style.transform = 'scale(0.98)';
    setTimeout(() => {
      iframe.src = `slides/${slideNames[num]}.html`;
      this.currentSlide = num;
      this.updateIndicator();
      setTimeout(() => {
        iframe.style.opacity = '1';
        iframe.style.transform = 'scale(1)';
        this.isAnimating = false;
      }, 100);
    }, 300);
  }

  updateIndicator() {
    const indicator = document.getElementById('pageIndicator');
    if (indicator) indicator.textContent = `${this.currentSlide} / ${this.totalSlides}`;

    const prevBtn = document.getElementById('prevBtn');
    const nextBtn = document.getElementById('nextBtn');
    if (prevBtn) prevBtn.style.opacity = this.currentSlide === 1 ? '0.3' : '1';
    if (nextBtn) nextBtn.style.opacity = this.currentSlide === this.totalSlides ? '0.3' : '1';
  }

  toggleFullscreen() {
    if (!document.fullscreenElement) {
      document.documentElement.requestFullscreen();
    } else {
      document.exitFullscreen();
    }
  }
}

document.addEventListener('DOMContentLoaded', () => {
  window.slideController = new SlideController();
});
```

---

## index.html 主入口模板

```html
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>演示文稿标题</title>
  <style>
    * { margin: 0; padding: 0; box-sizing: border-box; }
    html, body { width: 100%; height: 100%; overflow: hidden; background: #0a1628; }
    .presentation-container { width: 100%; height: 100%; display: flex; flex-direction: column; }
    .slide-wrapper { flex: 1; position: relative; background: #000; }
    #slideFrame { width: 100%; height: 100%; border: none; transition: opacity 0.2s ease; }
    .nav-controls { position: fixed; bottom: 20px; right: 20px; display: flex; gap: 10px; z-index: 1000; }
    .nav-btn {
      width: 40px; height: 40px; border: none; border-radius: 8px;
      background: rgba(23, 64, 139, 0.8); color: #FDB927;
      font-size: 18px; cursor: pointer;
      display: flex; align-items: center; justify-content: center;
      transition: all 0.2s ease; backdrop-filter: blur(5px);
    }
    .nav-btn:hover { background: rgba(253, 185, 39, 0.9); color: #17408B; transform: scale(1.1); }
    .page-info {
      position: fixed; bottom: 20px; left: 20px;
      background: rgba(23, 64, 139, 0.8); color: #FDB927;
      padding: 8px 16px; border-radius: 8px;
      font-size: 14px; font-weight: 500;
      backdrop-filter: blur(5px); z-index: 1000;
    }
    .shortcuts-hint {
      position: fixed; top: 20px; right: 20px;
      background: rgba(0, 0, 0, 0.6); color: rgba(255, 255, 255, 0.7);
      padding: 8px 12px; border-radius: 6px;
      font-size: 11px; z-index: 1000;
      opacity: 0; transition: opacity 0.3s ease;
    }
    .presentation-container:hover .shortcuts-hint { opacity: 1; }
  </style>
</head>
<body>
  <div class="presentation-container">
    <div class="slide-wrapper">
      <iframe id="slideFrame" src="slides/01-cover.html"></iframe>
    </div>
    <div class="page-info"><span id="pageIndicator">1 / 16</span></div>
    <div class="nav-controls">
      <button class="nav-btn" id="prevBtn" title="上一页 (←)">◀</button>
      <button class="nav-btn" id="nextBtn" title="下一页 (→)">▶</button>
      <button class="nav-btn" id="fullscreenBtn" title="全屏 (F)">⛶</button>
    </div>
    <div class="shortcuts-hint">← → 翻页 | F 全屏 | Home/End 首末页</div>
  </div>
  <script src="js/main.js"></script>
</body>
</html>
```

---

## index.html 高级主入口模板 (极简容器+强制16:9画幅)

```html
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>演示文稿标题</title>
  <style>
    * { margin: 0; padding: 0; box-sizing: border-box; }
    html, body { width: 100%; height: 100%; overflow: hidden; background: #111; color: #fff; }
    .presentation-container { width: 100%; height: 100%; display: flex; align-items: center; justify-content: center; }
    
    /* iframe 包装器以保持强制 16:9 画幅 */
    .slide-wrapper { 
      position: relative; 
      width: 100vw; 
      height: 56.25vw; /* 16:9 */
      max-height: 100vh;
      max-width: 177.78vh;
      box-shadow: 0 0 100px rgba(0,0,0,0.5);
    }
    #slideFrame { 
      width: 100%; height: 100%; border: none; 
      transition: opacity 0.4s cubic-bezier(0.22, 1, 0.36, 1), transform 0.4s cubic-bezier(0.22, 1, 0.36, 1); 
    }
    
    /* 极简导航隐形悬浮 */
    .nav-controls { position: fixed; bottom: 32px; left: 0; right: 0; display: flex; gap: 16px; justify-content: center; z-index: 1000; opacity: 0; transition: opacity 0.3s ease; }
    .presentation-container:hover .nav-controls { opacity: 1; }
    
    .nav-btn {
      width: 48px; height: 48px; border: 1px solid rgba(255,255,255,0.1); border-radius: 50%;
      background: rgba(0,0,0,0.3); color: #fff; font-size: 16px; cursor: pointer;
      display: flex; align-items: center; justify-content: center;
      transition: all 0.2s ease; backdrop-filter: blur(10px);
    }
    .nav-btn:hover { background: rgba(255,255,255,0.1); transform: scale(1.05); }
    
    .page-info { position: fixed; top: 32px; right: 32px; font-family: monospace; font-size: 14px; opacity: 0.5; }
  </style>
</head>
<body>
  <div class="presentation-container">
    <div class="slide-wrapper">
      <iframe id="slideFrame" src="slides/01-cover.html"></iframe>
    </div>
    <div class="page-info"><span id="pageIndicator">1 / 16</span></div>
    <div class="nav-controls">
      <button class="nav-btn" id="prevBtn" title="上一页">◀</button>
      <button class="nav-btn" id="nextBtn" title="下一页">▶</button>
      <button class="nav-btn" id="fullscreenBtn" title="全屏">⛶</button>
    </div>
  </div>
  <script src="js/main.js"></script>
</body>
</html>
```

---

## 子页面HTML模板

### 封面页

```html
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8">
  <title>封面</title>
  <link rel="stylesheet" href="../css/style.css">
  <style>
    .cover-slide {
      background: radial-gradient(ellipse at center, var(--primary) 0%, var(--primary-dark) 100%);
      justify-content: center;
      align-items: center;
      text-align: center;
    }
    .cover-title {
      font-size: clamp(48px, 7vw, 84px);
      font-weight: 800;
      background: linear-gradient(135deg, var(--accent), #fff, var(--accent));
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      margin-bottom: 2vh;
      animation: scaleIn 0.8s ease forwards;
    }
    .cover-subtitle {
      font-size: clamp(24px, 3vw, 42px);
      color: var(--white);
      margin-bottom: 4vh;
      opacity: 0;
      animation: fadeIn 0.8s ease 0.3s forwards;
    }
    .cover-info {
      font-size: clamp(16px, 2vw, 28px);
      color: rgba(255, 255, 255, 0.8);
      opacity: 0;
      animation: slideInUp 0.8s ease 0.6s forwards;
    }
  </style>
</head>
<body>
  <div class="slide cover-slide">
    <h1 class="cover-title">演示文稿标题</h1>
    <h2 class="cover-subtitle">副标题</h2>
    <p class="cover-info">日期 · 地点 · 作者</p>
    <div class="page-indicator">1 / 16</div>
  </div>
</body>
</html>
```

### 内容页（左右分栏）

```html
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8">
  <title>内容页</title>
  <link rel="stylesheet" href="../css/style.css">
  <style>
    .split-layout {
      display: flex;
      gap: 3vw;
      flex: 1;
    }
    .left-panel, .right-panel {
      flex: 1;
      display: flex;
      flex-direction: column;
    }
    .left-panel {
      opacity: 0;
      animation: slideInLeft 0.6s ease 0.2s forwards;
    }
    .right-panel {
      opacity: 0;
      animation: slideInRight 0.6s ease 0.2s forwards;
    }
  </style>
</head>
<body>
  <div class="slide">
    <h1 class="slide-title">页面标题</h1>
    <div class="content">
      <div class="split-layout">
        <div class="left-panel">
          <!-- 左侧内容 -->
        </div>
        <div class="right-panel">
          <!-- 右侧内容 -->
        </div>
      </div>
    </div>
    <div class="page-indicator">N / 16</div>
  </div>
</body>
</html>
```

### 数据表格页

```html
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8">
  <title>数据页</title>
  <link rel="stylesheet" href="../css/style.css">
</head>
<body>
  <div class="slide">
    <h1 class="slide-title">数据展示</h1>
    <div class="content">
      <table class="data-table">
        <thead>
          <tr>
            <th>列1</th>
            <th>列2</th>
            <th>列3</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>数据1</td>
            <td>数据2</td>
            <td>数据3</td>
          </tr>
        </tbody>
      </table>
    </div>
    <div class="page-indicator">N / 16</div>
  </div>
</body>
</html>
```

### 引言页

```html
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8">
  <title>引言</title>
  <link rel="stylesheet" href="../css/style.css">
  <style>
    .quote-slide {
      justify-content: center;
      align-items: center;
    }
    .big-quote {
      font-size: clamp(28px, 4vw, 48px);
      font-style: italic;
      color: var(--accent);
      text-align: center;
      max-width: 80%;
      line-height: 1.5;
      opacity: 0;
      animation: fadeIn 1s ease 0.3s forwards;
    }
    .quote-author {
      font-size: clamp(16px, 2vw, 24px);
      color: rgba(255, 255, 255, 0.7);
      margin-top: 3vh;
      opacity: 0;
      animation: fadeIn 0.8s ease 0.8s forwards;
    }
  </style>
</head>
<body>
  <div class="slide quote-slide">
    <p class="big-quote">"引言内容"</p>
    <p class="quote-author">— 作者</p>
    <div class="page-indicator">N / 16</div>
  </div>
</body>
</html>
```

---

## 子页面高级结构模板

### 1. 绝对失衡场封面 (Asymmetric Hero)

```html
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8">
  <title>Cover</title>
  <link rel="stylesheet" href="../css/style.css">
  <style>
    .slide-hero { justify-content: center; }
    .hero-content {
      width: 65%; /* 极度偏置留白 */
    }
  </style>
</head>
<body>
  <div class="slide slide-hero">
    <div class="whisper-tag stagger-1">ANNUAL REPORT 2026</div>
    <div class="hero-content">
      <h1 class="titan-title stagger-2">重新定义<br><span class="highlight">数字空间</span></h1>
      <h2 class="bridge-subtitle stagger-3">探索光影、材质与先锋版式的美学边界。</h2>
    </div>
    <div class="page-indicator">1 / 16</div>
  </div>
</body>
</html>
```

### 2. 大分镜画幅 (Editorial Split)

```html
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8">
  <title>Strategy</title>
  <link rel="stylesheet" href="../css/style.css">
  <style>
    .slide { padding: 0; } /* 移除全局 Padding，让画幅充斥 */
    .split-layout { height: 100vh; display: flex; width: 100vw; gap: 0; }
    .split-left {
      flex: 1;
      padding: 8vh 6vw;
      display: flex;
      flex-direction: column;
      justify-content: center;
    }
    .split-right {
      flex: 1.2;
      background: var(--glass-panel);
      backdrop-filter: var(--glass-blur);
      padding: 8vh 8vw;
      display: flex;
      flex-direction: column;
      justify-content: center;
    }
  </style>
</head>
<body>
  <div class="slide">
    <div class="split-layout">
      <div class="split-left">
        <h2 class="anchor-heading stagger-1">解构与重组</h2>
        <p class="prose-body stagger-2">打破传统的填鸭式排版，为内容寻找更具呼吸感的降噪空间。</p>
      </div>
      <div class="split-right stagger-3">
        <div class="glass-panel">
          <h3 class="panel-title">核心驱动力</h3>
          <p class="prose-body">1. 负空间的奢侈使用<br>2. 隐形材质与微光</p>
        </div>
      </div>
    </div>
    <div class="page-indicator">N / 16</div>
  </div>
</body>
</html>
```

### 3. 悬浮便当盒 (Glass Bento Grid)

```html
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8">
  <title>Features</title>
  <link rel="stylesheet" href="../css/style.css">
  <style>
    .bento-wrapper {
      margin-top: 4vh;
      flex: 1;
      display: flex;
      flex-direction: column;
      justify-content: center;
    }
  </style>
</head>
<body>
  <div class="slide">
    <h2 class="anchor-heading stagger-1">系统矩阵</h2>
    <div class="bento-wrapper">
      <div class="bento-grid">
        <div class="glass-panel stagger-2">
          <h3 class="panel-title">流体拓扑</h3>
          <p class="prose-body">通过 clamp 函数实现文字尺度的丝滑动态缩放。</p>
        </div>
        <div class="glass-panel stagger-3">
          <h3 class="panel-title">光影渲染</h3>
          <p class="prose-body">摒弃死板边框，采用磨砂玻璃与微细光晕呈现高级悬浮感。</p>
        </div>
        <div class="glass-panel stagger-4">
          <h3 class="panel-title">动效引擎</h3>
          <p class="prose-body">物理级缓动曲线，带来如水波般优雅的入场节奏。</p>
        </div>
      </div>
    </div>
    <div class="page-indicator">N / 16</div>
  </div>
</body>
</html>
```

### 4. 巨像数据 (Titan Data)

```html
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8">
  <title>Data</title>
  <link rel="stylesheet" href="../css/style.css">
  <style>
    .data-hero {
      display: flex;
      flex-direction: column;
      justify-content: center;
      height: 100%;
    }
  </style>
</head>
<body>
  <div class="slide">
    <div class="data-hero">
      <div class="whisper-tag stagger-1">PERFORMANCE</div>
      <div class="titan-data-number stagger-2">87.5%</div>
      <h2 class="anchor-heading stagger-3">用户留存率实现断层领先</h2>
      <p class="prose-body stagger-4">这不仅是一组粗暴的数据，更是设计系统驱动产品心智体验的直接映射。</p>
    </div>
    <div class="page-indicator">N / 16</div>
  </div>
</body>
</html>
```

### 5. 剧院级孤语 (Cinematic Quote)

```html
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8">
  <title>Quote</title>
  <link rel="stylesheet" href="../css/style.css">
  <style>
    .slide-quote {
      background: #000; /* 强制暗场 */
      color: #fff;
      display: flex;
      align-items: center;
      justify-content: center;
      text-align: center;
    }
    .quote-mark {
      font-size: 180px;
      position: absolute;
      opacity: 0.1;
      font-family: serif;
      top: 15vh;
    }
    .pure-quote {
      font-size: clamp(32px, 4vw, 56px);
      line-height: 1.5;
      font-weight: 300;
      max-width: 80%;
      position: relative;
      z-index: 1;
    }
  </style>
</head>
<body>
  <div class="slide slide-quote">
    <div class="quote-mark stagger-1">"</div>
    <p class="pure-quote stagger-2">低级设计试图填满空间，<br>高级设计精心经营空白。</p>
    <div class="page-indicator" style="color: #fff;">N / 16</div>
  </div>
</body>
</html>
```

---

## 配色方案详细参考

### Sport（体育）
```css
--primary: #17408B;      /* NBA蓝 */
--primary-dark: #0d2654;
--secondary: #C9082A;    /* NBA红 */
--accent: #FDB927;       /* 冠军金 */
--accent-light: #ffe066;
```

### Tech（科技）
```css
--primary: #0f172a;      /* 深夜蓝 */
--primary-dark: #020617;
--secondary: #06b6d4;    /* 青色 */
--accent: #ffffff;       /* 白色 */
--accent-light: #e2e8f0;
```

### Business（商务）
```css
--primary: #1e3a5f;      /* 藏青 */
--primary-dark: #0f1f33;
--secondary: #6b7280;    /* 中灰 */
--accent: #d4af37;       /* 金色 */
--accent-light: #f5e6a3;
```

### Edu（教育）
```css
--primary: #166534;      /* 深绿 */
--primary-dark: #0a3d1f;
--secondary: #fef3c7;    /* 米色 */
--accent: #ea580c;       /* 橙色 */
--accent-light: #fed7aa;
```

### Medical（医疗）
```css
--primary: #0d9488;      /* 青绿 */
--primary-dark: #065f55;
--secondary: #ffffff;    /* 白色 */
--accent: #22c55e;       /* 绿色 */
--accent-light: #86efac;
```

### Creative（创意）
```css
--primary: #7c3aed;      /* 紫色 */
--primary-dark: #4c1d95;
--secondary: #ec4899;    /* 粉色 */
--accent: #facc15;       /* 黄色 */
--accent-light: #fef08a;
```

### Nature（自然）
```css
--primary: #15803d;      /* 森林绿 */
--primary-dark: #0a4a22;
--secondary: #78350f;    /* 棕色 */
--accent: #0ea5e9;       /* 天蓝 */
--accent-light: #7dd3fc;
```

### Gov（政府）
```css
--primary: #dc2626;      /* 红色 */
--primary-dark: #991b1b;
--secondary: #fbbf24;    /* 金色 */
--accent: #ffffff;       /* 白色 */
--accent-light: #fef3c7;
```

---

## 艺术级色彩美学配置 (Tokens Reference)

替换 `style.css` 内 `:root` 的属性来快速切换情绪感知：

### Zen Minimal (极简侘寂)
```css
  --canvas-bg: #F5F5F3;
  --core-brand: #2C2C2A;
  --accent-glow: #D4A373;
  --aura-gradient: linear-gradient(120deg, #F5F5F3, #E8E8E6);
  --text-hero: #111111;
  --text-body: #555555;
  --text-ghost: rgba(0,0,0,0.05);
  --glass-panel: rgba(255, 255, 255, 0.4);
  --border-light: 1px solid rgba(255, 255, 255, 0.5);
  --shadow-float: 0 24px 48px -12px rgba(0, 0, 0, 0.05);
```

### Cyber Nova (赛博未来)
```css
  --canvas-bg: #0A0A0C;
  --core-brand: #00FFA3;
  --accent-glow: #00C6FF;
  --aura-gradient: radial-gradient(circle at top right, rgba(0,255,163,0.15) 0%, transparent 60%);
  --text-hero: #ECECEC;
  --text-body: #A0A0A0;
  --text-ghost: rgba(255,255,255,0.03);
  --glass-panel: rgba(255, 255, 255, 0.03);
  --border-light: 1px solid rgba(255, 255, 255, 0.08);
  --shadow-float: 0 24px 48px -12px rgba(0, 255, 163, 0.1);
```

### Flowing Glass (流体玻璃态)
```css
  --canvas-bg: #F8FAFC;
  --core-brand: #1E293B;
  --accent-glow: #6366F1;
  --aura-gradient: radial-gradient(circle at 50% 120%, #E0E7FF 0%, #F3F4F6 80%);
  --text-hero: #0F172A;
  --text-body: #475569;
  --text-ghost: rgba(15, 23, 42, 0.05);
  --glass-panel: rgba(255, 255, 255, 0.6);
  --border-light: 1px solid rgba(255, 255, 255, 0.3);
  --shadow-float: 0 24px 48px -12px rgba(30, 41, 59, 0.08);
```

### Neo Brutal (新粗野主义)
```css
  --canvas-bg: #EDEAE5;
  --core-brand: #1E1E1E;
  --accent-glow: #FF3E00;
  --aura-gradient: none;
  --text-hero: #000000;
  --text-body: #333333;
  --text-ghost: rgba(0,0,0,0.08);
  --glass-panel: #FFFFFF;
  --border-light: 4px solid #000; /* 特殊：粗犷边框 */
  --shadow-float: 8px 8px 0 rgba(0,0,0,1); /* 特殊：硬抗硬阴影 */
```

### Luxury Gold (传世雅黑)
```css
  --canvas-bg: #0E0E0E;
  --core-brand: #D4AF37;
  --accent-glow: #F9DF9F;
  --aura-gradient: radial-gradient(ellipse at center, #1C1C1C 0%, #0E0E0E 100%);
  --text-hero: #F4F4F4;
  --text-body: #A9A9A9;
  --text-ghost: rgba(255,255,255,0.02);
  --glass-panel: rgba(20, 20, 20, 0.8);
  --border-light: 1px solid rgba(212, 175, 55, 0.2);
  --shadow-float: 0 24px 48px -12px rgba(0, 0, 0, 0.8);
```
