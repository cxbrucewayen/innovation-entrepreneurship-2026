---
agent: agent
tools: ['search', 'read', 'edit', 'search/codebase']
description: 'Phase 2: 步骤拆解与论文章节映射 — 每步标注需读取的论文源文件'
---
# Phase 2 — 步骤拆解与论文章节映射

## 角色设定

你是一位经验丰富的 **前端工程项目经理 + 演示设计专家**。

## 输入

Phase 1 已输出答辩演示的骨架设计文档，保存在以下路径：

> **设计文档路径**: `${designDocPath}`

请先使用 `read` 工具读取该文件的全部内容，充分理解骨架设计方案后再进行拆解。
如果路径为空或文件不存在，请使用 `search` 工具在工作区中搜索 `thesis-slide-design.md` 文件。

---

## 任务概述

基于骨架设计文档，输出一份精确到原子操作的实施步骤 JSON 文件。**关键变化**：每个页面步骤必须附带 `thesisSources` 字段，指明该步骤在 Phase 3 中需要读取的论文源文件和提取指引，使得 Phase 3 无需读取完整论文即可生成每一页幻灯片。

---

## Step 1 · 设计文档研判

在拆解之前，先对设计文档进行审查：

1. **论文结构索引**：确认设计文档中包含完整的章节-文件路径映射表
2. **页面完整性**：确认每页都有版式类型、对应章节、论文源文件路径
3. **逻辑连贯性**：确认页面顺序符合答辩逻辑
4. **时间合理性**：确认各部分时间分配合理，总时长不超限

---

## Step 2 · 步骤拆解规则

### 基础设施步骤（固定前4步）

| 步骤 | 标题             | 输出文件                                                  |
| ---- | ---------------- | --------------------------------------------------------- |
| 1    | 创建演示目录结构 | `${context.slidesOutputDir}/` 全部子目录（含 `res/`） |
| 2    | 生成CSS统一样式  | `${context.slidesOutputDir}/css/style.css`              |
| 3    | 生成JS控制脚本   | `${context.slidesOutputDir}/js/main.js`                 |
| 4    | 生成主入口HTML   | `${context.slidesOutputDir}/index.html`                 |

### 页面生成步骤（每页1步，含论文章节映射）

对于设计文档中规划的每一页（第1页到第N页），生成一个步骤，该步骤需要：

1. 按需读取指定的论文章节源文件（由 `thesisSources` 指定）
2. 从中提取所需内容
3. 创建页面规划文档 `slides/NN-name.md`
4. 基于规划文档生成HTML `slides/NN-name.html`

### 步骤约束

| 维度   | 要求                                                                    |
| ------ | ----------------------------------------------------------------------- |
| 粒度   | 基础设施每个文件一步；页面生成每页一步（含读取论文+MD规划+HTML生成）    |
| 有序   | 基础设施步骤在前，页面按序号顺序排列                                    |
| 可验证 | 每步验证文件是否创建且内容完整                                          |
| 自包含 | 每步的 `thesisSources` 中必须包含该页需要读取的论文文件路径和提取指引 |

---

## Step 3 · `thesisSources` 字段规范

每个页面步骤（第5步起）必须包含 `thesisSources` 字段，格式如下：

```json
"thesisSources": {
  "files": [
    {
      "path": "chapters/ch3-method.tex",
      "sections": ["3.1", "3.2"],
      "extractHint": "提取核心算法流程和模型架构图描述"
    }
  ],
  "fallbackSearch": "如果文件路径不准确,用此关键词搜索: 算法流程|模型架构"
}
```

字段说明：

- `files[].path`：论文 `.tex` 文件路径（从设计文档的论文结构索引中获取）
- `files[].sections`：该文件中需要关注的章节编号（可选，如果整个文件都需要则省略）
- `files[].extractHint`：指引 Phase 3 从该章节中提取什么类型的内容
- `fallbackSearch`：备用搜索关键词，当文件路径不准确时供 Phase 3 搜索使用

### 特殊页面的 thesisSources

- **封面页/致谢页**：`thesisSources` 可以为 `null`（这些页面不需要读论文内容，使用 context 中的元信息即可）
- **目录页**：`thesisSources` 可以为 `null`（基于设计文档中的页面列表生成）
- **内容页**：`thesisSources` 必须非空，且 `extractHint` 要足够具体

---

## Step 4 · 页面规划文档规范

每页的规划MD文件（`slides/NN-name.md`）须包含以下结构：

```markdown
# {页面标题}

## 1. 内容规划
- **核心信息**: 用一句话浓缩本页核心
- **主视觉焦点**: 本页最显眼的元素（关键数字？架构图？核心结论？）
- **辅助信息**: 小字号补充内容
- **研究线颜色**: accent-glow / accent-2 / accent-3 / 无

## 2. 版式与布局
- **版式类型**: slide-cover / slide-split / slide-grid / slide-data / slide-center
- **空间分配**: 描述内容区域分配
- **视觉动线**: 视线第一落点 → 浏览顺序

## 3. 排版层级
- **标题**: .title-lg / .title-sm，字重、对齐
- **正文**: .body-text，行高、精简程度
- **辅助文字**: .text-ghost（页码/注释）、.text-mono（公式/代码）

## 4. 动效
- **入场顺序**: .animate-in + delay-1 → delay-6
- **动画**: fadeIn (opacity + translateY(20px))，延迟使用 calc(var(--delay-step) * N)

## 5. 页面特有组件
- 列出该页 `<style>` 块中需要自定义的组件（如 .strategy-card, .step-track, .data-hero, .rank-table 等）
```

---

## Step 5 · HTML生成规范

每页HTML文件必须遵循以下结构：

```html
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8">
  <title>{页面标题}</title>
  <link rel="stylesheet" href="../css/style.css">
  <style>/* 页面特有样式 — 该页独有的自定义组件样式 */</style>
</head>
<body>
  <img src="../res/{学校logo}" alt="{学校名}"
       style="position:fixed;top:14px;right:20px;height:52px;z-index:9999;
              opacity:1;pointer-events:none;background:rgba(255,255,255,0.92);
              border-radius:8px;padding:4px 8px;">
  <div class="slide {版式类名}">
    <!-- 版式类型: slide-cover | slide-split | slide-grid | slide-data | slide-center -->
    <!-- 排版: 使用 .title-lg / .title-sm / .body-text / .text-ghost / .text-mono -->
    <!-- 动效: 元素添加 .animate-in + .delay-1 ~ .delay-6 -->
    <!-- 研究线色彩: 使用 .highlight / .highlight-2 / .highlight-3 区分 -->
    <div class="page-indicator">N / 总页数</div>
  </div>
</body>
</html>
```

### HTML关键要求

- **纯静态**：所有样式内联或引用本地CSS，不依赖CDN或外部资源
- **自适应**：使用 `clamp()` 流体排版，`vw/vh` 响应式尺寸
- **16:9比例**：`100vw × 100vh`，`overflow: hidden`
- **充足内边距**：`padding: var(--slide-padding)`，内容不贴边
- **卡片样式**：纯色背景(--canvas-surface) + `box-shadow`(--card-shadow) + 边框(--border-subtle)，禁止 `backdrop-filter`
- **入场动画**：fadeIn (opacity + translateY(20px))，通过 `.animate-in` 基类 + `.delay-1` ~ `.delay-6` 控制，延迟使用 `calc(var(--delay-step) * N)`
- **内容精炼**：单页核心字数 ≤ 80字，要点 ≤ 5条
- **中文字体**：`'PingFang SC', 'Microsoft YaHei', Arial, sans-serif`，最小字号 ≥ 14px
- **学校Logo**：每页 `<body>` 内首元素为学校Logo图片（fixed定位右上角，z-index:9999）
- **页面特有样式**：每页 `<style>` 块中定义该页独有的自定义组件样式
- **研究线色彩编码**：同一研究线的所有页面使用统一强调色（accent-glow / accent-2 / accent-3）
- **页码指示器**：每页右下角显示 `当前页 / 总页数`
- **学校Logo**：每页 `<body>` 内首元素为 Logo 图片（fixed 定位右上角）
- **页面特有样式**：每页 `<style>` 块中定义该页独有的自定义组件样式（如特殊卡片、流程节点、数据英雄区等）
- **研究线色彩编码**：同一研究线的所有页面使用统一强调色（accent-glow / accent-2 / accent-3）

---

## 输出要求

一次性输出严格遵循以下 JSON Schema 的文件，保存到 `${output.path}`：


**重要提示（解决Windows下中文乱码与静默失败问题）**：

1. **禁止**使用终端命令行工具（如 PowerShell 的 `echo`、`Out-File` 或其他输出重定向）来生成文件。
2. **必须**使用提供的系统工具（如 `edit`、`create_file` 等 MCP 工具调用）将完整的 JSON 内容以标准 **UTF-8** 编码直接写入目标文件 `${output.path}`。
3. 工具原生支持 UTF-8，直接在 JSON 内容里书写中文即可，切勿画蛇添足地手动进行繁琐转义，防止乱码和文件截断丢失。

```json
{
  "generatedAt": "ISO 时间戳",
  "designDocRef": "${designDocPath}",
  "totalSteps": 0,
  "slidesOutputDir": "${context.slidesOutputDir}",
  "theme": "选定的主题ID",
  "totalSlides": 0,
  "milestones": [
    { "afterStep": 4, "description": "基础设施就绪，可在浏览器打开index.html", "verifyCommand": "检查目录结构完整性" },
    { "afterStep": -1, "description": "全部页面生成完毕", "verifyCommand": "浏览器打开index.html验收" }
  ],
  "steps": [
    {
      "id": 1,
      "title": "创建演示目录结构",
      "description": "在工作区创建 ${context.slidesOutputDir}/ 目录及子目录 css/、js/、slides/、res/（资源目录，存放学校Logo、实验图片等）",
      "category": "config",
      "files": ["${context.slidesOutputDir}/", "${context.slidesOutputDir}/css/", "${context.slidesOutputDir}/js/", "${context.slidesOutputDir}/slides/", "${context.slidesOutputDir}/res/"],
      "dependencies": [],
      "thesisSources": null,
      "verification": {
        "type": "manual",
        "command": "ls ${context.slidesOutputDir}/",
        "expected": "目录结构: css/ js/ slides/ res/"
      },
      "rollback": {
        "strategy": "file-restore",
        "detail": "删除 ${context.slidesOutputDir}/ 目录"
      },
      "risk": "low",
      "estimatedMinutes": 1
    },
    {
      "id": 2,
      "title": "生成CSS统一样式文件",
      "description": "根据选定主题生成 css/style.css。\n\n【完整CSS设计令牌】\n:root {\n  /* ─ 色彩空间 ─ */\n  --canvas-bg; --canvas-surface; --core-brand;\n  --accent-glow(研究线A); --accent-2(研究线B); --accent-3(研究线C);\n  --aura-gradient;\n  /* ─ 文本色阶 ─ */\n  --text-hero; --text-body; --text-ghost;\n  /* ─ 间距与圆角 ─ */\n  --slide-padding: 5vh 5vw; --card-gap: clamp(12px,2vw,24px); --card-radius: 12px;\n  /* ─ 阴影与边框 ─ */\n  --card-shadow: 0 4px 24px rgba(0,0,0,0.3); --border-subtle: 1px solid rgba(255,255,255,0.06);\n  /* ─ 动画 ─ */\n  --ease-out: cubic-bezier(0.25,0.46,0.45,0.94); --duration-intro: 0.5s; --delay-step: 150ms;\n}\n\n【排版类】title-lg(clamp(36px,4vw,64px)/700), title-sm(clamp(22px,2.5vw,36px)/500), body-text(clamp(16px,1.5vw,24px)/400), text-ghost(clamp(12px,1vw,16px)/400), text-mono(clamp(14px,1.2vw,20px)/400)\n\n【版式类】slide-cover, slide-split, slide-grid, slide-data, slide-center\n\n【组件库】必须包含以下通用组件类:\n- .card + .card-title — 通用卡片\n- .grid-2 / .grid-3 / .grid-4 — 网格布局\n- .data-table + .best — 数据表格 + 最优值高亮\n- .list-items — 自定义圆点列表\n- .quote — 引用/金句\n- .formula — 公式容器\n- .flow-arrow + .flow-step + .flow-connector — 流程箭头\n- .big-number + .big-number-label — 大数字英雄展示\n- .tag + .tag-green + .tag-purple — 标签/徽章\n- .highlight / .highlight-2 / .highlight-3 — 多色高亮\n- .divider + .divider-center — 分隔线\n- .mb-1~.mb-4, .mt-auto, .text-center, .text-left — 辅助类\n\n【动画】@keyframes fadeIn (opacity:0+translateY(20px) → 正常)，.animate-in基类 + .delay-1到.delay-6(calc(var(--delay-step)*N))\n\n【卡片样式】纯色背景(--canvas-surface) + box-shadow(--card-shadow) + 边框(--border-subtle)，禁止backdrop-filter\n\n【必须参考】.flowcopilot/res/templates.md 中的 CSS基础模板",
      "category": "frontend",
      "files": ["${context.slidesOutputDir}/css/style.css"],
      "dependencies": [1],
      "thesisSources": null,
      "verification": {
        "type": "manual",
        "command": "检查 style.css 是否包含所有必需样式",
        "expected": "完整CSS设计令牌、.slide容器、排版类、组件库、动画关键帧、.animate-in基类、延迟类(.delay-1~.delay-6)均存在"
      },
      "rollback": {
        "strategy": "file-restore",
        "detail": "删除 css/style.css"
      },
      "risk": "low",
      "estimatedMinutes": 3
    },
    {
      "id": 3,
      "title": "生成JS控制脚本",
      "description": "生成 js/main.js，实现 SlideController 类: 键盘翻页(←→)、全屏(F键)、首末页(Home/End)、触摸滑动、页码指示器更新。\n\n【iframe过渡】300ms fadeOut → 设置 src → iframe.onload 事件触发 fadeIn（并设 800ms 安全回退策略，防止 onload 未触发）。\n\n【slideNames】数组包含所有页面文件名（带 .html 后缀，如 '01-cover.html'），索引 0 为空占位。\n\n【触摸事件】touchstart/touchend 使用 { passive: true } 参数，抽出独立 bindTouch() 方法，包含水平/垂直滑动判别(阈值50px)，仅水平滑动触发翻页。\n\n【必须参考】.flowcopilot/res/templates.md 中的 JS控制脚本模板",
      "category": "frontend",
      "files": ["${context.slidesOutputDir}/js/main.js"],
      "dependencies": [1],
      "thesisSources": null,
      "verification": {
        "type": "manual",
        "command": "检查 main.js 是否包含 SlideController 类和完整的翻页逻辑",
        "expected": "键盘绑定、触摸支持、全屏功能均实现"
      },
      "rollback": {
        "strategy": "file-restore",
        "detail": "删除 js/main.js"
      },
      "risk": "low",
      "estimatedMinutes": 3
    },
    {
      "id": 4,
      "title": "生成主入口index.html",
      "description": "生成 index.html 主入口文件。\n\n【强制16:9画幅】使用 min() 函数而非 aspect-ratio:\n.presentation-container { width: min(100vw, 177.78vh); height: min(100vh, 56.25vw); }\nbody { display: flex; align-items: center; justify-content: center; }\n\n【Flex布局】容器内部 flex-column：.slide-wrapper(flex:1) + .bottom-bar(flex-shrink:0)。\n\n【底部导航栏】使用 flex 内联布局（非 fixed 浮动），始终可见：\n- 左: 页码指示器 N / 总页数\n- 中: 快捷键提示（始终可见，非 hover 显示）\n- 右: 导航按钮 ◀ ▶ ⛶\n- 底部: 进度条（宽度随页码百分比变化）\n\n【样式】所有样式 inline，不依赖外部CSS。引用 js/main.js。\n\n【必须参考】.flowcopilot/res/templates.md 中的 index.html主入口模板",
      "category": "frontend",
      "files": ["${context.slidesOutputDir}/index.html"],
      "dependencies": [2, 3],
      "thesisSources": null,
      "verification": {
        "type": "manual",
        "command": "浏览器打开 index.html",
        "expected": "页面正常显示，导航按钮可见，iframe区域占满"
      },
      "rollback": {
        "strategy": "file-restore",
        "detail": "删除 index.html"
      },
      "risk": "low",
      "estimatedMinutes": 3
    }
  ]
}
```

### 页面步骤模板（第5步起，每页一步，含 thesisSources）

```json
{
  "id": 5,
  "title": "生成第1页: 封面页",
  "description": "【版式类型】slide-cover\n\n【论文源文件】无需读取论文内容，使用context元信息\n\n【页面规划MD】创建 slides/01-cover.md 规划文档:\n- 核心信息: 论文标题居中展示\n- 主视觉: 论文标题以 title-lg 居中\n- 辅助信息: 作者·学校·日期以 body-text 呈现\n- 入场: 标题(.animate-in.delay-1) → 副标题(.animate-in.delay-2) → 作者信息(.animate-in.delay-3)\n\n【HTML生成】创建 slides/01-cover.html:\n- 使用 slide-cover 居中布局\n- 学校Logo固定右上角\n- .animate-in + .delay-1~3 逐步展示\n- 引用 ../css/style.css\n- 页码: 1 / N\n\n【必须参考】.flowcopilot/res/templates.md 中的封面页模板",
  "category": "frontend",
  "files": ["${context.slidesOutputDir}/slides/01-cover.md", "${context.slidesOutputDir}/slides/01-cover.html"],
  "dependencies": [2, 4],
  "thesisSources": null,
  "verification": {
    "type": "manual",
    "command": "浏览器打开 slides/01-cover.html",
    "expected": "封面显示正常，标题清晰，配色协调，动画平滑"
  },
  "rollback": {
    "strategy": "file-restore",
    "detail": "删除 slides/01-cover.md 和 slides/01-cover.html"
  },
  "risk": "low",
  "estimatedMinutes": 5
}
```

### 内容页步骤模板（需要读取论文的页面）

```json
{
  "id": 7,
  "title": "生成第3页: 研究背景",
  "description": "【版式类型】slide-split\n\n【论文源文件】需按 thesisSources 指引读取论文章节，提取研究背景和问题定义\n\n【提取指引】从绪论章节中提取：研究背景（1-2句话）、核心问题定义、研究意义\n\n【页面规划MD】创建 slides/03-background.md\n【HTML生成】创建 slides/03-background.html:\n- 使用 slide-split 双栏布局\n- 学校Logo固定右上角\n- 左栏: 研究背景文字 (body-text)\n- 右栏: 问题定义或关键图表\n- .animate-in + .delay-N 逐步展示\n- 页面特有 <style> 定义自定义组件\n\n【必须参考】.flowcopilot/res/templates.md",
  "category": "frontend",
  "files": ["${context.slidesOutputDir}/slides/03-background.md", "${context.slidesOutputDir}/slides/03-background.html"],
  "dependencies": [2, 4],
  "thesisSources": {
    "files": [
      {
        "path": "chapters/ch1-intro.tex",
        "sections": ["1.1", "1.2"],
        "extractHint": "提取研究背景描述、核心问题定义、研究意义（各1-2句话）"
      }
    ],
    "fallbackSearch": "研究背景|问题定义|研究意义"
  },
  "verification": {
    "type": "manual",
    "command": "浏览器打开 slides/03-background.html",
    "expected": "研究背景内容准确，布局合理"
  },
  "rollback": {
    "strategy": "file-restore",
    "detail": "删除 slides/03-background.md 和 slides/03-background.html"
  },
  "risk": "low",
  "estimatedMinutes": 5
}
```

### 质量要求

- **thesisSources 必须精准**：每个内容页步骤的 `thesisSources.files[].path` 必须来自设计文档中的论文结构索引，`extractHint` 要具体到需要提取的内容类型（如"提取表3-1的实验对比数据"、"提取算法1的伪代码"）
- 每个步骤必须标注使用的**版式类型**（slide-cover / slide-split / slide-grid / slide-data / slide-center）
- 步骤描述中包含具体的**排版层级**（title-lg / title-sm / body-text / text-ghost）和**入场延迟**（.animate-in + .delay-1 ~ .delay-6）
- 每个页面步骤必须指定**研究线颜色**（accent-glow / accent-2 / accent-3 / 无）
- 每个页面步骤必须列出需要在 `<style>` 块中自定义的**页面特有组件**
- 每个页面HTML必须包含**学校Logo**（fixed定位右上角）
- 基础设施步骤引用 `.flowcopilot/res/templates.md`（主参考）
- `files` 数组同时包含 `.md` 规划文档和 `.html` 文件
- 最后一个 milestone 的 `afterStep` 设为最后一步的 id
- **封面页、目录页、致谢页**的 `thesisSources` 设为 `null`（不需要读论文）
- **所有内容页**的 `thesisSources` 必须非空，且指向正确的论文文件
