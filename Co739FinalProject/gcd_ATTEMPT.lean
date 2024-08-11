
import Mathlib.FieldTheory.Finite.Basic
import Mathlib.Data.PNat.Prime
-- import Mathlib.Data.Nat.GCD.basic
-- import Mathlib.Data.Nat.totient
-- import Mathlib.Data.FieldTheory.Finite


-- the following problem has been taken from Math 135 Fall 2021 Assignment
-- we want to show that: Let k is a positive integer,
--       gcd(k, 2ⁿ + 3ⁿ + 6ⁿ -11) = 1 for every integer n ≥ 2 if and only if k = 1

theorem k_nat_ne_1 (k: ℕ) (k_pos: k ≥ 1 ) (h: ¬ (k = 1)) : k > 1 := by
  by_contra not_k_geq_1

  have  k_le_1: k ≤ 1 := le_of_not_gt not_k_geq_1
  have not_k_geq_1_copy : ¬ k > 1 := not_k_geq_1
  -- cases
  -- have kgeq1:
  apply le_of_not_gt at not_k_geq_1
  apply le_antisymm at not_k_geq_1
  apply le_of_not_gt at not_k_geq_1_copy
  cases k_le_1
  · apply h
    rfl
    
  -- apply h at not_k_geq_1
  have k_leq_1: k ≤ 1 := by
    apply not_k_geq_1

  --!!!!!!! what about lt_of_le_not_le




-- corrollary to fermat's little theorem:
theorem flt_col (n : ℕ ) ( p: PNat ) (hp: p.Prime) : Nat.pow n p  % p = n % p := by
  -- apply Nat.ModEq.pow_totient (hp.one_lt) ne_of_gt
  -- I believe this is a certain case of Nat.ModEq.pow_totient
  sorry

theorem flt_col_ver_2 (n: ℕ) (p: PNat) (hp: p.Prime) : Nat.pow n p ≡ n [MOD p] := by
  sorry

#check Nat.pos_of_neZero

theorem gcd_k_1 (k: ℕ+):
  (∀ n: ℕ, n ≥ 2 → Nat.gcd k (Nat.pow 2 n + Nat.pow 3 n + Nat.pow 6 n - 11) = 1 ↔ k = 1) := by
  intro a
  constructor
  · intro gcd_hyp
    by_contra k_neq_1
    have k_ne_1: k ≠ 1 := by sorry
    obtain ⟨ p, p_prime, p_div_k  ⟩ := PNat.exists_prime_and_dvd k_ne_1
    -- let pow_sum (n : ℕ) := Nat.pow 2 n + Nat.pow 3 n + Nat.pow 6 n - 11
    have two_pow_p : Nat.pow 2 p % p= (2 % p) := by rw [flt_col 2 p p_prime]
    have three_pow_p : Nat.pow 3 p % p= (3 % p) := by rw [flt_col 3 p p_prime]
    have six_pow_p : Nat.pow 6 p % p= (6 % p) := by rw [flt_col 6 p p_prime]
    have pow_sum : (Nat.pow 2 p + Nat.pow 3 p + Nat.pow 6 p - 11) % p = 0 % p := by
      -- refine Nat.mod_eq_of_modEq ?h ?hb
      -- apply Nat.mod_eq_of_modEq -- will probably need to convert to MOD
      have mod_distributive: (Nat.pow 2 p + Nat.pow 3 p + Nat.pow 6 p + 11) % p  =
      (Nat.pow 2 p % p + Nat.pow 3 p % p + Nat.pow 6 p % p + 11 % p) := by
        rw [two_pow_p, three_pow_p, six_pow_p]
        sorry
        -- rw [← neg_add_eq_sub 11]


    -- rewrite
    have two_pow_p : Nat.pow 2 p % p= (2 % p) := by rw [flt_col 2 p p_prime]
    have three_pow_p : Nat.pow 3 p % p= (3 % p) := by rw [flt_col 3 p p_prime]
    have six_pow_p : Nat.pow 6 p % p= (6 % p) := by rw [flt_col 6 p p_prime]


    -- have k_ge_1 : k > 1 by:= sorry

    -- fill in the rest
    -- have k_ne : k > 0 := Nat.pos_of_neZero (ne_of_gt k_geq_1)
    -- rw [not_true_eq_false] at k_geq_1
    -- have k_geq_1 : k > 1 := le_of_not_gt k_geq_1
    sorry
  · -- this is the easy direction
    intro k_eq_1
    intro a_geq_2
    rw [k_eq_1]
    apply Nat.gcd_one_left
