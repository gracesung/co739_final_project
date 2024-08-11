-- divisibility of integer combinations (DIC)
import Mathlib.Data.Int.GCD

theorem dic {a b c : ℤ } (a_div_b: a ∣ b) (a_div_c: a ∣ c):  ∀ x y : ℤ,  a ∣ (b*x + c*y) := by
  intro x y
  obtain ⟨g, hg⟩ := a_div_b -- rewrite b from definition of divides
  obtain ⟨m, hm⟩ := a_div_c -- rewrite c from definition of divides
  rw [hm]
  rw [hg]
  rw [mul_assoc]
  rw [mul_assoc]
  rw[← Int.mul_add]
  apply dvd_mul_right


-- a result that follows from dic
theorem dic_result {a b c : ℤ } (a_not_div_b: ¬ a ∣ b) (a_div_b_sum_c: a ∣ (b + c)) : ¬ a ∣ c := by
  by_contra a_div_c
  have a_div_b: a ∣ b :=  by
    -- rearrange the goal a ∣ b to fit dic format
    rw[← add_zero b]
    rw [← sub_self c ]
    rw [add_sub]
    rw [← one_mul (b+c)]
    rw [sub_eq_neg_add]
    rw [add_comm]
    rw [mul_comm]
    rw [Eq.symm (Int.mul_neg_one c)]
    -- after rearranging, we can use dic as proved above
    apply dic a_div_b_sum_c a_div_c
  -- use the contradicting hypothesis to get to a contradiction
  apply a_not_div_b
  exact a_div_b
