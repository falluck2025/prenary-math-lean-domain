import Mathlib

/- ================================================================
   偏元数学 · Day 5-03（2026-08-20）
   目标：偏元四则运算（第③步）—— 经典结果 + 动作留差 ε
   依据：V2-DIC 新长征版
   核心：任何动作留差 ε，四则运算 = 经典结果 + ε
         ε=0 退化为经典；ε≠0 留差；加减不是逆操作
   ================================================================ -/

-- 动作留差（复用 Day5）：偏元运算 = 经典结果 + 动作的差 ε
noncomputable def prenary_apply (classic_result ε : ℂ) : ℂ :=
  classic_result + ε

-- 偏元加法
noncomputable def prenary_add (a b ε : ℂ) : ℂ :=
  prenary_apply (a + b) ε

-- 偏元减法
noncomputable def prenary_sub (a b ε : ℂ) : ℂ :=
  prenary_apply (a - b) ε

-- 偏元乘法
noncomputable def prenary_mul (a b ε : ℂ) : ℂ :=
  prenary_apply (a * b) ε

-- ① 加法退化：ε=0 时退化为经典加法
theorem prenary_add_degenerate (a b : ℂ) :
    prenary_add a b 0 = a + b := by
  simp [prenary_add, prenary_apply]

-- ② 减法退化
theorem prenary_sub_degenerate (a b : ℂ) :
    prenary_sub a b 0 = a - b := by
  simp [prenary_sub, prenary_apply]

-- ③ 乘法退化
theorem prenary_mul_degenerate (a b : ℂ) :
    prenary_mul a b 0 = a * b := by
  simp [prenary_mul, prenary_apply]

-- ④ 加法非平凡（留差）：ε≠0 时，偏元加法 ≠ 经典加法
theorem prenary_add_non_trivial {a b ε : ℂ} (hε : ε ≠ 0) :
    prenary_add a b ε ≠ a + b := by
  intro h
  have hε0 : ε = 0 := by
    have h' : (a + b) + ε = a + b := by
      simpa [prenary_add, prenary_apply] using h
    have hsub : ((a + b) + ε) - (a + b) = (a + b) - (a + b) := by
      exact congrArg (fun x => x - (a + b)) h'
    simpa using hsub
  exact hε hε0

-- ⑤ 加减不是逆操作（核心焊点）：(a ⊕ b) ⊖ b ≠ a
theorem add_sub_not_inverse {a b εadd εsub : ℂ} (h : εadd + εsub ≠ 0) :
    prenary_sub (prenary_add a b εadd) b εsub ≠ a := by
  intro h'
  have h0 : εadd + εsub = 0 := by
    have hexpand : prenary_sub (prenary_add a b εadd) b εsub = a + (εadd + εsub) := by
      simp [prenary_sub, prenary_add, prenary_apply]
      ring
    have h'' : a + (εadd + εsub) = a := by
      rw [hexpand] at h'
      exact h'
    have hsub : (a + (εadd + εsub)) - a = a - a := by
      exact congrArg (fun x => x - a) h''
    simpa using hsub
  exact h h0
