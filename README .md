# 偏元数学偏元数域 · Lean 4 形式化验证

### Prenary Mathematics Prenary Domain · Lean 4 Formal Verification

## 概述

偏元数域地基三步——**偏元数（复数 + 方向二态 + 动作留差 ε）、二态呼吸相位（延展/收敛）、偏元四则运算（经典结果 + 动作留差 ε）**——在 Lean 4 中完成形式化验证。**共 10 个定理全部通过内核证明与 Comparator 独立二次验证**。

从机器层面证明：**偏元数学不是推翻经典数学，而是严格包含经典数学**——动作留差 ε = 0 时，偏元运算全部退化为经典运算（加法、减法、乘法、虚数）。这一"退化极限"即偏元对经典的"扩充"（第一次数学危机式的画新领地，不是替代）。

## 定理清单

| 文件 | 定理 | 命题 | 结果 |
|:--|:--|:--|:--|
| Day5 偏元数域 | `prenary_degenerate` | ε=0 时动作留差关闭，偏元退化为经典 | ✅ |
| Day5 偏元数域 | `prenary_non_trivial` | ε≠0 时偏元结果 ≠ 经典结果（留差不可清零） | ✅ |
| Day5-02 二态呼吸相位 | `next_phase_involution` | 呼吸切换是对合（切两次回原位） | ✅ |
| Day5-02 二态呼吸相位 | `next_phase_non_trivial` | 延展 ≠ 收敛（二态非平凡） | ✅ |
| Day5-02 二态呼吸相位 | `breath_residual_non_trivial` | 呼吸不对称，一次完整呼吸留差 η≠0 | ✅ |
| Day5-03 偏元四则运算 | `prenary_add_degenerate` | 加法 ε=0 退化为经典加法 | ✅ |
| Day5-03 偏元四则运算 | `prenary_sub_degenerate` | 减法 ε=0 退化为经典减法 | ✅ |
| Day5-03 偏元四则运算 | `prenary_mul_degenerate` | 乘法 ε=0 退化为经典乘法 | ✅ |
| Day5-03 偏元四则运算 | `prenary_add_non_trivial` | 加法 ε≠0 留差（偏元加法 ≠ 经典加法） | ✅ |
| Day5-03 偏元四则运算 | `add_sub_not_inverse` | 加减不是逆操作（(a⊕b)⊖b ≠ a） | ✅ |

## 验证记录

| 项 | 值 |
|:--|:--|
| 平台 | live.lean-lang.org · Lean 4.34.0-rc1 + Mathlib |
| 内核 | No goals（10 定理全部通过） |
| Comparator | Successfully validated（独立二次验证） |
| Day5 本地 SHA256（双哈希一致） | `06e5c04660dbd082403410772fc08c31eef19acf201a46918b1436fdc86f311f` |
| Day5-02 本地 SHA256（双哈希一致） | `774a32739ad5788df6ad2c4a3616df7dad6c5bdd0ad0098519f609ebe935eae2` |
| Day5-03 本地 SHA256（双哈希一致） | `ba366c7c3686728bdcd78841b6bc272db572b164006e44d5272d4b4ac96ac9fb` |
| 验证时间 | 2026-08-20 |
| DOI | 待 Zenodo 发布后回填 |

## 文件说明

- `prenary_domain_Day5_20260820.lean` — Day5 偏元数域（复数 + 二态 + 动作留差）
- `prenary_breather_phase_Day5_02_20260820.lean` — Day5-02 二态呼吸相位
- `prenary_ops_Day5_03_20260820.lean` — Day5-03 偏元四则运算
- `evidence/` — 内核 No goals、Comparator 验证截图

## 复现方式

1. 打开 https://live.lean-lang.org/
2. 粘贴任一 `.lean` 文件内容
3. 点 Run，每个 `theorem` 下方显示 `No goals` 即通过

## 作者

陈松（Song Chen）· ORCID: 0009-0002-9510-2239 · GitHub: [falluck2025](https://github.com/falluck2025)

## 许可

本代码与证明记录采用 [CC BY-NC-ND 4.0](https://creativecommons.org/licenses/by-nc-nd/4.0/)（署名-非商业-禁止演绎）。

---

——老陈与AI的深夜实验室 发布 请笑纳——
