---
agent: agent
tools: ['search', 'read', 'edit', 'search/codebase']
description: 'Phase 1: 轻量结构扫描与演示骨架设计 — 只读论文骨架，不深读全文'
---
# Phase 1 — 轻量结构扫描与演示骨架设计

## 角色设定

你同时扮演 **学术答辩指导专家** 和 **资深演示设计师**。
当前对 ${context.projectName} 项目中的毕业论文执行答辩演示HTML的骨架设计工作。

## 用户需求（完整原文）

> 以下是用户提出的完整答辩演示需求描述，**不得遗漏任何细节**，后续所有设计分析均须覆盖此需求的全部要点：

${input}

## 论文基本信息

- **论文标题**: ${context.thesisTitle}
- **作者**: ${context.author}
- **学校/院系**: ${context.university} ${context.department}
- **指导教师**: ${context.advisor}
- **答辩日期**: ${context.defenseDate}
- **答辩时长**: ${context.totalMinutes} 分钟
- **论文目录**: `${context.thesisDir}`
- **论文主文件**: `${context.thesisMainFile}`
- **学校 Logo**: `${context.universityLogo}`（可选，若提供则在每页右上角显示）

## 任务概述

**只做轻量扫描**：读取论文目录结构和章节标题，建立"幻灯片↔论文章节"的映射关系，设计演示骨架。**不要深读论文全文内容**，深度阅读将在 Phase 3 的每个循环步骤中按需进行。

---

## Step 1 · 论文结构轻量扫描（严格控制阅读范围）

### ⚠️ 上下文控制原则

> **禁止**一次性读取论文所有 `.tex` 文件的完整内容。
> 本阶段只需获取论文的"骨架信息"，具体内容留给 Phase 3 按需深读。

### 扫描步骤

1. **读取论文主文件**：使用 `read` 工具读取 `${context.thesisMainFile}`，**只关注**：
   - `\chapter{}`、`\section{}`、`\subsection{}` 等结构命令 → 提取完整目录树
   - `\input{}`、`\include{}` 命令 → 记录所有子文件路径（**不要立即读取子文件全文**）
   - `\title{}`、`\author{}`、`\date{}` 等元信息

2. **读取摘要**：找到摘要所在的 `.tex` 文件，**只读取摘要章节**（通常 `\begin{abstract}...\end{abstract}`），提炼论文总体贡献（2-3句话）

3. **读取结论**：找到结论所在的 `.tex` 文件，**只读取结论章节**，提炼主要贡献和未来展望（2-3句话）

4. **搜索图表清单**：使用 `search` 工具在 `${context.thesisDir}` 目录下搜索 `\begin{figure}` 和 `\begin{table}`，**只记录标题（caption）和所在章节**，不读取图表的具体数据

5. **识别并行研究线（核心创新）**：从摘要和目录中识别论文的多个并行研究分支（如多个提出的算法/模型/方法）。为它们规划**颜色编码系统**，用不同的强调色（accent-glow / accent-2 / accent-3）区分各研究线，贯穿全部幻灯片，使答辩逻辑一目了然。

### 输出：论文结构索引

整理为以下格式的结构索引（这是本阶段的核心产出之一）：

```
| 章节编号 | 章节标题 | 所在文件路径 | 包含图表 | 预估重要程度 | 研究线/颜色编码 |
|---------|---------|-------------|---------|-------------|----------------|
| 1       | 绪论    | chapters/ch1.tex | 图1-1 | ★★☆ | — |
| 3       | 方法A   | chapters/ch3.tex | 图3-1, 表3-1 | ★★★ | 线1 / accent-glow |
| 4       | 方法B   | chapters/ch4.tex | 图4-1, 表4-1 | ★★★ | 线2 / accent-2 |
| ...     | ...     | ...         | ...     | ...         | ... |
```

> **"预估重要程度"** 基于摘要和结论中的关键词匹配判断，★★★ = 核心创新章节，★★☆ = 重要支撑，★☆☆ = 可简略带过。

---

## Step 2 · 演示主题与风格确定

### 艺术级色彩美学系统

本系统采用五维色彩空间：空间基底(Canvas)、容器表面(Surface)、主要情绪(Core)、视觉张力(Accent ×3)、光影渐变(Aura Gradient)。根据论文学科领域和用户偏好，从以下主题中选择：

| 主题ID | 美学流派 & 适用场景 | 空间基底 Canvas | 容器表面 Surface | 主情绪 Core | 强调色 Accent ×3 | 光影渐变 Aura |
|--------|---------------------|----------------|-----------------|-------------|------------------|--------------|
| `academic-pro` | 学院深邃 / 答辩与科研 | #0F172A | #1E293B | #F1F5F9 | #38BDF8 · #34D399 · #A78BFA | linear-gradient(180deg, #0F172A, #1E293B) |
| `fluid-glass` | 流体玻璃态 / 优雅产品 | #F8FAFC | #FFFFFF | #1E293B | #6366F1 · #EC4899 · #F59E0B | radial-gradient(circle, #E0E7FF, #F3F4F6) |
| `cyber-nova` | 赛博未来 / AI与科技 | #0A0A0C | #1A1A2E | #ECECEC | #00FFA3 · #00D4FF · #FF6B6B | linear-gradient(135deg, #00C6FF, #0072FF) |
| `zen-minimal` | 极简侘寂 / 高级汇报 | #F5F5F3 | #FFFFFF | #2C2C2A | #D4A373 · #6B8F71 · #9B8EC0 | linear-gradient(120deg, #F5F5F3, #E8E8E6) |
| `eco-organic` | 自然呼吸 / 公益与健康 | #FAF9F6 | #FFFFFF | #224229 | #D97A35 · #15803D · #0EA5E9 | linear-gradient(to right, #A3B18A, #D1D8C5) |
| `luxury-gold` | 传世雅黑 / 顶级商业 | #111111 | #1F1F1F | #F4F4F4 | #D4AF37 · #C0C0C0 · #B87333 | linear-gradient(45deg, #111111, #2A2A2A) |

**多强调色系统**：每个主题提供 3 个强调色 (`--accent-glow`, `--accent-2`, `--accent-3`)，用于区分并行研究线。例如 `academic-pro` 中的天际蓝 / 翡翠绿 / 薰衣紫分别对应三条研究线。

如用户指定了 `${context.theme}`，优先使用用户指定的主题。否则充当"艺术指导"(Art Director)，根据论文情绪与学科氛围自动选择并微调色彩系统。

> **推荐**：毕业答辩场景首选 `academic-pro`（深沉稳重）或 `fluid-glass`（清新优雅）。

### 设计风格原则

- **学术严谨**：内容准确、数据可追溯、逻辑清晰
- **内容精炼**：单页核心文字控制在 **80字以内**（展示数据/公式/表格不计入），多余留给口头讲解
- **清晰层次**：使用明确的字号对比建立视觉层次（标题 `clamp(36px,4vw,64px)` + 正文 `clamp(16px,1.5vw,24px)`）
- **充足留白**：画布四周保持足够内边距（`padding: 5vh 5vw`），保持页面清爽
- **简洁边框**：避免粗黑边框，使用微妙投影(`box-shadow: 0 4px 24px rgba(0,0,0,0.3)`)和淡色边框(`1px solid rgba(255,255,255,0.06)`)区分区域
- **平滑动效**：元素入场统一使用 `fadeIn`（opacity + translateY(20px)），配合 `.animate-in` + `.delay-N` 延迟序列逐步展示。**禁止** blur、弹簧缓动、slideInLeft/Right 等花哨效果
- **颜色编码一致**：同一研究线/算法在所有页面中使用同一强调色（如蓝/绿/紫），形成视觉关联
- **节奏合理**：按答辩时长分配各章节页数
- **投影友好**：确保字体最小14px、对比度充足，后排观众也能看清
- **页面特有样式**：每页 HTML 的 `<style>` 块中定义该页独有的自定义组件样式（如特殊卡片、流程节点等），全局 CSS 只提供基础令牌和通用组件

---

## Step 3 · 页面结构规划

### 时间分配

根据 ${context.totalMinutes} 分钟答辩时长，按以下比例分配：

| 部分             | 时长占比 | 建议页数   |
| ---------------- | -------- | ---------- |
| 开场（封面+目录）| 5%       | 2页        |
| 研究背景与意义   | 15%      | 2-3页      |
| 研究方法/模型    | 30%      | 4-6页      |
| 实验与结果       | 30%      | 4-6页      |
| 结论与展望       | 15%      | 2-3页      |
| 致谢             | 5%       | 1页        |

### 版式类型（页面布局）

为每一页选择最适合的版式，保持视觉节奏变化：

1. **居中封面 (slide-cover)**: 标题居中突出，下方附带作者/学校/日期信息。适用于：封面页
2. **双栏分割 (slide-split)**: 左右分栏（如 55:45 或 60:40），一侧说明一侧图表/数据。适用于：背景页、方法改进策略页、流程页
3. **卡片网格 (slide-grid)**: 多卡片网格布局（grid-2/grid-3/grid-4），各卡片使用研究线对应颜色的左边框/顶部光条区分。适用于：创新点总览、方法对比、总结页
4. **数据突出 (slide-data)**: 大数字英雄区(big-number) + 排名表 + 实验图表。适用于：基准测试结果、分割实验结果
5. **居中语句 (slide-center)**: 居中展示核心论点或致谢。适用于：引言页、致谢页
6. **目录页 (slide-split 变体)**: 左60%编号列表 + 右40%装饰大字，核心章节颜色高亮

### 学术论文特化页面类型

根据论文中每个研究线/算法的内容，通常需要以下 4 类子页面（每条研究线一组）：

| 子页面类型 | 版式 | 核心内容 | 视觉焦点 |
|-----------|------|---------|---------|
| **改进策略页** | slide-split | 左栏：策略卡片 + 公式；右栏：消融实验数据 | 左栏核心公式 |
| **算法流程页** | slide-split / slide-data | 左栏：带时间线的步骤列表；右栏：分割模型流程 | 步骤轨道(step-track) |
| **基准测试页** | slide-data | 英雄数字 + 排名表 + 雷达/箱线图 | 大数字 .big-number |
| **分割实验页** | slide-data | 分割结果图 + Friedman排名表 + 热力图 | 顶部分割对比图 |

---

## Step 4 · 逐页骨架设计（不含论文深度内容）

对规划的每一页，输出以下**骨架级**设计。注意：此处只需确定版式、布局、论文章节映射，**不需要填入论文的具体文字/数据内容**（那些留给 Phase 3 按需读取）：

```
### 第 N 页: {页面标题}

- **版式类型**: slide-cover / slide-split / slide-grid / slide-data / slide-center
- **对应论文章节**: 第X章 / 第X.Y节
- **论文源文件**: {对应的 .tex 文件路径}
- **需提取的内容类型**: [核心论点 / 关键数据 / 图表 / 公式 / 流程图]
- **提取指引**: 简述从该章节中应提取什么（如"提取实验对比表格的3组核心数据"）
- **研究线颜色**: accent-glow / accent-2 / accent-3 / 无（非特定研究线页面）

#### 版式规划
- **空间主角 (The Hero)**: 本页的主视觉焦点类型（巨大数字？架构图？核心结论？）
- **空间分配**: 描述内容区域分配（如"左55% 右45%"、"顶部标题 + 三列卡片"）
- **视觉动线**: 视线第一落点 → 游走轨迹 → 最终落点

#### 排版层级
- **字号层级**: title-lg / title-sm / body-text / text-ghost 的使用方式
- **入场延迟**: delay-1 → delay-N 的元素分配

#### 页面特有组件
- 列出该页需要在 `<style>` 块中自定义的组件（如 strategy-card, step-track, data-hero, rank-table 等）

- **讲解要点**: （答辩时口头补充的关键说明方向，不需要具体内容）
- **预计讲解时长**: X分钟
```

---

## Step 5 · 资源目录规划

规划 `res/` 资源目录结构，用于存放图片和实验可视化资源：

```
res/
├── {学校logo文件}          # 学校 Logo（PNG，每页右上角显示）
├── {按研究线分组的子目录}   # 如 swarm1/, swarm2/, swarm3/
│   ├── 雷达图.png
│   ├── 箱线图_F*.png
│   └── 热力图.png
└── {通用资源}              # 如框架示意图等
```

---

## 输出要求

请一次性将完整的设计文档保存到 `${output.path}`，包含以下结构：

```
# ${context.thesisTitle} — 答辩演示骨架设计文档

## 1. 论文结构索引
  （章节编号 | 章节标题 | 所在文件路径 | 包含图表 | 重要程度 | 研究线/颜色编码）

## 2. 论文概要（仅基于摘要和结论）
  - 研究主题（1句话）
  - 核心贡献（2-3条）
  - 主要结论（1-2条）
  - 并行研究线识别（列出各研究线名称及对应颜色编码）

## 3. 演示设计方案
  - 配色主题: {选定主题及理由}
  - 总页数: N页
  - 答辩时长分配
  - 颜色编码映射：研究线A → accent-glow, 研究线B → accent-2, ...

## 4. 逐页骨架设计
  ### 第1页: 封面
    - 版式 / 对应章节 / 源文件路径 / 需提取内容类型 / 研究线颜色
    - 页面特有组件列表
  ### 第2页: 目录
  ### 第3页: ...
  ...
  ### 第N页: 致谢

## 5. 目录结构规划
  {slidesOutputDir}/
  ├── index.html
  ├── css/style.css
  ├── js/main.js
  ├── res/                    # ⬅️ 资源目录
  │   ├── {学校logo}
  │   └── {研究线子目录}/
  └── slides/
      ├── 01-cover.md + .html
      ├── 02-toc.md + .html
      └── ...

## 6. 设计规范

  ### 排版层级
  | 层级 | 流体尺度 | 字重/行高 | 用途 |
  |------|---------|----------|----------|
  | 标题 .title-lg | clamp(36px, 4vw, 64px) | 700 / 1.15 | 页面主标题 |
  | 副标题 .title-sm | clamp(22px, 2.5vw, 36px) | 500 / 1.4 | 副标题/小标题 |
  | 正文 .body-text | clamp(16px, 1.5vw, 24px) | 400 / 1.7 | 正文内容 |
  | 辅助 .text-ghost | clamp(12px, 1vw, 16px) | 400 / 1.5 | 页码/注释 |
  | 等宽 .text-mono | clamp(14px, 1.2vw, 20px) | 400 / 1.6 | 公式/代码 |

  ### CSS 完整设计令牌体系
  ```css
  :root {
    /* ── 色彩空间 ── */
    --canvas-bg: {背景色};
    --canvas-surface: {卡片/容器背景色};
    --core-brand: {主色};
    --accent-glow: {强调色1 — 研究线A};
    --accent-2: {强调色2 — 研究线B};
    --accent-3: {强调色3 — 研究线C};
    --aura-gradient: {光影渐变};

    /* ── 文本色阶 ── */
    --text-hero: {标题色，对比度≥7:1};
    --text-body: {正文色，对比度≥4.5:1};
    --text-ghost: {辅助色，页码/注释};

    /* ── 间距与圆角 ── */
    --slide-padding: 5vh 5vw;
    --card-gap: clamp(12px, 2vw, 24px);
    --card-radius: 12px;

    /* ── 阴影与边框 ── */
    --card-shadow: 0 4px 24px rgba(0, 0, 0, 0.3);
    --border-subtle: 1px solid rgba(255, 255, 255, 0.06);

    /* ── 动画 ── */
    --ease-out: cubic-bezier(0.25, 0.46, 0.45, 0.94);
    --duration-intro: 0.5s;
    --delay-step: 150ms;
  }
  ```

  ### CSS 组件库清单
  style.css 中须包含以下通用组件类：
  - `.card` + `.card-title` — 通用卡片
  - `.grid-2` / `.grid-3` / `.grid-4` — 网格布局
  - `.data-table` + `.best` — 数据表格 + 最优值高亮
  - `.list-items` — 自定义圆点列表
  - `.quote` — 引用/金句
  - `.formula` — 公式容器
  - `.flow-arrow` + `.flow-step` + `.flow-connector` — 流程箭头
  - `.big-number` + `.big-number-label` — 大数字英雄展示
  - `.tag` + `.tag-green` + `.tag-purple` — 标签/徽章
  - `.highlight` / `.highlight-2` / `.highlight-3` — 多色高亮
  - `.divider` + `.divider-center` — 分隔线
  - `.mb-1` ~ `.mb-4`, `.mt-auto`, `.text-center`, `.text-left` — 间距/对齐辅助
  - `.animate-in` — 入场动画基类
  - `.delay-1` ~ `.delay-6` — 延迟序列 (使用 `calc(var(--delay-step) * N)`)

  ### 动画规范
  - 入场动画: fadeIn (opacity:0 + translateY(20px) → 正常)，时长0.5s
  - 全部使用 `.animate-in` 基类 + `.delay-N` 延迟类
  - 延迟序列: delay-1 到 delay-6，使用 `calc(var(--delay-step) * N)` 计算
  - **禁止** blur 动画、弹簧缓动、slideInLeft/Right、scaleIn 等多种动画

  ### index.html 16:9 画幅强制方案
  使用 `min()` 函数确保容器在任意窗口比例下都保持 16:9：
  ```css
  .presentation-container {
    width: min(100vw, 177.78vh);   /* 宽度不超过视口，也不超过 高度×16/9 */
    height: min(100vh, 56.25vw);   /* 高度不超过视口，也不超过 宽度×9/16 */
  }
  body { display: flex; align-items: center; justify-content: center; }
  ```
  底部导航栏使用 **flex 内联布局**（非 fixed 浮动），始终可见。包含：
  - 左：页码指示器 `N / 总页数`
  - 中：快捷键提示（始终可见，非 hover 显示）
  - 右：导航按钮 ◀ ▶ ⛶
  - 底部：进度条（宽度随页码百分比变化）

  ### 学校 Logo 放置规范
  每页 HTML `<body>` 开头添加 Logo 图片：
  ```html
  <img src="../res/{logo文件}" alt="{学校名}"
       style="position:fixed;top:14px;right:20px;height:52px;z-index:9999;
              opacity:1;pointer-events:none;background:rgba(255,255,255,0.92);
              border-radius:8px;padding:4px 8px;">
  ```
```

> 注意：输出的设计文档是后续 Phase 2（逐页规划与步骤拆解）的唯一输入，务必完整、准确。每页设计需包含足够的内容细节，使得后续生成HTML时无需再回读论文原文。
> **关键约束**：本文档是演示的"骨架"，不是最终内容。每页设计只需指明「从哪个论文章节提取什么类型的内容」，**不需要包含论文的实际文字/数据**。Phase 2 会将这些映射关系写入每个步骤，Phase 3 再按需深读对应章节。