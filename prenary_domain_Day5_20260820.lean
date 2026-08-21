import Mathlib

/- ================================================================
   偏元数学 · Day 5（2026-08-20）
   目标：偏元数域地基 —— 偏元数 = 复数 + 方向二态 + "动作留差" ε
   核心（今天对齐的）：
     偏元数学 = 经典数学 + "动作留差"机制（不改变经典，只加"差"）
     ε = 0 时退化为经典数学
   ================================================================ -/

-- ① 方向偏好二态（延展/收敛）
inductive Direction where
  | expansion   -- 延展
  | contraction -- 收敛
deriving DecidableEq

-- ② 偏元数：复数底数 + 方向二态
structure Prenary where
  value : ℂ
  dir : Direction

-- ③ "动作留差"机制：偏元运算 = 经典结果 + 动作的差 ε
noncomputable def prenary_apply (classic_result ε : ℂ) : ℂ :=
  classic_result + ε

-- ④ 退化定理（核心）：ε = 0 时，动作留差关闭，偏元退化为经典
theorem prenary_degenerate (classic_result : ℂ) :
    prenary_apply classic_result 0 = classic_result := by
  simp [prenary_apply]

-- ⑤ 动作留差非零：ε ≠ 0 时，偏元结果 ≠ 经典结果（留了差，不可清零）
theorem prenary_non_trivial {classic_result ε : ℂ} (hε : ε ≠ 0) :
    prenary_apply classic_result ε ≠ classic_result := by
  intro h
  have hε0 : ε = 0 := by
    have h' : classic_result + ε = classic_result := by
      simpa [prenary_apply] using h
    have hsub : (classic_result + ε) - classic_result = classic_result - classic_result := by
      exact congrArg (fun x => x - classic_result) h'
    simpa using hsub
  exact hε hε0
